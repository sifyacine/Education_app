import 'package:education_app/common/widgets/home/channel.dart';
import 'package:education_app/features/authentication/controllers/home/home_controller.dart';
import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../courses_posts/rating_indecator.dart';

class SuggestedCourse extends StatelessWidget {
  const SuggestedCourse(
      {super.key,
      required this.channelName,
      required this.views,
      required this.titleName,
      required this.coursePrice,
      required this.courseThumbnail,
      required this.imageName});

  final String channelName;
  final String views;
  final String titleName;

  final String coursePrice;
  final String courseThumbnail;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
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
          ChannelIcon(
            onTap: () {},
            imageName: imageName,
            channelName: channelName,
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
                const TRatingBarIndicator(
                  rating: 3.5
                ),
                const SizedBox(width: 10),
                const Text("(275)"),
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
