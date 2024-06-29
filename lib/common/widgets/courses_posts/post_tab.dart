import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/home/home_controller.dart';



class PostsTab extends StatelessWidget {
  const PostsTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.find();
    return ListView.builder(
      itemCount: homeControllerImp.mixing
          .where((item) => item['type'] == 'post')
          .length,
      itemBuilder: (context, index) {
        var post = homeControllerImp.mixing
            .where((item) => item['type'] == 'post')
            .toList()[index];
        return post['content'];
      },
    );
  }
}
