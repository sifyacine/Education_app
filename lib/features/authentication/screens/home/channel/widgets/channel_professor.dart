import 'package:education_app/common/widgets/home/channel.dart';
import 'package:education_app/common/widgets/home/post.dart';
import 'package:education_app/common/widgets/home/suggested%20course.dart';
import 'package:education_app/features/authentication/controllers/home/channel_page/channel_controller.dart';
import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class ChannelProfessor extends StatelessWidget {
  const ChannelProfessor({super.key, required this.channelControllerImp});
  final ChannelControllerImp channelControllerImp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: TColors.primaryColor,
              expandedHeight: MediaQuery.sizeOf(context).height / 2,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(
                      top: 25.0, right: 10, left: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Channel(
                          onTap: null,
                          channelName: Get.arguments["channel_name"],
                          channelEmail: Get.arguments["channel_email"],
                          imageName: Get.arguments["channel_img"]),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: [
                                  const LikeButton(),
                                  Text(
                                    " ${channelControllerImp.channelLikes} Likes",
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                channelControllerImp.channelCreateAT,
                                style: const TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Card(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "D-escription",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  """I believe that mathematics is not just a subject but a way of thinking and problem-solving. My teaching philosophy centers around making complex mathematical concepts accessible and engaging for all students. I strive to create a supportive and interactive learning environment """,
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: Material(
                  color: TColors.white,
                  child: TabBar(
                    dividerColor: TColors.primaryColor,
                    labelColor: TColors.primaryColor,
                    unselectedLabelColor: TColors.kDarkGrey,
                    tabs: [
                      Tab(
                        text: "Courses",
                      ),
                      Tab(text: 'Posts'),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, i) => const Divider(
                height: 20,
                thickness: 5,
              ),
              itemCount: channelControllerImp.courses.length,
              itemBuilder: (context, i) => SuggestedCourse(
                imageName: channelControllerImp.posts[i]["post_img"],
                courseThumbnail: channelControllerImp.courses[i]
                    ["course_thumbnail"],
                coursePrice:
                    channelControllerImp.courses[i]["course_price"].toString(),
                rating: channelControllerImp.courses[i]["course_rating"],
                channelName:
                    "  ${channelControllerImp.courses[i]["channel_name"]}",
                views: "${channelControllerImp.courses[i]["course_view"]} views"
                    .toString(),
                titleName: channelControllerImp.courses[i]["course_title"],
              ),
            ),
            ListView.separated(
              itemCount: channelControllerImp.posts.length,
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
                postTitle: channelControllerImp.posts[i]["post_title"],
                imageName: channelControllerImp.posts[i]["post_img"],
                imageLogoName: channelControllerImp.posts[i]["channel_img"],
                channelName: channelControllerImp.posts[i]["post_channel"],
                likes: channelControllerImp.posts[i]["post_likes"],
                dateTime: "21/07/2024",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
