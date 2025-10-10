import 'package:chat_app_mk/components/my_textfield.dart';
import 'package:chat_app_mk/services/auth/auth_service.dart';
import 'package:chat_app_mk/services/chat/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatelessWidget {
  final String recieverName;
  final String receiverID;
  ChatPage({super.key, required this.recieverName, required this.receiverID});

  final TextEditingController _messageController = TextEditingController();
  final ChatServices _chatServices = ChatServices();
  final AuthService _authService = AuthService();

  Future<void> sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatServices.sendMessage(receiverID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat with $recieverName')),
      body: Scaffold(
        body: Column(
          children: [
            Expanded(child: _buildMessageList()),
            _buildUserInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatServices.getMessages(receiverID, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading');
        }
        return ListView(
          children: snapshot.data!.docs
              .map((doc) => _buildMessageItem(doc))
              .toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    // is current user
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;
    // align message to the right if the sender is the current user, otherwise left
    var alignment = isCurrentUser
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: isCurrentUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [Text(data['message'])],
      ),
    );
  }

  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
          child: MyTextfield(
            controller: _messageController,
            hintTextHere: "Type a message",
            obscure: false,
            keyboardType: TextInputType.text,
          ),
        ),
        IconButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            sendMessage();
          },
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }
}
