import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ShortVideoController extends GetxController {
  initData();
}

class ShortVideoControllerImp extends ShortVideoController {
  late List shortsVideos;
  late PageController pageController;
  late List channels;

  @override
  void onInit() async {
    await initData();
    super.onInit();
  }

  @override
  initData() async {
    channels = [
      {
        "channel_id": 1,
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
        "channel_id": 2,
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
    ];
    shortsVideos = [
      {
        "short_id": 1,
        "short_title":
            "learn algorithem in 1 min in my channel, follow my channel please",
        "short_url": "assets/logo/2.mp4",
        "short_likes": "107",
        'short_comments': "23",
        "short_userID": 1,
        "short_createAT": "2024/07/21"
      },
      {
        "short_id": 3,
        "short_title":
            "learn algorithem in 1 min in my channel, follow my channel please",
        "short_url": "assets/logo/3.mp4",
        "short_likes": "257",
        'short_comments': "73",
        "short_userID": 1,
        "short_createAT": "2024/07/15"
      },
      {
        "short_id": 4,
        "short_title":
            "learn algorithem in 1 min in my channel, follow my channel please",
        "short_url": "assets/logo/4.mp4",
        "short_likes": "257",
        'short_comments': "73",
        "short_userID": 1,
        "short_createAT": "2024/07/15"
      },
      {
        "short_id": 5,
        "short_title":
            "learn algorithem in 1 min in my channel, follow my channel please",
        "short_url": "assets/logo/5.mp4",
        "short_likes": "257",
        'short_comments': "73",
        "short_userID": 1,
        "short_createAT": "2024/07/15"
      },
    ];

    pageController = PageController();
  }
}
