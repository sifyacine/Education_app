import 'package:education_app/common/widgets/home/channel.dart';
import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class Post extends StatelessWidget {
  const Post(
      {super.key,
      required this.onTapChannelIcon,
      required this.onTapCommentButton,
      required this.onTapLikeButton,
      required this.postTitle,
      required this.imageName,
      required this.channelName,
      required this.onSave,
      required this.onPressedLikes,
      required this.likes,
      required this.imageLogoName,
      required this.dateTime});
  final void Function()? onTapChannelIcon;
  final String dateTime;
  final String channelName;
  final String postTitle;
  final String imageName;
  final String imageLogoName;

  final String likes;
  final Future<bool?> Function(bool)? onTapLikeButton;
  final void Function()? onTapCommentButton;
  final void Function()? onSave;
  final void Function()? onPressedLikes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // First Row For icon channel and date and name of channel
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ChannelIcon(
                    onTap: onTapChannelIcon,
                    channelName: "",
                    imageName: imageLogoName,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(channelName, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.dark)),Text(dateTime,  style: TextStyle(fontSize: 12, color: TColors.kDarkGrey))],
                  ),
                ],
              ),
              IconButton(
                  onPressed: onSave,
                  icon: const Icon(
                    Icons.save,
                    size: 28,
                  ))
            ],
          ),
          // Second Row For title of the post
          Wrap(
            direction: Axis.horizontal,
            children: [
              Text(
                postTitle,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          // third row for content <image>
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imageName,
                  height: 250,
                  width: Get.width - 20,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onPressedLikes,
                child: Text(
                  "  $likes likes",
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              InkWell(
                onTap: onPressedLikes,
                child: Text(
                  "  $likes Comments",
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          // firdth row for like and comment
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LikeButton(
                        onTap:
                            onTapLikeButton /*(val) {
                            val == true ? val = false : val = true;
                            return Future<bool>.value(val);
                          },*/
                        ,
                      ),
                      const Text("Like")
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: onTapCommentButton,
                        icon: const Icon(Icons.comment),
                      ),
                      const Text("Comment")
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
