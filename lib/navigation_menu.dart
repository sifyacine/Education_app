import 'package:education_app/utils/constants/colors.dart';
import 'package:education_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

import 'features/authentication/screens/home/home_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
            () => SpinCircleBottomBarHolder(
          bottomNavigationBar: SCBottomBarDetails(

            items: [
              SCBottomBarItem(icon: Icons.home, title: 'Home', onPressed: () => controller.selectedIndex.value = 0),
              SCBottomBarItem(icon: Icons.video_library_outlined, title: 'Short', onPressed: () => controller.selectedIndex.value = 1),
              SCBottomBarItem(icon: Icons.chat, title: 'Chat gpt', onPressed: () => controller.selectedIndex.value = 2),
              SCBottomBarItem(icon: Icons.group_rounded, title: 'Group', onPressed: () => controller.selectedIndex.value = 3),
            ],
            circleItems: [
              SCItem(icon: const Icon(Icons.add), onPressed: () {}),
              SCItem(icon: const Icon(Icons.print), onPressed: () {}),
              SCItem(icon: const Icon(Icons.map), onPressed: () {}),
            ],
            circleColors: [TColors.primaryColor,TColors.primaryColor,TColors.primaryColor,TColors.primaryColor ],
          ),
          child: controller.screens[controller.selectedIndex.value],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Container(child: const Center(child: Text('shorts video'))),
    Container(child: const Center(child: Text('new post'))),
    Container(child: const Center(child: Text('group'))),
  ];
}
