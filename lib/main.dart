import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/config.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/auth/login/login_page.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/auth/register/register_page.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/splash/splash_page.controller.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/splash/splash_page.dart';
import 'package:get/get.dart';

import 'data/provider/singleton/falvor_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: AppConfig.flavor,
    color: Colors.deepPurple,
  );
  Get.lazyPut(()=>SplashPageController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Jett Boilerplate',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashPage(),
        ),
        GetPage(
          name: '/user/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/user/register',
          page: () => RegisterPage(),
        ),
      ],
    );
  }
}
