import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:value_up/app/modules/auth/controllers/auth_controller.dart';
import 'package:value_up/app/modules/auth/widget/custom_button.dart';
import 'package:value_up/app/routes/app_routes.dart';

class LoginView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: EdgeInsets.only(
          top: Get.height / 5,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("サカオク",
                    style: Get.textTheme.subtitle2!
                        .merge(TextStyle(color: Colors.black, fontSize: 31))),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: (){
                Get.toNamed(Routes.LOGIN3);
              },
              child: CustomButton(
                  namevalue: 'メールアドレスで登録する',
                  icons: Icons.email_outlined),
            ),
            SizedBox(height: 14),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.LOGIN2);
              },
              child: Text("ログインはこちら",
                  style: Get.textTheme.bodyText1!
                      .merge(TextStyle(color: Color(0xFF2A95B5), fontSize: 12))),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
