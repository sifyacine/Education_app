
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
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                title: "Expand your knowledge",
                subtitle: "Unlock a world of learning. Explore our vast library of courses, lectures, and resources to expand your horizons.",
                name: "assets/onBoarding/onboarding_1.png",
              ),
              OnBoardingPage(
                title: "Learn online",
                subtitle: "Learn at your own pace. Access engaging online classes, workshops, and interactive content from experts.",
                name: "assets/onBoarding/onboarding_2.png",
              ),
              OnBoardingPage(
                title: "Teach online ",
                subtitle: "Share your expertise. Create dynamic courses and connect with a global community of lifelong learners.",
                name: "assets/onBoarding/onboarding_3.png",
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

