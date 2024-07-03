import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/authentication/controllers/home/home_controller.dart';

class CoursesTab extends StatelessWidget {
  const CoursesTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.find();
    var videoCourses = homeControllerImp.courses
        .where((item) => item['type'] == 'video')
        .toList();

    return ListView.builder(
      itemCount: videoCourses.length,
      itemBuilder: (context, index) {
        var course = videoCourses[index];
        return course['content']; // Replace this with your actual widget
      },
    );
  }
}
