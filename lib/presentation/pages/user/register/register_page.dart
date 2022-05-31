import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_color.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/user/register/register_page.controller.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RegisterPageController>(
        init: RegisterPageController(),
        builder: (state) {
          return Container(
            color: AppColor.backgroundColor,
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    Image.asset("assets/images/logo.png"),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "SIAP PARI",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      "LOGIN",
                      style: TextStyle(color: AppColor.primaryColor, fontSize: 14, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
