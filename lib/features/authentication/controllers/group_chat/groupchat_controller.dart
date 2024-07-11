import 'package:get/get.dart';

class ChatMessage {
  final String sender;
  final String text;
  final bool isMine;
  final String? imageUrl;
  final String? fileUrl;

  ChatMessage({
    required this.sender,
    required this.text,
    required this.isMine,
    this.imageUrl,
    this.fileUrl,
  });
}

class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;

  void sendMessage(String text) {
    messages.add(ChatMessage(
      sender: 'You', // Replace with actual sender info
      text: text,
      isMine: true,
    ));
  }

  void sendImage(String imagePath) {
    messages.add(ChatMessage(
      sender: 'You',
      text: '',
      isMine: true,
      imageUrl: imagePath,
    ));
  }

  void sendFile(String filePath) {
    messages.add(ChatMessage(
      sender: 'You',
      text: '',
      isMine: true,
      fileUrl: filePath,
    ));
  }
}
