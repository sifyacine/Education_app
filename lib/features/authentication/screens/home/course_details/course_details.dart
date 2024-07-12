import 'package:chewie/chewie.dart';
import 'package:education_app/common/widgets/courses_posts/rating_indecator.dart';
import 'package:education_app/common/widgets/login_signup/form_divider.dart';
import 'package:education_app/features/authentication/controllers/home/course_details/course_details_controller.dart';
import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    CourseDetailsControllerImp courseDetailsControllerImp =
        Get.put(CourseDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: MediaQuery.sizeOf(context).height / 9,
          backgroundColor: const Color.fromARGB(88, 158, 158, 158),
          title: Text(
            " ${courseDetailsControllerImp.coursePrice} DA",
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                backgroundColor: Colors.white),
          ),
          elevation: 10,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          actions: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 10, bottom: 3),
              decoration: BoxDecoration(
                color: TColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2),
              ),
              child: const Row(
                children: [
                  Text(
                    "Buy now: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.payment,
                    size: 30,
                  ),
                ],
              ),
            ),
          ]),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 250,
                  child: Chewie(
                      controller: courseDetailsControllerImp.chewieController),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      courseDetailsControllerImp.coursecreateAT,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[500]),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: AssetImage(
                                    courseDetailsControllerImp.channelImg,
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          " ${courseDetailsControllerImp.channelName}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            backgroundColor: Color.fromARGB(151, 207, 207, 207),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "${courseDetailsControllerImp.courseviews} views",
                      style: TextStyle(
                          backgroundColor: TColors.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[800]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  courseDetailsControllerImp.courseTitle,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    TRatingBarIndicator(
                        rating: courseDetailsControllerImp.courseRating),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        " ${courseDetailsControllerImp.courseRating} (${courseDetailsControllerImp.courseviews})",
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const TFormDivider(dividerText: "Description"),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: TColors.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.black)),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Text(
                          courseDetailsControllerImp.courseDesc,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.black,
                              height: 2,
                              decorationStyle: TextDecorationStyle.solid,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
