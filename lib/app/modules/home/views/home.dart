import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:value_up/app/modules/home/controllers/home_controller.dart';
import 'package:value_up/app/routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Future<QuerySnapshot> users =
        FirebaseFirestore.instance.collection('products').get();
    // CollectionReference users =
    //     FirebaseFirestore.instance.collection('products');

    return FutureBuilder<QuerySnapshot>(
      // future: users.doc(documentId).get(),
      future: users,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("-------------" + snapshot.error.toString());
          return Container(color: Colors.white);
        } else if (snapshot.hasData) {
          final docs = snapshot.data!.docs;
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text('サカオク',
                    style: Get.textTheme.subtitle2!.merge(TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700))),
                centerTitle: true,
                elevation: 0,
                actions: [
                  Icon(
                    Icons.notifications_none,
                    color: Colors.black54,
                  ),
                ],
                bottom: TabBar(
                  tabs: [
                    Tab(
                        child: Text(
                      '開催中',
                      style: TextStyle(color: Colors.black.withOpacity(0.5)),
                    )),
                    Tab(
                        child:
                            Text('おすすめ', style: TextStyle(color: Colors.blue))),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  GridView(
                    scrollDirection: Axis.vertical,
                    primary: false,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0),
                    children: docs.map((DocumentSnapshot doc) {
                      final data = doc.data() as Map?;
                      return customItemGridView(
                          name: data!['name'], describe: data['describe']);
                    }).toList(),
                  ),
                  Center(child: Text("No result")),
                ],
              ),
            ),
          );
        }
        return CircularProgressIndicator(backgroundColor: Colors.white);
      },
    );
  }
}

Widget reComment({required String name, String? describe}) {
  return Container(
    height: Get.height,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('残り',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
            Text('02:44:00',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 25,
                    fontWeight: FontWeight.w400)),
          ],
        ),
        Expanded(
          child: GridView.builder(
            itemCount: 8,
            scrollDirection: Axis.vertical,
            primary: false,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext context, int index) {
              return customItemGridView(name: name, describe: describe);
            },
          ),
        ),
        SizedBox(height: 12),
      ],
    ),
  );
}

Widget customItemGridView({required String name, String? describe}) {
  return InkWell(
    onTap: () {
      Get.toNamed(Routes.HOME_DETAIL3);
    },
    child: Container(
      height: Get.height / 3,
      width: Get.width / 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 10,
            child: SizedBox(
              width: Get.width,
              child: Image.network(
                  'https://cdn.tgdd.vn/2020/07/content/h2-800x450-7.png'),
            ),
          ),
          // 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
          Flexible(
            flex: 7,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                    margin: EdgeInsets.only(left: 5, top: 4),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      border: Border.all(width: 0.3, color: Colors.black54),
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Text('ホテル・旅館',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 11)),
                  ),
                ),
                Expanded(
                    child: Text(name,
                        style: TextStyle(color: Colors.black54, fontSize: 10))),
              ],
            ),
          ),
          Flexible(
              flex: 8,
              child: Text(describe ?? '人気の温泉宿！先着２０名に格安に泊まれるチャンス！',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Flexible(
            flex: 7,
            child: Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                  margin: EdgeInsets.only(left: 5, top: 4),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    border: Border.all(width: 0.3, color: Colors.black54),
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  child: Text('千葉船橋',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5), fontSize: 13)),
                ),
                Text('ホテル・旅館',
                    style: TextStyle(color: Colors.black54, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
