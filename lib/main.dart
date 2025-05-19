import 'package:chungju_lecture/login_page.dart';
import 'package:chungju_lecture/signup_page.dart';
import 'package:chungju_lecture/todo_local_page.dart';
import 'package:chungju_lecture/todo_remote.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'home_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // ✅ .env 파일 로딩
  await dotenv.load(fileName: '.env'); // 기본: .env

  // ✅ Supabase 초기화
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do 프로젝트',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/todo-local': (context) => const TodoLocalPage(),
        '/todo-remote': (context) => const TodoRemotePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage()
      },
    );
  }
}