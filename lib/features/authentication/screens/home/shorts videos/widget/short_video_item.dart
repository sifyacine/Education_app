import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:like_button/like_button.dart';
import '../../channel/channel_page.dart';
import '../../comments_page.dart';

class ShortVideoItem extends StatelessWidget {
  const ShortVideoItem({
    Key? key,
    required this.chewieController,
    required this.videoTitle,
    required this.imageName,
    required this.channelName,
  }) : super(key: key);

  final ChewieController chewieController;
  final String videoTitle;
  final String imageName;
  final String channelName;

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.center,
      children: [
        Chewie(controller: chewieController),
        Positioned(
          top: 40,
          left: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
        ),

        Positioned(
          right: 10,
          bottom: MediaQuery.of(context).size.height / 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LikeButton(size: 30),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {Get.to(() => const CommentsPage());},
                child: const Icon(
                  Icons.comment_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Iconsax.save_2,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 70,
          right: 20,
          left: 30,
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ChannelPage());},
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: AssetImage(imageName),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'English with yacine',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              ExpandableText(
                text: videoTitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(
          text: widget.text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        );

        final tp = TextPainter(
          maxLines: isExpanded ? null : 2,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          text: span,
        )..layout(maxWidth: constraints.maxWidth);

        final exceeded = tp.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              span,
              maxLines: isExpanded ? null : 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (exceeded)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? 'Show less' : 'See more',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}