import 'package:education_app/common/widgets/home/channel.dart';
import 'package:education_app/common/widgets/home/custom_app_bar.dart';
import 'package:education_app/common/widgets/home/post.dart';
import 'package:education_app/common/widgets/home/suggested%20course.dart';
import 'package:education_app/features/authentication/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../../utils/constants/colors.dart';
import '../settings/settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              CustomAppBar(
                title: "courses , channels ",
                onPressedProfil: () {
                  Get.to(() => const SettingsPage());
                },
                onPressedSearch: () {},
                onPressedNotification: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        child: TabBar(
                          labelColor: Color.fromARGB(255, 53, 202, 96),
                          unselectedLabelColor:
                              Color.fromARGB(255, 112, 111, 111),
                          indicatorColor: TColors.primaryColor,
                          tabs: [
                            Tab(text: 'Courses'),
                            Tab(text: 'Posts'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, i) => const Divider(
                                height: 20,
                                thickness: 5,
                              ),
                              itemCount: homeControllerImp.courses.length,
                              itemBuilder: (context, i) => SuggestedCourse(
                                  imageName: homeControllerImp.posts[i]
                                      ["post_img"],
                                  courseThumbnail: homeControllerImp.courses[i]
                                      ["course_thumbnail"],
                                  coursePrice: homeControllerImp.courses[i]
                                          ["course_price"]
                                      .toString(),
                                  channelName:
                                      "  ${homeControllerImp.courses[i]["channel_name"]}",
                                  views:
                                      "${homeControllerImp.courses[i]["course_view"]} views"
                                          .toString(),
                                  titleName: homeControllerImp.courses[i]
                                      ["course_title"]),
                            ),
                            ListView.separated(
                                itemCount: homeControllerImp.posts.length,
                                shrinkWrap: true,
                                separatorBuilder: (context, i) => const Divider(
                                      height: 50,
                                      thickness: 10,
                                    ),
                                itemBuilder: (context, i) => Post(
                                    onSave: () {},
                                    onPressedLikes: () {},
                                    onTapChannelIcon: () {},
                                    onTapCommentButton: () {},
                                    onTapLikeButton: (val) {
                                      val == true ? val = false : val = true;
                                      return Future<bool>.value(val);
                                    },
                                    postTitle: homeControllerImp.posts[i]
                                        ["post_title"],
                                    imageName: homeControllerImp.posts[i]
                                        ["post_img"],
                                    imageLogoName: homeControllerImp.posts[i]
                                        ["channel_img"],
                                    channelName: homeControllerImp.posts[i]
                                        ["post_channel"],
                                    likes: homeControllerImp.posts[i]
                                        ["post_likes"],
                                    dateTime: "21/07/2024")),
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
      ),
    );
  }
}
