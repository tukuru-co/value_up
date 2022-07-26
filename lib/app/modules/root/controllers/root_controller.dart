import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:value_up/app/modules/home/views/home.dart';

class RootController extends GetxController {
  // final currentIndex = 0.obs;
  final notificationsCount = 0.obs;

  RootController() {}

  @override
  void onInit() async {
    super.onInit();
  }

  List<Widget> pages = [
    HomeView(),
    // BookingsView(),
    // MessagesView(),
    // AccountView(),
  ];

  // Widget get currentPage => pages[currentIndex.value];
}
