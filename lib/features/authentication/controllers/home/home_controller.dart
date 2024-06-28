import 'package:education_app/common/widgets/home/post.dart';
import 'package:education_app/common/widgets/home/suggested%20course.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

abstract class HomeController extends GetxController {
  initData();
}

class HomeControllerImp extends HomeController {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  late List mixing;

  @override
  void onInit() async {
    await initData();
    super.onInit();
  }

  @override
  void onClose() async {
    chewieController.dispose();
    super.onClose();
  }

  @override
  initData() async {
    videoPlayerController = VideoPlayerController.asset("assets/logo/1.mp4");

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      showControls: true,
    );
    mixing = [
      {
        "type": "video",
        "content": const SuggestedCourse(
            channelName: "  channelName",
            views: "100 views",
            titleName:
                "This is the title of the post for example this video is talking about economy")
      },
      {
        "type": "post",
        "content": Post(
            onTapChannelIcon: () {},
            onTapCommentButton: () {},
            onTapLikeButton: (val) {
              val == true ? val = false : val = true;
              return Future<bool>.value(val);
            },
            postTitle:
                "This is the title of the post for example Is there a solution for this exercise please? If anyone knows the solution, please write it to me in the comments.",
            imageName: "assets/onBoarding/onboarding_3.png",
            channelName: "channelName",
            dateTime: "21/07/2024"),
      },
      {
        "type": "video",
        "content": const SuggestedCourse(
            channelName: "  channelName",
            views: "100 views",
            titleName:
                "This is the title of the post for example this video is talking about economy")
      },
      {
        "type": "post",
        "content": Post(
            onTapChannelIcon: () {},
            onTapCommentButton: () {},
            onTapLikeButton: (val) {
              val == true ? val = false : val = true;
              return Future<bool>.value(val);
            },
            postTitle:
                "This is the title of the post for example Is there a solution for this exercise please? If anyone knows the solution, please write it to me in the comments.",
            imageName: "assets/onBoarding/onboarding_3.png",
            channelName: "channelName",
            dateTime: "21/07/2024"),
      },
    ];
  }
}
