import 'package:education_app/common/widgets/home/channel.dart';
import 'package:education_app/common/widgets/home/custom_app_bar.dart';
import 'package:education_app/features/authentication/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/courses_posts/course_tab.dart';
import '../../../../common/widgets/courses_posts/post_tab.dart';
import '../../../../utils/constants/colors.dart';
import '../settings/settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomAppBar(
              title: "courses , channels ",
              onPressedProfil: () {
                Get.to(() => const SettingsPage());
              },
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
            const Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TabBar(
                        labelColor: TColors.primaryColor,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: TColors.primaryColor,
                        tabs: [
                          Tab(text: 'Posts'),
                          Tab(text: 'Courses'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          PostsTab(),
                          CoursesTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}