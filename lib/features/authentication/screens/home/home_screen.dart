import 'package:education_app/features/authentication/controllers/home/home_controller.dart';
import 'package:education_app/features/authentication/screens/home/widgets/channels.dart';
import 'package:education_app/features/authentication/screens/home/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_bar_container.dart';
import '../../../../common/widgets/home/post.dart';
import '../../../../common/widgets/home/suggested course.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                expandedHeight: 440,
                flexibleSpace: const FlexibleSpaceBar(
                  background: Padding(
                    padding: EdgeInsets.only(top: TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TPrimaryHeaderContainer(
                          child: Column(
                            children: [
                              /// appBar
                              THomeAppBar(),
                              SizedBox(height: TSizes.spaceBtwSections),

                              /// searchbar
                              TSearchContainer(
                                text: 'Search in store',
                              ),
                              SizedBox(height: TSizes.spaceBtwSections),

                              /// categories
                              Padding(
                                padding: EdgeInsets.only(left: TSizes.defaultSpace),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// heading
                                    TSectionHeading(
                                      title: 'Suggested channels',
                                      textColor: TColors.white,
                                    ),
                                    SizedBox(height: TSizes.spaceBtwItems),

                                    /// categories
                                    TChannels(),
                                  ],
                                ),
                              ),
                              SizedBox(height: TSizes.spaceBtwSections),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('Courses')),
                    Tab(child: Text('Posts')),
                  ],
                ),
              ),
            ];
          },
          body: Expanded(
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
                    imageName: homeControllerImp.posts[i]["post_img"],
                    courseThumbnail: homeControllerImp.courses[i]
                    ["course_thumbnail"],
                    coursePrice: homeControllerImp.courses[i]["course_price"]
                        .toString(),
                    channelName:
                    "  ${homeControllerImp.courses[i]["channel_name"]}",
                    views:
                    "${homeControllerImp.courses[i]["course_view"]} views"
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
                    imageLogoName: homeControllerImp.posts[i]
                    ["channel_img"],
                    channelName: homeControllerImp.posts[i]["post_channel"],
                    likes: homeControllerImp.posts[i]["post_likes"],
                    dateTime: "21/07/2024",
                  ),
                ),
              ],
            ),
          ),
          ),
        ),
      );
  }
}
