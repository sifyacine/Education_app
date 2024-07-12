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
  late String courseVideoIntroURL;
  late String courseImgVideo;
  late String courseviews;
  late int coursePrice;
  late double courseRating;
  late int channelID;
  late String coursecreateAT;
  late String channelName;

  late String channelImg;
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  @override
  initData() async {
    courseId = Get.arguments[0]["course_id"];
    courseTitle = Get.arguments[0]["course_title"];
    courseDesc =
        "* a full course for begginer student , learn math in 6 videos,* for begginers * Simple and understandable explanation * Review all logarithmic theorems * Solve more than 30 deep and difficult exercises * Obtain a certificate upon completion of the course, subscribe in the cahnnel and get your benifite of the course. ";
    courseVideoIntroURL = Get.arguments[0]["url_video_introduction"];

    courseviews = Get.arguments[0]["course_view"];
    coursePrice = Get.arguments[0]["course_price"];
    channelName = Get.arguments[0]["channel_name"];
    channelImg = Get.arguments[0]["channel_img"];
    channelID = Get.arguments[0]["channel_id"];
    coursecreateAT = Get.arguments[0]["course_createAt"];
    courseRating = Get.arguments[0]["course_rating"];
    videoPlayerController = VideoPlayerController.asset(courseVideoIntroURL);
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
