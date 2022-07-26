import 'package:get/get.dart';
import 'package:value_up/app/modules/home/controllers/home_controller.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
          () => AuthController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
  }
}
