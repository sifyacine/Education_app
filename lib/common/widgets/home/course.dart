import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';


class Video extends StatelessWidget {
  const Video({
    super.key,
    required this.chewieController,
  });
  final ChewieController chewieController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
