import 'package:chewie/chewie.dart';
import 'package:education_app/common/widgets/home/channel.dart';
import 'package:education_app/features/authentication/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  const Video({super.key, required this.chewieController});
  final ChewieController chewieController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Chewie(controller: chewieController),
      ),
    );
  }
}
