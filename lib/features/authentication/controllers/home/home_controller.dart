import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

abstract class HomeController extends GetxController {
  initData();
}

class HomeControllerImp extends HomeController {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  @override
  void onInit() async {
    await initData();
    super.onInit();
  }

  @override
  void onClose() async {
    chewieController!.dispose();
    super.onClose();
  }

  @override
  initData() async {
    videoPlayerController = VideoPlayerController.asset("assets/logo/1.mp4");

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      showControls: true,
    );
  }
}
