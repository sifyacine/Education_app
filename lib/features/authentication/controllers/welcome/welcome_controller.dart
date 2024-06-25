import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

abstract class WelcomeController extends GetxController {
  initData();
}

class WelcomeControllerImp extends WelcomeController {
  @override
  void onInit() async {
    await initData();
    super.onInit();
  }

  @override
  void onClose() async {
    super.onClose();
  }

  @override
  initData() async {}
}
