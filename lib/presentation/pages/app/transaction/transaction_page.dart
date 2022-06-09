import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';
import 'package:flutter_jett_boilerplate/domain/entities/transaction/transaaction.entity.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_load_more.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/event/widgets/event_item.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/transaction/transaction_page.controller.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/transaction/widgets/transaction_item.dart';
import 'package:get/get.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TransactionPageController(),
      builder: (state) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Transaksi",
              style: AppText.titleBig(),
            ),
            AppLoadMore(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                onTap: () {},
                itemWidget: (transactionJson) {
                  return TransactionItem(
                    transaction: TransactionEntity.fromJson(transactionJson),
                  );
                },
                controller: TransactionPageController.to)
          ]),
        ),
      ),
    );
  }
}
