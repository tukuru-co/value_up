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

    return FutureBuilder<QuerySnapshot>(
      future: users,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
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
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('残り',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600)),
                            Text('02:44:00',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        SizedBox(height: 12),
                        GridView(
                          scrollDirection: Axis.vertical,
                          primary: false,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 4.0),
                          children: docs.map((DocumentSnapshot doc) {
                            final data = doc.data() as Map?;
                            return customItemGridView(
                              name: data!['name'],
                              describe: data['discribe'],
                              title: data['title'],
                              imgUrl: data['imgUrl'],
                              price: data['price'],
                              price2: data['price2'],
                              time: data['time'],
                              describeDetail: data['describeDetail'],
                              detailProduct: data['detailProduct'],
                              term: data['term'],
                              priceOld : data['priceOld'],
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 12),
                      ],
                    ),
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

Widget customItemGridView(
    {String? title,
    required String name,
    String? describe,
    String? imgUrl,
    String? price,
    String? price2,
    String? time,
    String? describeDetail,
    String? detailProduct,
    String? term, String? priceOld}) {
  return InkWell(
    onTap: () {
      Get.toNamed(Routes.HOME_DETAIL1, arguments: {
        'imgUrl': imgUrl,
        'describe': describe,
        'name': name,
        'time': time,
        'price': price2,
        'describeDetail': describeDetail,
        'detailProduct': detailProduct,
        'term': term,
        'priceOld ': priceOld,
      });
      // Get.toNamed(Routes.HOME_DETAIL3, arguments: {
      //   'imgUrl': imgUrl,
      //   'describe': describe,
      //   'name': name,
      //   'time': time,
      //   'price': price2,
      //   'describeDetail': describeDetail,
      //   'detailProduct': detailProduct,
      //   'term': term,
      //   'priceOld ': priceOld,
      // });
    },
    child: Container(
      height: Get.height / 3,
      width: Get.width / 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 5,
            child: SizedBox(
              width: Get.width,
              child: Image.network(imgUrl!),
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 5, top: 4, bottom: 4),
                    margin: EdgeInsets.only(left: 5, right: 5, top: 4),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      border: Border.all(width: 0.3, color: Colors.black54),
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Text(title ?? 'ホテル・旅館',
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
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(describe ?? '人気の温泉宿！先着２０名に格安に泊まれるチャンス！',
                    style: TextStyle(color: Colors.black54, fontSize: 12)),
              )),
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                  margin: EdgeInsets.only(left: 5,right: 7, top: 4),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    border: Border.all(width: 0.3, color: Colors.black54),
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  child: Row(
                    children: [
                      Text('千葉',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 13)),
                      Text(price ?? '0',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 13)),
                      Text('千',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 13)),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      priceOld ?? '0',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black54.withOpacity(0.5),
                          fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(width: 4),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '->',
                      style: TextStyle(
                          color: Colors.black54.withOpacity(0.6),
                          fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(width: 4),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(price2 ?? '0,00',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('円',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
