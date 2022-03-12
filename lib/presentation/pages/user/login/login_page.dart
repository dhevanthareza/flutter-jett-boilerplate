import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_color.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_button.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_text_field.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/user/login/login_page.controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginPageController>(
      init: LoginPageController(),
      builder: (state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [title(), inputSection(state), submitButton(state)],
            ),
          ),
        );
      },
    );
  }

  Widget title() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Text(
        "Login",
        style: AppText.H1(color: AppColor.primaryColor),
      ),
    );
  }

  Widget inputSection(LoginPageController state) {
    Widget emailInput() {
      return AppTextField(
        hintText: "Your email adress",
        title: "Email Address",
        controller: state.emailTextController,
      );
    }

    Widget passwordInput() {
      return AppTextField(
        title: "Password",
        hintText: "Your password",
        obscureText: true,
        controller: state.passwordTextController,
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [emailInput(), passwordInput()],
      ),
    );
  }

  Widget submitButton(LoginPageController state) {
    return AppButton(
      title: "Login",
      onPressed: () {
        state.login();
      },
    );
  }
}
