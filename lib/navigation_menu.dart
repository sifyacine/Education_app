import 'package:education_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

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
              SCBottomBarItem(icon: Iconsax.home, title: 'Home', onPressed: () => controller.selectedIndex.value = 0),
              SCBottomBarItem(icon: Icons.explore, title: 'short videos', onPressed: () => controller.selectedIndex.value = 1),
              SCBottomBarItem(icon: Iconsax.heart, title: 'new post', onPressed: () => controller.selectedIndex.value = 2),
              SCBottomBarItem(icon: Iconsax.user, title: 'group', onPressed: () => controller.selectedIndex.value = 3),
            ],
            circleItems: [
              SCItem(icon: Icon(Icons.add), onPressed: () {}),
              SCItem(icon: Icon(Icons.print), onPressed: () {}),
              SCItem(icon: Icon(Icons.map), onPressed: () {}),
            ],
            circleColors: [Colors.blue, Colors.red, Colors.green, Colors.orange],
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
    Container(child: Center(child: Text('Home Screen'))),
    Container(child: Center(child: Text('shorts video'))),
    Container(child: Center(child: Text('new post'))),
    Container(child: Center(child: Text('group'))),
  ];
}
