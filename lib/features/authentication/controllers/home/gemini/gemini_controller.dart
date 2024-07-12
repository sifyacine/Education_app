import 'package:education_app/utils/functions/check_network.dart';
import 'package:education_app/utils/models/geminiChatBots/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

abstract class GeminiController extends GetxController {
  initData();
  scrollToBottom();
  Future<void> sendMessage(BuildContext context);
}

class GeminiControllerImp extends GeminiController {
  late TextEditingController promptController;
  late String apiKey;
  late dynamic model;
  late ScrollController scrollController;

  late List<ModelMessage> prompt = [];
  late bool loading;
  @override
  initData() async {
    promptController = TextEditingController();
    apiKey = "AIzaSyA1SUwu3mqEAdPs-6t3vumIxZp2Zhs4728";
    model = GenerativeModel(model: "gemini-pro", apiKey: apiKey);
    prompt = [];
    scrollController = ScrollController();
    loading = false;
  }

  @override
  void onInit() async {
    await initData();
    super.onInit();
  }

  @override
  void dispose() {
    promptController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Future<void> sendMessage(context) async {
    FocusScope.of(context).unfocus();
    final message = promptController.text;
    promptController.clear();
    update();

    prompt.add(
        ModelMessage(isPrompt: true, message: message, time: DateTime.now()));
    update();

    try {
      loading = true;
      final content = [Content.text(message)];
      final response = await model.generateContent(content);
      update();
      prompt.add(ModelMessage(
          isPrompt: false, message: response.text ?? "", time: DateTime.now()));
      loading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
    } catch (e) {
      Get.snackbar("Error", "This version not work in your phone",
          backgroundColor: Colors.red[100]);
    }

    update();
  }

  @override
  scrollToBottom() async {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
