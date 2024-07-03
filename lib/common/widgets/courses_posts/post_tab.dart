import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/authentication/controllers/home/home_controller.dart';

class PostsTab extends StatelessWidget {
  const PostsTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.find();
    var postsList = homeControllerImp.posts;

    return ListView.builder(
      itemCount: postsList.length,
      itemBuilder: (context, index) {
        var post = postsList[index];
        return post['content']; // Replace this with your actual widget
      },
    );
  }
}
