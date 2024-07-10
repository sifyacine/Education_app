import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

abstract class CourseDetailsController extends GetxController {
  initData();
}

class CourseDetailsControllerImp extends CourseDetailsController {
  late int courseId;
  late String courseTitle;
  late String courseDesc;
  late String courseStringroURL;
  late String courseImgVideo;
  late String courseviews;
  late String coursePrice;

  late String courseprofessor;
  late String coursecreateAT;

  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  @override
  initData() async {
    courseId = 1;
    courseTitle = "a full course for begginer student , learn math in 6 videos";
    courseDesc = """
    * a full course for begginer student , learn math in 6 videos,
    * for begginers 
    * Simple and understandable explanation
    * Review all logarithmic theorems
    * Solve more than 30 deep and difficult exercises
    * Obtain a certificate upon completion of the course
    """;
    courseStringroURL = "assets/logo/1.mp4";
    courseImgVideo = "assets/logo/math.png";
    courseviews = "273";
    coursePrice = "1000";
    courseprofessor = "Dr Mohamed";
    coursecreateAT = "2024/07/21";

    videoPlayerController = VideoPlayerController.asset(courseStringroURL);
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 16 / 9,
        looping: true,
        autoPlay: true,
        showControls: true);
  }

  @override
  void onInit() async {
    initData();
    super.onInit();
  }
}
