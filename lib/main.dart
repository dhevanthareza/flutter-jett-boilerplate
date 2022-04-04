import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/config.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_loading.dart';
import 'package:flutter_jett_boilerplate/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:load/load.dart';

import 'data/provider/singleton/falvor_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: AppConfig.flavor,
    color: Colors.deepPurple,
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (BuildContext context, dynamic child) {
        return LoadingProvider(
          child: child,
          themeData: LoadingThemeData(tapDismiss: false),
          loadingWidgetBuilder: (ctx, data) => Center(child: AppLoading()),
        );
      },
      title: 'Jett Boilerplate',
      initialRoute: '/',
      getPages: Routes.routes,
    );
  }
}
