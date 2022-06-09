import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/event/event_page.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/home/home_page.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/pengajuan/pengajuan_page.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/profile/profile_page.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/transaction/transaction_page.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/transaction/widgets/transaction_item.dart';
import 'package:get/get.dart';

class AppPageController extends GetxController {
  static AppPageController get to => Get.find();
  int selectedMenuIndex = 0;
  List<Widget> menus = [
    HomePage(),
    PengajuanPage(),
    EventPage(),
    TransactionPage(),
    ProfilePage()
  ];
  setMenuIndex(int index) {
    selectedMenuIndex = index;
    update();
  }
}
