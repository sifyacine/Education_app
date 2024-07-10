import 'package:chewie/chewie.dart';
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
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${courseDetailsControllerImp.coursePrice} DA",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        padding: const EdgeInsets.all(15),
                        color: TColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          "GET",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 250,
                    width: MediaQuery.sizeOf(context).width,
                    child: Chewie(
                        controller:
                            courseDetailsControllerImp.chewieController),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        courseDetailsControllerImp.coursecreateAT,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "${courseDetailsControllerImp.courseviews} views",
                        style: const TextStyle(
                            backgroundColor: TColors.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
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
                    height: 20,
                  ),
                  const TFormDivider(dividerText: "Description"),
                  Card(
                    elevation: 5,
                    child: Text(
                      courseDetailsControllerImp.courseDesc,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
