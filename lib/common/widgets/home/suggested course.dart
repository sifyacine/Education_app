import 'package:education_app/common/widgets/home/channel.dart';
import 'package:education_app/common/widgets/home/course.dart';
import 'package:education_app/features/authentication/controllers/home/home_controller.dart';
import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuggestedCourse extends StatelessWidget {
  const SuggestedCourse(
      {super.key,
      required this.channelName,
      required this.views,
      required this.titleName});
  final String channelName;
  final String views;
  final String titleName;

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
    return SizedBox(
      height: 450,
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "Suggested Course",
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
              Video(
                chewieController: homeControllerImp.chewieController,
              ),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChannelIcon(
                        onTap: () {},
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
