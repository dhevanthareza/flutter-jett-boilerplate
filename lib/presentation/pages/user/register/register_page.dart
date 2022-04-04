import 'package:flutter/material.dart';
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
          return state.registerStepWidgets[state.currentStep];
        },
      ),
    );
  }
}
