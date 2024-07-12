import 'package:education_app/features/authentication/screens/home/course_details/course_details.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

abstract class HomeController extends GetxController {
  initData();
  onTapCourse(int i);
}

class HomeControllerImp extends HomeController {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  late List courses;
  late List posts;
  late List channels;

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
    channels = [
      {
        "channel_id": "1",
        "channel_name": "moha Med",
        "channel_img": "assets/logo/1.png",
        "channel_desc":
            "i'am a professor of mathimatique, i work to help students",
        "channel_phone": "0799148952",
        "channel_email": "mohamed@gmail.com",
        "channel_type": "professor",
        "channel_likes": "95",
        "channel_createAT": "2024/01/08"
      },
      {
        "channel_id": "2",
        "channel_name": "I smail MS",
        "channel_img": "assets/logo/2.png",
        "channel_desc":
            "i'am a professor of mathimatique, i work to help students",
        "channel_phone": "0799148952",
        "channel_email": "mohamed@gmail.com",
        "channel_type": "student",
        "channel_likes": "89",
        "channel_createAT": "2024/01/24"
      },
      {
        "channel_id": 3,
        "channel_name": "Dr Wael",
        "channel_img": "assets/logo/3.png",
        "channel_desc":
            "i'am a professor of mathimatique, i work to help students",
        "channel_phone": "0799148952",
        "channel_email": "mohamed@gmail.com",
        "channel_type": "student",
        "channel_likes": "65",
        "channel_createAT": "2024/01/18"
      },
      {
        "channel_id": 4,
        "channel_name": "Dr Ahmed",
        "channel_img": "assets/logo/4.png",
        "channel_desc":
            "i'am a professor of mathimatique, i work to help students",
        "channel_phone": "0799148952",
        "channel_email": "mohamed@gmail.com",
        "channel_type": "professor",
        "channel_likes": "115",
        "channel_createAT": "2024/01/18"
      },
      {
        "channel_id": 5,
        "channel_name": "Dr Loay",
        "channel_img": "assets/logo/5.png",
        "channel_desc":
            "i'am a professor of mathimatique, i work to help students",
        "channel_phone": "0799148952",
        "channel_email": "mohamed@gmail.com",
        "channel_type": "student",
        "channel_likes": "205",
        "channel_createAT": "2024/01/18"
      },
    ];
    // list of courses <From database>
    courses = [
      {
        "course_id": 1,
        "course_title": "Dart full course",
        "course_description":
            "Do you need to organize your widgets into tabs? The DefaultTabController, TabBar, and TabBarView widgets are for you.This video is also subtitled in Chinese, Indonesian, Italian, Japanese, Korean, Portuguese, and Spanish.",
        "channel_name": "wael abo hamza",
        "channel_img": "assets/logo/3.png",

        "url_video_introduction": "assets/logo/1.mp4",
        "course_view": "100",
        "course_thumbnail": "assets/logo/math.png",
        "course_rating": 4.6,
        "course_price": 1000,
        "course_createAt": "2024/06/30",
        "channel_id":
            1 // the key of the relation between table professor and table courses
      },
      {
        "course_id": 2,
        "course_title": "Flutter full course",
        "course_description":
            "Do you need to organize your widgets into tabs? The DefaultTabController, TabBar, and TabBarView widgets are for you.This video is also subtitled in Chinese, Indonesian, Italian, Japanese, Korean, Portuguese, and Spanish.",
        "channel_name": "wael abo hamza",
        "channel_img": "assets/logo/2.png",

        "url_video_introduction": "assets/logo/1.mp4",
        "course_view": "73",
        "course_thumbnail": "assets/logo/english.png",
        "course_rating": 3.5,
        "course_price": 800,
        "course_createAt": "2024/07/1",
        "channel_id":
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

  @override
  onTapCourse(i) {
    Get.to(() => const CourseDetails(), arguments: [
      {
        "course_id": courses[i]["course_id"],
        "course_title": courses[i]["course_title"],
        "course_desc": courses[i]["course_description"],
        "channel_name": courses[i]["channel_name"],
        "channel_img": courses[i]["channel_img"],
        "url_video_introduction": courses[i]["url_video_introduction"],
        "course_view": courses[i]["course_view"],
        "course_thumbnail": courses[i]["course_thumbnail"],
        "course_rating": courses[i]["course_rating"],
        "course_price": courses[i]["course_price"],
        "course_createAt": courses[i]["course_createAt"],
        "channel_id": courses[i]["channel_id"]
      }
    ]);
  }
}
