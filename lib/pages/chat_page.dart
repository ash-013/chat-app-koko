import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String recieverName;
  const ChatPage({super.key, required this.recieverName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat with $recieverName')),
      body: Scaffold(),
    );
  }
}
