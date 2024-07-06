import 'package:education_app/features/authentication/screens/home/gemini/gemini.dart';
import 'package:education_app/utils/constants/colors.dart';
import 'package:education_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/authentication/screens/group_chat/groups_chat_page.dart';
import 'features/authentication/screens/home/home_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          backgroundColor: isDark ? TColors.dark : TColors.light,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.video), label: 'Shorts'),
            NavigationDestination(icon: Icon(Iconsax.add_square), label: 'Add'),
            NavigationDestination(
                icon: Icon(Iconsax.activity), label: 'Chat gpt'),
            NavigationDestination(
                icon: Icon(Iconsax.messages_2), label: 'Groups'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Container(),
    Container(),
    const GeminiPage(),
    const GroupsScreen()
  ];
}
