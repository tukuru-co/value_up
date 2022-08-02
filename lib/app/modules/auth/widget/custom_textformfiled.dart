import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled(
      {Key? key,
      required this.hintText,
      this.backGround,
      this.suffixIcon,
      this.controller,
      this.type, this.validator, this.obscureText})
      : super(key: key);
  final String hintText;
  IconData? suffixIcon;
  Color? backGround;
  TextEditingController? controller;
  TextInputType? type;
  bool? obscureText;
  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // obscureText: true,///
      obscureText: obscureText?? false,
       autofocus: false,///dissalble pass
      maxLines: 1,
      key: key,
      keyboardType: type ?? TextInputType.text,
      validator: validator,
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
