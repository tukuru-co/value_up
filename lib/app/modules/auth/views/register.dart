import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:value_up/app/models/user.dart';
import 'package:value_up/app/modules/auth/controllers/auth_controller.dart';
import 'package:value_up/app/modules/auth/widget/custom_button.dart';
import 'package:value_up/app/modules/auth/widget/custom_textformfiled.dart';
import 'package:value_up/app/modules/home/views/home.dart';

class LoginView3 extends GetView<AuthController> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _pass = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _nickname = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _day = TextEditingController();
  TextEditingController _month = TextEditingController();
  TextEditingController _year = TextEditingController();
  TextEditingController _gen = TextEditingController();

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
            Flexible(
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined,
                    color: Colors.blue),
                onPressed: () => {Get.back()},
              ),
            ),
            Flexible(
              child: Text('戻る',
                  style: Get.textTheme.subtitle2!.merge(TextStyle(
                      color: Colors.blue,
                      fontSize: 11,
                      fontWeight: FontWeight.w500))),
            ),
          ],
        ),
        shape: Border(
            bottom: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              textLabel('メールアドレス', '（必須）'),
              CustomTextFiled(
                controller: _email,
                hintText: 'example@email.com',
                type: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please Enter Your Email");
                  }
                  // reg expression for email validation
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return ("Please Enter a valid email");
                  }
                  return null;
                },
              ),
              textLabel('パスワード', '（必須）'),
              CustomTextFiled(
                  obscureText: true,
                  controller: _pass,
                  hintText: '',
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return ("Password is required for login");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid Password(Min. 6 Character)");
                    }
                  }),
              textLabel('氏名', '（必須）'),
              CustomTextFiled(
                hintText: '田中　太郎',
                controller: _fullname,
                // key: _formName,
              ),
              textLabel('ニックネーム', '（必須）'),
              CustomTextFiled(
                hintText: 'TAROU',
                controller: _nickname,
              ),
              textLabel('電話番号', '（必須）'),
              CustomTextFiled(
                controller: _phone,
                hintText: '080-1234-5678',
                type: TextInputType.phone,
              ),
              textLabel('生年月日', '（必須）'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text('西暦',
                        style: Get.textTheme.subtitle2!.merge(
                            TextStyle(color: Colors.grey, fontSize: 15))),
                  ),
                ],
              ),
              CustomTextFiled(
                hintText: '',
                suffixIcon: Icons.arrow_drop_down,
                controller: _year,
              ),
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
                                style: Get.textTheme.subtitle2!.merge(TextStyle(
                                    color: Colors.grey, fontSize: 15))),
                          ),
                          CustomTextFiled(
                            hintText: '',
                            suffixIcon: Icons.arrow_drop_down,
                            controller: _month,
                          ),
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
                                style: Get.textTheme.subtitle2!.merge(TextStyle(
                                    color: Colors.grey, fontSize: 15))),
                          ),
                          CustomTextFiled(
                              hintText: '',
                              suffixIcon: Icons.arrow_drop_down,
                              controller: _day),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
              textLabel('性別', '（必須）'),
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
                onTap: () {
                  signUp(_email.text, _pass.text);
                },
                child: CustomButton(namevalue: '登録する'),
              ),
              SizedBox(
                height: 39,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customRadioButton() {
    return Container(
      child: Column(
        children: <Widget>[
          Obx(
            () => Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: controller.id.value,
                    onChanged: (val) {
                      controller.id.value = 1;
                      controller.radioButtonItem = 'One'.obs;
                    },
                  ),
                  Text(
                    '男性',
                    style: new TextStyle(fontSize: 17.0),
                  ),
                  Radio(
                    value: 2,
                    groupValue: controller.id.value,
                    onChanged: (val) {
                      controller.id.value = 2;
                      controller.radioButtonItem = 'Two'.obs;
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
                    groupValue: controller.id.value,
                    onChanged: (val) {
                      controller.id.value = 3;
                      controller.radioButtonItem = 'Three'.obs;
                    },
                  ),
                  Text(
                    '該当しない',
                    style: new TextStyle(fontSize: 17.0),
                  ),

                  // controller.id.value == 1? _gen.text = '男性' :controller.id.value ==2 _gen =''
                ],
              ),
            ),
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

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  void postDetailsToFirestore() async {
    controller.id.value == 1
        ? _gen.text = '男性'
        : controller.id.value == 2
            ? _gen.text = '女性'
            : _gen.text = '該当しない';

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fullName = _fullname.text;
    userModel.nickName = _nickname.text;
    userModel.phone = _phone.text;
    userModel.month = _month.text;
    userModel.day = _day.text;
    userModel.year = _year.text;

    userModel.gen = _gen.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Get.to(HomeView());
  }
}
