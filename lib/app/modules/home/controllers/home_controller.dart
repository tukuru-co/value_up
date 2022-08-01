import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool check = false.obs;
  RxInt checkNum = 0.obs;
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('values');
  late Stream<QuerySnapshot> _streamShoppingItems;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _streamShoppingItems = _collectionReference.snapshots();

    getListTest();
  }

  /// get data
  Future<List> getListTest() async {
    List nameList = [];

    QuerySnapshot _listName = await _collectionReference.where("ID").get();
    int count = _listName.docs.length;
    print("So luong  length là: " + count.toString());

    // _listName.do
    // for (int i = 0; i < count; i++) {
    //   Map valueItem = new Map();
    //   DocumentSnapshot _listName2 = await
    // }

    return nameList;
  }
}
