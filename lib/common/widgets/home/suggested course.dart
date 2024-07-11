import 'package:education_app/common/widgets/home/channel.dart';
import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../courses_posts/rating_indecator.dart';

class SuggestedCourse extends StatelessWidget {
  const SuggestedCourse(
      {super.key,
      required this.channelName,
      required this.views,
      required this.titleName,
      required this.coursePrice,
      required this.courseThumbnail,
      required this.imageName,
      required this.rating});

  final String channelName;
  final String views;
  final String titleName;

  final String coursePrice;
  final String courseThumbnail;
  final String imageName;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Card(
              child: Image.asset(
                courseThumbnail,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChannelIcon(
                onTap: () {},
                imageName: imageName,
                channelName: channelName,
              ),
              Text(
                views,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    backgroundColor: TColors.primaryColor),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                titleName,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Row(children: [
                const TRatingBarIndicator(rating: 3.5),
                const SizedBox(width: 10),
                Text(rating),
              ]),
              const SizedBox(height: 10),
              Text(
                "$coursePrice DA",
                style: const TextStyle(
                  color: TColors.dark,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
