import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final supabase = Supabase.instance.client;
  final List<Map<String, dynamic>> _messages =[];
  final TextEditingController _controller = TextEditingController();

  Future<void> _loadMessages() async
  {
    final data = await supabase.from("messages").select().order('created_at',ascending: false);
    setState(() {
      _messages.clear();
      _messages.addAll(List<Map<String, dynamic>>.from)
    });
  }


  void _sendMessage() {
    final text = _controller.text.trim();
    if(text.isNotEmpty){
      setState(() {
        _messages.insert(0, text); //최신 메세지를 추가하려고
        _controller.clear();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("채팅")),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
          itemBuilder: (context,index){
                return ListTile(
                  title: Text(_messages[index]),
                );
          },)

          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12) ,
              child: Row(
                children: [
                  Expanded(child: TextField(
                    controller: _controller,
                    onSubmitted: (_) => _sendMessage(),
                    decoration: const InputDecoration(
                      hintText: "메세지 입력...",
                      border: OutlineInputBorder()
                    ),
                  )),
              const SizedBox(width: 8),
              IconButton(onPressed: _sendMessage, icon: const Icon(Icons.send))
                ],

              ),
          )
        ],
      )
    );
  }
}
