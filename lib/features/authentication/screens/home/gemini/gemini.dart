import 'package:education_app/features/authentication/controllers/home/gemini/gemini_controller.dart';

import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GeminiPage extends StatelessWidget {
  const GeminiPage({super.key});

  @override
  Widget build(BuildContext context) {
    GeminiControllerImp geminiControllerImp = Get.put(GeminiControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: TColors.primaryColor,
          title: const Text(
            "AI Chat",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<GeminiControllerImp>(
          builder: (controller) => Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: [
                geminiControllerImp.prompt.isEmpty
                    ? Expanded(
                        child: ListView(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/logo/ai.png"),
                                const Text(
                                  "Chat AI",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "You can talk to artificial intelligence to solve your problems. Start asking questions now",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : geminiControllerImp.loading == true
                        ? const Expanded(
                            child: FittedBox(
                              fit: BoxFit.none,
                              child: CircularProgressIndicator(
                                backgroundColor: TColors.primaryColor,
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                                controller:
                                    geminiControllerImp.scrollController,
                                itemCount: geminiControllerImp.prompt.length,
                                itemBuilder: (context, i) {
                                  final message = geminiControllerImp.prompt[i];
                                  return UserPrompt(
                                      isPrompt: message.isPrompt,
                                      message: message.message,
                                      geminiControllerImp: geminiControllerImp,
                                      date: DateFormat('hh:mm a')
                                          .format(message.time));
                                })),
                Row(
                  children: [
                    Expanded(
                      flex: 20,
                      child: TextFormField(
                        controller: geminiControllerImp.promptController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: TColors.primaryColor)),
                            labelText: "Message...",
                            hintText: "Enter you question"),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () async {
                          if (geminiControllerImp
                              .promptController.text.isEmpty) {
                            return;
                          }
                          {
                            await geminiControllerImp.sendMessage(context);
                          }
                        },
                        child: const CircleAvatar(
                            radius: 29,
                            backgroundColor: TColors.primaryColor,
                            child: Icon(Icons.send)))
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Container UserPrompt(
      {required final bool isPrompt,
      required String message,
      required GeminiControllerImp geminiControllerImp,
      required String date}) {
    return Container(
      margin: const EdgeInsets.all(10).copyWith(left: isPrompt ? 80 : 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: isPrompt ? TColors.primaryBackground : TColors.primaryColor,
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isPrompt ? " You :" : " Chat AI : ",
            style: const TextStyle(
                backgroundColor: Colors.black,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.underline),
          ),
          Text(
            message,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          Text(
            date,
            style: TextStyle(
                fontSize: 14, color: isPrompt ? Colors.black : Colors.white),
          ),
        ],
      ),
    );
  }
}
