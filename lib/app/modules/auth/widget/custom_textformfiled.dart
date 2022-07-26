import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled({Key? key, required this.hintText, this.backGround, this.suffixIcon})
      : super(key: key);
  final String hintText;
  IconData? suffixIcon;
  Color? backGround;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      key: key,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        fillColor: backGround ?? Colors.white,
        hintText: hintText,
        suffixIcon: Icon(suffixIcon),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
      ),
    );
  }
}
