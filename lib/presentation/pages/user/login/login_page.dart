import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_color.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_button.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_text_field.dart';
import 'package:get/get.dart';

import 'login_page.controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginPageController>(
        init: LoginPageController(),
        builder: (state) {
          return Container(
            color: AppColor.backgroundColor,
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      title: "Nomor Anggota",
                      hintText: "3173101200598",
                      controller: state.memberNumberTextController,
                      prefixIcon: const Icon(
                        Icons.picture_in_picture_alt_outlined,
                        color: Color(0xFF828282),
                        size: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AppTextField(
                      title: "Password",
                      hintText: "*********",
                      controller: state.passwordTextController,
                      obscureText: !state.showPassword,
                      prefixIcon: const Icon(
                        Icons.picture_in_picture_alt_outlined,
                        color: Color(0xFF828282),
                        size: 18,
                      ),
                      suffixIcon: Icon(
                        state.showPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color(0xFF828282),
                        size: 18,
                      ),
                      onSuffixTap: () {
                        state.handleToogleShowPassword();
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "untuk login awal menggunakan password tanggal lahir",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 29),
                    AppButton(
                        title: "Login",
                        onPressed: () {
                          state.handlLogin();
                        })
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
