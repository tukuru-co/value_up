import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:value_up/app/modules/auth/controllers/auth_controller.dart';

class StoreView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('会員登録',
              style: Get.textTheme.subtitle2!.merge(TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700))),
          centerTitle: true,
          elevation: 0,
          // automaticallyImplyLeading: false,
          leading: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined,
                    color: Get.theme.hintColor),
                onPressed: () => {Get.back()},
              ),
            ],
          ),
        ));
  }
}
