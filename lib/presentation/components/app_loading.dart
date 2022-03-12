import 'package:flutter/material.dart';

import '../../data/const/app_color.dart';
import 'cube_grid.dart';

class AppLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitCubeGrid(
      size: 51.0,
      color: AppColor.primaryColor,
    );
  }
}