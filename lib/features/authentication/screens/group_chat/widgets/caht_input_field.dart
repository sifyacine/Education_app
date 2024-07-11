import 'package:flutter/material.dart';




class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSendPressed;
  final VoidCallback onImagePressed;
  final VoidCallback onFilePressed;

  ChatInputField({
    required this.controller,
    required this.onSendPressed,
    required this.onImagePressed,
    required this.onFilePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: onImagePressed,
          ),
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: onFilePressed,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type a message',

              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: onSendPressed,
          ),
        ],
      ),
    );
  }
}
