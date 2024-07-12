import 'package:education_app/features/authentication/controllers/test_controller.dart';
import 'package:education_app/utils/constants/colors.dart';
import 'package:education_app/utils/models/geminiChatBots/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    TestControllerImp testControllerImp = Get.put(TestControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: TColors.primaryColor,
          title: const Text(
            "AI Chat",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<TestControllerImp>(
          builder: (controller) => Container(
            padding: const EdgeInsets.all(10),
            color: TColors.primaryBackground,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: testControllerImp.prompt.length,
                        itemBuilder: (context, i) {
                          final message = testControllerImp.prompt[i];
                          return UserPrompt(
                              isPrompt: message.isPrompt,
                              message: message.message,
                              testControllerImp: testControllerImp,
                              date: DateFormat('hh:mm a').format(message.time));
                        })),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 20,
                        child: TextFormField(
                          controller: testControllerImp.promptController,
                          decoration: const InputDecoration(
                              labelText: "Message...",
                              hintText: "Enter you question"),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () async {
                            if (testControllerImp
                                .promptController.text.isEmpty) {
                              return;
                            }
                            {
                              await testControllerImp.sendMessage();
                            }
                          },
                          child: const CircleAvatar(
                              radius: 29,
                              backgroundColor: TColors.primaryColor,
                              child: Icon(Icons.send)))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Container UserPrompt(
      {required final bool isPrompt,
      required String message,
      required TestControllerImp testControllerImp,
      required String date}) {
    return Container(
      margin: const EdgeInsets.all(10)
          .copyWith(left: isPrompt ? 80 : 15, right: isPrompt ? 15 : 80),
      width: double.infinity,
      decoration: BoxDecoration(
          color: isPrompt ? TColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
                fontWeight: isPrompt ? FontWeight.bold : FontWeight.normal,
                fontSize: 18,
                color: Colors.black),
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
