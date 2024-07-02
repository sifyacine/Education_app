import 'package:chewie/chewie.dart';
import 'package:education_app/common/widgets/home/channel.dart';
import 'package:education_app/common/widgets/home/course.dart';
import 'package:education_app/features/authentication/controllers/home/home_controller.dart';
import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

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
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Image.asset(
              courseThumbnail,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Wrap(
            direction: Axis.horizontal,
            children: [
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
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text(titleName, style: const TextStyle(fontSize: 18)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Course Price: :",
                  style: TextStyle(
                      color: Colors.black,
                      shadows: [
                        Shadow(
                            color: TColors.primaryColor,
                            offset: Offset(2, 2),
                            blurRadius: 5)
                      ],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$coursePrice DA.",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 42, 112, 44),
                      shadows: [
                        Shadow(
                            color: TColors.primaryColor,
                            offset: Offset(2, 2),
                            blurRadius: 5)
                      ],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.yellow),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
