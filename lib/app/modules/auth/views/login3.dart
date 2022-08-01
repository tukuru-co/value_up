import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:value_up/app/modules/auth/controllers/auth_controller.dart';
import 'package:value_up/app/modules/auth/widget/custom_button.dart';
import 'package:value_up/app/modules/auth/widget/custom_textformfiled.dart';
import 'package:value_up/app/routes/app_routes.dart';
import 'package:value_up/app/services/auth_service.dart';

class LoginView3 extends GetView<AuthController> {

  TextEditingController _pass = TextEditingController();
  TextEditingController _email = TextEditingController();

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
        shape: Border(
            bottom: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            textLabel('会員登録', '（必須）'),
            CustomTextFiled(controller: _email,hintText: 'example@email.com'),
            textLabel('パスワード', '（必須）'),
            CustomTextFiled(controller: _pass,hintText: ''),
            textLabel('氏名', '（必須）'),
            CustomTextFiled(hintText: '田中　太郎'),
            textLabel('ニックネーム', '（必須）'),
            CustomTextFiled(hintText: 'TAROU'),
            textLabel('電話番号', '（必須）'),
            CustomTextFiled(hintText: '080-1234-5678'),
            textLabel('生年月日', '（必須）'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Text('西暦',
                      style: Get.textTheme.subtitle2!
                          .merge(TextStyle(color: Colors.grey, fontSize: 15))),
                ),
              ],
            ),
            CustomTextFiled(hintText: '', suffixIcon: Icons.arrow_drop_down),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 14, right: 15),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                        child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('月',
                              style: Get.textTheme.subtitle2!.merge(
                                  TextStyle(color: Colors.grey, fontSize: 15))),
                        ),
                        CustomTextFiled(
                            hintText: '', suffixIcon: Icons.arrow_drop_down),
                      ],
                    )),
                  ),
                  SizedBox(width: 13),
                  Flexible(
                    child: Container(
                        child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('日',
                              style: Get.textTheme.subtitle2!.merge(
                                  TextStyle(color: Colors.grey, fontSize: 15))),
                        ),
                        CustomTextFiled(
                            hintText: '', suffixIcon: Icons.arrow_drop_down),
                      ],
                    )),
                  ),
                ],
              ),
            ),
            textLabel('生年月日', '（必須）'),
            customRadioButton(),
            Container(
              width: Get.width,
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.3, color: Colors.black54),
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Text('利用規約',
                          style: Get.textTheme.subtitle2!.merge(
                              TextStyle(color: Colors.blue, fontSize: 13))),
                      Text('に同意する',
                          style: Get.textTheme.subtitle2!.merge(TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 13))),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      CustomSwitch(
                        activeColor: Colors.redAccent,
                        value: controller.status.value,
                        onChanged: (valuee) {
                          print("VALUE : $valuee");
                          Obx(() => InkWell(
                                onTap: () {
                                  controller.status.value = valuee;
                                },
                              ));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 19,
            ),
            InkWell(
              onTap: () async{
                bool result = await register(_email.text, _pass.text);
                if( result == true){
                  Get.toNamed(Routes.ROOT);
                }else{

                }
              },
              child: CustomButton(namevalue: '登録する'),
            ),
            SizedBox(
              height: 39,
            ),
          ],
        ),
      ),
    );
  }

  Widget customRadioButton() {
    int id = 1;
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: id,
                onChanged: (val) {
                  // setState(() {
                  //   radioButtonItem = 'ONE';
                  //   id = 1;
                  // });
                },
              ),
              Text(
                '男性',
                style: new TextStyle(fontSize: 17.0),
              ),
              Radio(
                value: 2,
                groupValue: id,
                onChanged: (val) {
                  // setState(() {
                  //   radioButtonItem = 'TWO';
                  //   id = 2;
                  // });
                },
              ),
              Text(
                '女性',
                style: new TextStyle(
                  fontSize: 17.0,
                ),
              ),
              Radio(
                value: 3,
                groupValue: id,
                onChanged: (val) {
                  // setState(() {
                  //   radioButtonItem = 'THREE';
                  //   id = 3;
                  // });
                },
              ),
              Text(
                '該当しない',
                style: new TextStyle(fontSize: 17.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget textLabel(String text1, String text2) {
    return Padding(
      padding: EdgeInsets.only(left: 14, top: 9, bottom: 8),
      child: Row(
        children: [
          Text(text1,
              style: Get.textTheme.subtitle2!
                  .merge(TextStyle(color: Colors.black, fontSize: 15))),
          Text(text2,
              style: Get.textTheme.subtitle2!
                  .merge(TextStyle(color: Colors.red[800], fontSize: 15))),
        ],
      ),
    );
  }
}
