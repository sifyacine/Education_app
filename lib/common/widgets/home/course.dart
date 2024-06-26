import 'package:chewie/chewie.dart';
import 'package:education_app/common/widgets/home/channel.dart';
import 'package:education_app/features/authentication/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class Video extends StatelessWidget {
  const Video({super.key, required this.chewieController});
  final ChewieController chewieController;
  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: chewieController,
    );
  }
}
