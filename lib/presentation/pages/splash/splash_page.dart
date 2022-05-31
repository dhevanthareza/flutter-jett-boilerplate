import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_color.dart';
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
        body: Container(
          decoration: BoxDecoration(
            color: AppColor.backgroundColor,
            image: DecorationImage(
                image: Image.asset("assets/images/splash_icon.png").image,
                alignment: Alignment.bottomCenter),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 125,),
              Image.asset("assets/images/logo.png"),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "SIAP PARI",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "SISTEM INFORMASI ANGGOTA DAN PEMBAYARAN PERHIMPUNAN RADIOGRAFER INDONESIA",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
