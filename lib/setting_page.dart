import 'package:flutter/material.dart';

import 'drawer.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: const Text('설정'),

    ),
    drawer: const MyDrawer(),
    body: const Center(
      child: Text('설정 페이지'),
    ),
    );
  }
}
