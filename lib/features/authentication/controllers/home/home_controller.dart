import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

abstract class HomeController extends GetxController {
  initData();
}

class HomeControllerImp extends HomeController {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  late List courses;
  late List posts;

  @override
  void onInit() async {
    await initData();
    super.onInit();
  }

  @override
  void onClose() async {
    chewieController.dispose();
    super.onClose();
  }

  @override
  initData() async {
    videoPlayerController = VideoPlayerController.asset("assets/logo/1.mp4");

    // list of courses <From database>
    courses = [
      {
        "course_id": 1,
        "course_title":
            "Dart full course",
        "course_description":
            "Do you need to organize your widgets into tabs? The DefaultTabController, TabBar, and TabBarView widgets are for you.This video is also subtitled in Chinese, Indonesian, Italian, Japanese, Korean, Portuguese, and Spanish.",
        "channel_name": "wael abo hamza",
        "url_video_introduction": "assets/logo/1.mp4",
        "course_view": "100",
        "course_thumbnail": "assets/logo/math.png",
        "course_rating": "3.6",
        "course_price": 1000,
        "course_createAt": "2024/06/30",
        "professor_id":
            1 // the key of the relation between table professor and table courses
      },
      {
        "course_id": 2,
        "course_title":
            "Flutter full course",
        "course_description":
            "Do you need to organize your widgets into tabs? The DefaultTabController, TabBar, and TabBarView widgets are for you.This video is also subtitled in Chinese, Indonesian, Italian, Japanese, Korean, Portuguese, and Spanish.",
        "channel_name": "wael abo hamza",

        "url_video_introduction": "assets/logo/1.mp4",
        "course_view": "73",
        "course_thumbnail": "assets/logo/english.png",
        "course_rating": "2.0",
        "course_price": 800,
        "course_createAt": "2024/07/1",
        "professor_id":
            2 // the key of the relation between table professor and table courses
      },
    ];
    // List of channels from Database
    posts = [
      {
        "post_id": 1,
        "post_title":
            "Become a Full-Stack Web Developer with just ONE course. HTML, CSS, Javascript, Node, React, MongoDB, Web3 and DApps",
        "post_channel": "Wael abo hamza",
        "post_img": "assets/logo/post1.png",
        "channel_img": "assets/logo/4.png",
        "post_likes": "110",
        "post_createAT": "2024/07/02",
      },
      {
        "post_id": 2,
        "post_title":
            "Vous souhaitez intégrer une université à l’étranger ce mois Septembre? Postulez dès maintenant! ⭐🎓ا حابين تقراو في إحدى أفضل الجامعات في الخارج بدايةً من شهر سبتمبر؟ سجلوا معانا الآن! 🎓 Pour plus d'infos, contactez nous au 0560002235 / 056002236 / 0770242577 et bénéficiez d'une orientation GRATUITE! ",
        "post_channel": "ismail hadi",
        "post_img": "assets/logo/post2.png",
        "channel_img": "assets/logo/3.png",
        "post_likes": "207",
        "post_createAT": "2024/07/07",
      },
    ];
  }
}
