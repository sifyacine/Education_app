import 'package:education_app/features/authentication/screens/home/gemini/gemini.dart';
import 'package:education_app/features/authentication/screens/home/shorts%20videos/video_short.dart';
import 'package:education_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/authentication/screens/add/add_course.dart';
import 'features/authentication/screens/add/add_post.dart';
import 'features/authentication/screens/add/add_short.dart';
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
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            if (index == 2) {
              showModalBottomSheet(
                context: context,
                builder: (context) => const AddOptionsModal(),
              );
            } else {
              controller.selectedIndex.value = index;
            }
          },
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.video), label: 'Shorts'),
            NavigationDestination(icon: Icon(Iconsax.add_square), label: 'Add'),
            NavigationDestination(icon: Icon(Iconsax.activity), label: 'Chat GPT'),
            NavigationDestination(icon: Icon(Iconsax.messages_2), label: 'Groups'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class AddOptionsModal extends StatelessWidget {
  const AddOptionsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Iconsax.book),
            title: const Text('Add Course'),
            onTap: () {
              Get.to(() => const AddCourse());
            },
          ),
          ListTile(
            leading: const Icon(Iconsax.pet),
            title: const Text('Add Post'),
            onTap: () {
              Get.to(() => const AddPost());
            },
          ),
          ListTile(
            leading: const Icon(Iconsax.video),
            title: const Text('Add Short'),
            onTap: () {
              Get.to(() => const AddShort());
            },
          ),
        ],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const VideoShort(),
    Container(), // Placeholder, will not be used
    const GeminiPage(),
    const GroupsScreen()
  ];
}
