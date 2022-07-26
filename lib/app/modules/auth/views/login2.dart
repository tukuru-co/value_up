import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:value_up/app/modules/auth/controllers/auth_controller.dart';
import 'package:value_up/app/modules/auth/widget/custom_button.dart';
import 'package:value_up/app/routes/app_routes.dart';

class LoginView2 extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('ログイン',
            style: Get.textTheme.subtitle2!.merge(TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w700))),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.cancel_outlined, color: Get.theme.hintColor),
          onPressed: () => {Get.back()},
        ),
        shape: Border(
            bottom: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1)),
      ),
      body: Column(
        children: [
          SizedBox(height: 17),
          TextFormField(
            maxLines: 1,
            key: key,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              fillColor: Colors.white,
              hintText: 'ユーザーID',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
          TextFormField(
            maxLines: 1,
            key: key,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              fillColor: Colors.white,
              hintText: 'パスワード',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
          SizedBox(
            height: 19,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.LOGIN3);
            },
            child: CustomButton(
                namevalue: 'メールアドレスでログインする', icons: Icons.email_outlined),
          ),
          SizedBox(
            height: 14,
          ),
          Text("ユーザーID、パスワードをお忘れの方",
              style: Get.textTheme.bodyText1!
                  .merge(TextStyle(color: Color(0xFF2A95B5), fontSize: 12))),
          SizedBox(
            height: 14,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(children: <Widget>[
              Expanded(
                  child: Divider(
                color: Colors.black54,
              )),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text("もしくは",
                    style: TextStyle(color: Colors.grey, fontSize: 13)),
              ),
              Expanded(child: Divider(color: Colors.black54)),
            ]),
          ),
          SizedBox(
            height: 14,
          ),
          CustomButton(
            namevalue: "会員登録はこちら",
            backGround: Colors.white,
          )
        ],
      ),
    );
  }
}
