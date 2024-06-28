import 'package:education_app/common/widgets/home/channel.dart';
import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
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
      required this.dateTime});
  final void Function()? onTapChannelIcon;
  final String dateTime;
  final String channelName;
  final String postTitle;
  final String imageName;
  final Future<bool?> Function(bool)? onTapLikeButton;
  final void Function()? onTapCommentButton;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: Card(
        elevation: 10,
        color: TColors.primaryBackground,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // First Row For icon channel and date and name of channel
              Row(
                children: [
                  ChannelIcon1(
                    onTap: onTapChannelIcon,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(dateTime), Text(channelName)],
                  )
                ],
              ),
              // Second Row For title of the post
              Wrap(
                direction: Axis.horizontal,
                children: [
                  Text(
                    postTitle,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              // third row for content <image>
              Container(
                color: TColors.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      imageName,
                      height: 250,
                      width: 250,
                    )
                  ],
                ),
              ),
              // firdth row for like and comment
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: TColors.primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LikeButton(
                      onTap:
                          onTapLikeButton /*(val) {
                          val == true ? val = false : val = true;
                          return Future<bool>.value(val);
                        },*/
                      ,
                    ),
                    IconButton(
                      onPressed: onTapCommentButton,
                      icon: const Icon(Icons.comment),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
