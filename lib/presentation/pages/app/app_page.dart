import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_color.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/app_page.controller.dart';
import 'package:get/get.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppPageController>(
      init: AppPageController(),
      builder: (state) => Scaffold(
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColor.primaryColor,
            selectedLabelStyle:
                const TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
            unselectedLabelStyle:
                const TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
            selectedItemColor: Colors.white,
            unselectedItemColor: AppColor.primaryLightColor,
            currentIndex: state.selectedMenuIndex,
            onTap: (index) {
              state.setMenuIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.folder),
                label: 'Pengajuan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event),
                label: 'Event',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.compare_arrows),
                label: 'Transaksi',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Akun',
              ),
            ],
          ),
        ),
        body: Container(
          color: AppColor.backgroundColor,
          width: double.infinity,
          height: double.infinity,
          child: state.menus[state.selectedMenuIndex],
        ),
      ),
    );
  }
}
