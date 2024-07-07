import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import '../../controllers/group_chat/groupchat_controller.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GetX<ChatController>(
              init: ChatController(),
              builder: (controller) {
                return ListView.builder(
                  reverse: true,
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
          ChatInputField(),
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
            child: Text(message.text),
          ),
        ],
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    Get.find<ChatController>().sendMessage(
      ChatMessage(
        sender: 'Me',
        text: _controller.text.trim(),
        isMine: true,
      ),
    );
    _controller.clear();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Get.find<ChatController>().sendMessage(
        ChatMessage(
          sender: 'Me',
          text: 'Sent an image: ${pickedFile.path}',
          isMine: true,
        ),
      );
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      Get.find<ChatController>().sendMessage(
        ChatMessage(
          sender: 'Me',
          text: 'Sent a file: ${result.files.single.name}',
          isMine: true,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: _pickImage,
          ),
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: _pickFile,
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Type a message',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
