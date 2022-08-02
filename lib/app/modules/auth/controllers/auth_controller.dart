import 'package:get/get.dart';

class AuthController extends GetxController {
  // final Rx<User> currentUser = Get.find<AuthService>().user;
   RxBool status = false.obs;
   RxInt id = 1.obs;
   RxString radioButtonItem = 'One'.obs;

  AuthController() {
  }



}
