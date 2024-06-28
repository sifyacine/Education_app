import 'package:education_app/common/widgets/home/channel.dart';
import 'package:education_app/common/widgets/home/course.dart';
import 'package:education_app/common/widgets/home/custom_app_bar.dart';
import 'package:education_app/common/widgets/home/post.dart';
import 'package:education_app/common/widgets/home/suggested%20course.dart';
import 'package:education_app/features/authentication/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(children: [
            const SizedBox(
              height: 10,
            ),
            CustomAppBar(
              title: "courses , channels ",
              onPressedProfil: () {},
              onPressedSearch: () {},
              onPressedNotification: () {},
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, i) => Channel(
                  onTap: () {},
                  channelName: "channel Name",
                ),
              ),
            ),
            ListView.builder(
                itemCount: homeControllerImp.mixing.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) =>
                    homeControllerImp.mixing[i]["content"]),
          ])),
    );
  }
}
