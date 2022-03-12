import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/splash/splash_page.controller.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashPageController>(
      builder: (controller) => Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(
                controller.counter.toString(),
              ),
              InkWell(
                onTap: () {
                  controller.increment();
                },
                child: Text("Tambah"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
