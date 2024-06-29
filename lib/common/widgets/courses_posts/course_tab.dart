import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/home/home_controller.dart';



class CoursesTab extends StatelessWidget {
  const CoursesTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.find();
    return ListView.builder(
      itemCount: homeControllerImp.mixing
          .where((item) => item['type'] == 'video')
          .length,
      itemBuilder: (context, index) {
        var course = homeControllerImp.mixing
            .where((item) => item['type'] == 'video')
            .toList()[index];
        return course['content'];
      },
    );
  }
}