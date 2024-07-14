import 'package:education_app/utils/models/geminiChatBots/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

abstract class TestController extends GetxController {
  initData();
  Future<void> sendMessage();
}

class TestControllerImp extends TestController {
  late TextEditingController promptController;
  late String apiKey;
  late dynamic model;

  late List<ModelMessage> prompt = [];

  @override
  initData() async {
    promptController = TextEditingController();
    apiKey = "AIzaSyA1SUwu3mqEAdPs-6t3vumIxZp2Zhs4728";
    model = GenerativeModel(model: "gemini-pro", apiKey: apiKey);
    prompt = [];
  }

  @override
  void onInit() async {
    await initData();
    super.onInit();
  }

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  @override
  Future<void> sendMessage() async {
    final message = promptController.text;
    promptController.clear();
    update();

    prompt.add(
        ModelMessage(isPrompt: true, message: message, time: DateTime.now()));
    update();
    final content = [Content.text(message)];
    final response = await model.generateContent(content);

    prompt.add(ModelMessage(
        isPrompt: false, message: response.text ?? "", time: DateTime.now()));
    update();
  }
}
