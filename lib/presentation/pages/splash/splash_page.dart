import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_color.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/splash/splash_page.controller.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashPageController>(
      init: SplashPageController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "AIRPLANE",
                style: AppText.H1(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
