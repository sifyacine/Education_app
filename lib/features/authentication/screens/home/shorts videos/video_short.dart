import 'package:chewie/chewie.dart';
import 'package:education_app/features/authentication/controllers/home/short_video/short_video_controller.dart';
import 'package:education_app/features/authentication/screens/home/shorts%20videos/widget/short_video_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoShort extends StatelessWidget {
  const VideoShort({super.key});

  @override
  Widget build(BuildContext context) {
    ShortVideoControllerImp shortVideoControllerImp =
        Get.put(ShortVideoControllerImp());

    return Scaffold(
        body: PageView.builder(
            controller: shortVideoControllerImp.pageController,
            scrollDirection: Axis.vertical,
            itemCount: shortVideoControllerImp.shortsVideos.length,
            itemBuilder: (context, i) {
              VideoPlayerController videoPlayerController =
                  VideoPlayerController.asset(
                      shortVideoControllerImp.shortsVideos[i]["short_url"]);
              ChewieController chewieController = ChewieController(
                videoPlayerController: videoPlayerController,
                aspectRatio: MediaQuery.sizeOf(context).width /
                    MediaQuery.sizeOf(context).height,
                showControls: true,
                looping: true,
                autoPlay: true,
              );
              return ShortVideoItem(
                chewieController: chewieController,
                imageName: shortVideoControllerImp.channels[i]["channel_img"],
                channelName: shortVideoControllerImp.channels[i]
                    ["channel_name"],
                videoTitle: shortVideoControllerImp.shortsVideos[i]
                    ["short_title"],
              );
            }));
  }
}
