import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';
import 'package:flutter_jett_boilerplate/domain/entities/invoice/invoice.entity.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_load_more.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/tagihan/tagihan_page.controller.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/tagihan/widgets/tagihan_item.dart';
import 'package:get/get.dart';

class TagihanPage extends StatelessWidget {
  const TagihanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Tagihan",
          style: AppText.titleBig(),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GetBuilder<TagihanPageController>(
        init: TagihanPageController(),
        builder: (state) => AppLoadMore<TagihanPageController>(
            onTap: () {},
            itemWidget: (tagihanJson) {
              return TagihanItem(
                invoice: InvoiceEntity.fromJson(tagihanJson),
              );
            },
            controller: TagihanPageController.to),
      ),
    );
  }
}
