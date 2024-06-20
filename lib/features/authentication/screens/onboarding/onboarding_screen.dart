
import 'package:education_app/features/authentication/screens/onboarding/widgets/onboard_next_button.dart';
import 'package:education_app/features/authentication/screens/onboarding/widgets/onboarding_navigator.dart';
import 'package:education_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:education_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding/onboarding_controller.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable pages
          PageView(
            controller: controller.pagecontroller,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                title: "",
                subtitle: "",
                name: "",
              ),
              OnBoardingPage(
                title: "",
                subtitle: "",
                name: "",
              ),
              OnBoardingPage(
                title: "",
                subtitle: "",
                name: "",
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardNavigation(),

          /// circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}

