import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import '../../controllers/home/group_chat/groupchat_controller.dart';
import '../home/group_chat/chat_settings.dart';


class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatController chatController = Get.put(ChatController());
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            // Navigate to ChatSettingsPage when the app bar is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatSettingsPage()),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_pic.png'), // Replace with the actual image path or network image
                radius: 20,
              ),
              SizedBox(width: 10),
              Text('Group Chat Name'), // Replace with the actual group chat name
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GetX<ChatController>(
              builder: (controller) {
                return ListView.builder(
                  reverse: false,
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    return ChatMessageWidget(
                      message: controller.messages[index],
                    );
                  },
                );
              },
            ),
          ),
          ChatInputField(
            controller: messageController,
            onSendPressed: () {
              if (messageController.text.isNotEmpty) {
                chatController.sendMessage(messageController.text);
                messageController.clear();
              }
            },
            onImagePressed: () async {
              final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                chatController.sendImage(pickedFile.path);
              }
            },
            onFilePressed: () async {
              final result = await FilePicker.platform.pickFiles();
              if (result != null && result.files.single.path != null) {
                chatController.sendFile(result.files.single.path!);
              }
            },
          ),
        ],
      ),
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;

  ChatMessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
      child: Column(
        crossAxisAlignment: message.isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.sender,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: message.isMine ? Colors.blue[100] : Colors.grey[300],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                if (message.imageUrl != null)
                  Image.file(
                    File(message.imageUrl!),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                if (message.fileUrl != null)
                  GestureDetector(
                    onTap: () async {
                      final url = message.fileUrl!;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.attach_file),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              'File',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (message.text.isNotEmpty) Text(message.text),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
              decoration: const InputDecoration(
                hintText: 'Type a message',
                border: InputBorder.none,
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
