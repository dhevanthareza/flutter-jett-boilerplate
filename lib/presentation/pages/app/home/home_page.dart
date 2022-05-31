import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/home/home_page.controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomePageController(),
      builder: (state) {
        return const Scaffold(
          body: Center(
            child: Text("home"),
          ),
        );
      },
    );
  }
}
