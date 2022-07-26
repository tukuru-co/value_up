import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.namevalue, this.icons, this.backGround})
      : super(key: key);
  final String namevalue;
  IconData? icons;
  Color? backGround;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: Get.width,
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: backGround ?? Colors.red[400],
        border: Border.all(
            width: 0.3,
            color: backGround != null ? Colors.black54 : Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icons, color: Colors.white70.withOpacity(0.6)),
          SizedBox(width: 10),
          Text(namevalue,
              style: Get.textTheme.bodyText1!.merge(TextStyle(
                  color: backGround != null ? Colors.black87 : Colors.white70,
                  fontSize: 12))),
        ],
      ),
    );
  }
}
