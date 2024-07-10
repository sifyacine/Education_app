import 'package:education_app/features/authentication/controllers/home/home_controller.dart';
import 'package:education_app/features/authentication/screens/home/channel/channel_page.dart';
import 'package:education_app/features/authentication/screens/home/widgets/channels.dart';
import 'package:education_app/features/authentication/screens/home/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_bar_container.dart';
import '../../../../common/widgets/home/post.dart';
import '../../../../common/widgets/home/suggested course.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.kBlack
                    : TColors.white,
                expandedHeight: 360,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TPrimaryHeaderContainer(
                        child: Column(
                          children: [
                            /// appBar
                            const THomeAppBar(),
                            const SizedBox(height: TSizes.spaceBtwSections),

                            /// searchbar
                            const TSearchContainer(
                              text: 'Courses, Posts',
                            ),
                            const SizedBox(height: TSizes.spaceBtwSections),

                            /// categories
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: TSizes.defaultSpace),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// heading
                                  const TSectionHeading(
                                    title: 'Suggested channels',
                                    textColor: TColors.white,
                                  ),
                                  const SizedBox(height: TSizes.spaceBtwItems),

                                  /// categories
                                  SizedBox(
                                    height: 100,
                                    child: ListView.separated(
                                      separatorBuilder: (context, i) =>
                                          const SizedBox(
                                        width: 10,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          homeControllerImp.channels.length,
                                      itemBuilder: (context, i) => TChannels(
                                        onTapChannel: () async {
                                          Get.to(() => const ChannelPage(),
                                              arguments: {
                                                "channel_id": homeControllerImp
                                                    .channels[i]["channel_id"],
                                                "channel_type":
                                                    homeControllerImp
                                                            .channels[i]
                                                        ["channel_type"],
                                                "channel_name":
                                                    homeControllerImp
                                                            .channels[i]
                                                        ["channel_name"],
                                                "channel_email":
                                                    homeControllerImp
                                                            .channels[i]
                                                        ["channel_email"],
                                                "channel_desc":
                                                    homeControllerImp
                                                            .channels[i]
                                                        ["channel_desc"],
                                                "channel_phone":
                                                    homeControllerImp
                                                            .channels[i]
                                                        ["channel_phone"],
                                                "channel_img": homeControllerImp
                                                    .channels[i]["channel_img"],
                                                "channel_likes":
                                                    homeControllerImp
                                                            .channels[i]
                                                        ["channel_likes"],
                                                "channel_createAT":
                                                    homeControllerImp
                                                            .channels[i]
                                                        ["channel_createAT"],
                                              });
                                        },
                                        imageName: homeControllerImp.channels[i]
                                            ["channel_img"],
                                        channelName: homeControllerImp
                                            .channels[i]["channel_name"],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: TSizes.spaceBtwSections),
                          ],
                        ),
                      ),
                    ],
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
                        Tab(text: 'Courses'),
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
                itemCount: homeControllerImp.courses.length,
                itemBuilder: (context, i) => SuggestedCourse(
                  imageName: homeControllerImp.posts[i]["post_img"],
                  courseThumbnail: homeControllerImp.courses[i]
                      ["course_thumbnail"],
                  coursePrice:
                      homeControllerImp.courses[i]["course_price"].toString(),
                  rating: homeControllerImp.courses[i]["course_rating"],
                  channelName:
                      "  ${homeControllerImp.courses[i]["channel_name"]}",
                  views: "${homeControllerImp.courses[i]["course_view"]} views"
                      .toString(),
                  titleName: homeControllerImp.courses[i]["course_title"],
                ),
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
                  postTitle: homeControllerImp.posts[i]["post_title"],
                  imageName: homeControllerImp.posts[i]["post_img"],
                  imageLogoName: homeControllerImp.posts[i]["channel_img"],
                  channelName: homeControllerImp.posts[i]["post_channel"],
                  likes: homeControllerImp.posts[i]["post_likes"],
                  dateTime: "21/07/2024",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
