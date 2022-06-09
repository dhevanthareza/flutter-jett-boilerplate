import 'package:flutter_jett_boilerplate/presentation/pages/app/app_page.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/event/detail/event_detail_page.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/home/home_page.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/notification/notification_page.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/tagihan/tagihan_page.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/user/auth_page.dart';
import 'package:get/get.dart';

import 'presentation/pages/splash/splash_page.dart';
import 'presentation/pages/user/login/login_page.dart';
import 'presentation/pages/user/register/register_page.dart';

class Routes {
  static List<GetPage> routes = [
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
    GetPage(
      name: '/home',
      page: () => HomePage(),
    ),
    GetPage(
      name: '/user/auth',
      page: () => AuthPage(),
    ),
    GetPage(
      name: '/app',
      page: () => AppPage(),
    ),
    GetPage(
      name: '/notification',
      page: () => NotificationPage(),
    ),
    GetPage(
      name: '/tagihan',
      page: () => TagihanPage(),
    ),
    GetPage(
      name: '/event/:eventId',
      page: () => EventDetailPage(),
    ),
  ];
}
