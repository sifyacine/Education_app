import 'package:get/get_state_manager/get_state_manager.dart';


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
  initData() async {}
}
