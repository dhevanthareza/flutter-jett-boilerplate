import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [AppButton(title: "Register", onPressed: () {
            Navigator.pushNamed(context, "/user/register");
          })],
        ),
      ),
    );
  }
}
