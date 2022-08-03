import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool check = false.obs;
  RxInt checkNum = 0.obs;
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('values');
  late Stream<QuerySnapshot> _streamShoppingItems;

  String? imgUrl='';
  String? describe='';
  String? name='';
  String? time='';
  String? price='';
  String? describeDetail='';
  String? detailProduct='';
  String? term='';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _streamShoppingItems = _collectionReference.snapshots();

    var arguments = Get.arguments as Map<String, dynamic>;
    imgUrl = arguments['imgUrl'] as String;
    describe = arguments['describe'] as String;
    name = arguments['name'] as String;
    time = arguments['time'] as String;
    price = arguments['price'] as String;
    describeDetail = arguments['describeDetail'] as String;
    detailProduct = arguments['detailProduct'] as String;
    term = arguments['term'] as String;
    getListTest();
  }

  /// get data
  Future<List> getListTest() async {
    List nameList = [];

    QuerySnapshot _listName = await _collectionReference.where("ID").get();

    return nameList;
  }
}
