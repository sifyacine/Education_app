import 'package:get/get.dart';

class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;

  void sendMessage(ChatMessage message) {
    messages.insert(0, message);
  }
}

class ChatMessage {
  final String sender;
  final String text;
  final bool isMine;

  ChatMessage({
    required this.sender,
    required this.text,
    required this.isMine,
  });
}
