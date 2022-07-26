import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:value_up/app/modules/home/controllers/home_controller.dart';

class HomeDetail1 extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: Get.height / 3,
            child: Image.network(
                'https://cdn.tgdd.vn/2020/07/content/h2-800x450-7.png'),
          ),
          Container(
              padding: EdgeInsets.only(left: 12, right: 10),
              child: Column(
                children: [
                  Text('人気の温泉宿！先着２０名に格安に泊まれるチャンス！',
                      style: TextStyle(color: Colors.black, fontSize: 17)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('千葉・船橋 ',
                          style: TextStyle(color: Colors.black, fontSize: 11)),
                      SizedBox(width: 13),
                      Container(
                        padding: EdgeInsets.only(
                            left: 1, right: 1, top: 2, bottom: 2),
                        color: Colors.grey.withOpacity(0.4),
                        child: Row(
                          children: [
                            Icon(Icons.av_timer_outlined,
                                color: Colors.black.withOpacity(0.4), size: 19),
                            Text('残り時間02:44:00',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10)),
                          ],
                        ),
                      ),
                      SizedBox(width: 13),
                      Text('現在 ',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 9)),
                      Text(' 20,000円',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(height: 13),
                  Text(
                      '概要が入ります。概要が入ります。概要が入ります。概要が入ります。概要が入ります。概要が入ります。概要が入ります。  ',
                      style: TextStyle(color: Colors.grey, fontSize: 11)),
                  SizedBox(height: 6),
                  Container(
                    width: Get.width,
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                    margin: EdgeInsets.only(left: 5, top: 4),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      border: Border.all(width: 0.3, color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    child: Center(
                        child: Text('購入する',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 13,
                                fontWeight: FontWeight.bold))),
                  ),
                ],
              )),
          SizedBox(height: 15),
          customTabView(),
          Container(
            width: Get.width,
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0.3, color: Colors.black54),
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            child: Row(
              children: [
                Icon(Icons.downloading, color: Colors.blue, size: 28),
                SizedBox(
                  width: 8,
                ),
                Text('TUKURU株式会社',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8), fontSize: 14)),
                Spacer(),
                Icon(
                  Icons.navigate_next_sharp,
                  color: Colors.grey,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget customTabView() {
    return Obx(() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  controller.check.value = false;
                  controller.checkNum.value = 0;
                  controller.update();
                },
                child: Container(
                  width: Get.width / 2,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: controller.checkNum.value == 0
                                  ? Colors.blue
                                  : Colors.grey,
                              width: controller.checkNum.value == 0 ? 4 : 1))),
                  child: Center(
                    child: Text('商品詳細',
                        style: TextStyle(
                            color: controller.checkNum == 0
                                ? Colors.blue
                                : Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.check.value = true;
                  controller.checkNum.value = 1;
                  controller.update();
                },
                child: Container(
                  width: Get.width / 2,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: controller.checkNum.value == 1
                                  ? Colors.blue
                                  : Colors.grey,
                              width: controller.checkNum.value == 1 ? 4 : 1))),
                  child: Center(
                    child: Text('商品詳細',
                        style: TextStyle(
                            color: controller.checkNum == 1
                                ? Colors.blue
                                : Colors.grey,
                            fontSize: 13)),
                  ),
                ),
              ),
            ],
          ),
          controller.checkNum.value == 0
              ? customItemTabView1()
              : customItemTabView2(),
        ],
      );
    });
  }

  Widget customItemTabView1() {
    return Container(
      padding: EdgeInsets.only(left: 13, right: 13, bottom: 20, top: 10),
      child: Text(
          '詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入りま',
          style: TextStyle(color: Colors.grey, fontSize: 12)),
    );
  }

  Widget customItemTabView2() {
    return Container(
      child: Center(
        child: Text(
            '詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入ります。詳しい説明が入りま',
            style: TextStyle(color: Colors.grey, fontSize: 12)),
      ),
    );
  }
}
