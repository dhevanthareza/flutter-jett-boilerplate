import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/home/home_page.controller.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/pengajuan/widgets/pengajuan_item.dart';
import 'package:get/get.dart';

class PengajuanPage extends StatelessWidget {
  const PengajuanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomePageController(),
      builder: (state) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pengajuan",
                  style: AppText.titleBig(),
                ),
                const SizedBox(
                  height: 5,
                ),
                PengajuanItem(),
                PengajuanItem(isPublished: false,),
              ],
            ),
          ),
        );
      },
    );
  }
}
