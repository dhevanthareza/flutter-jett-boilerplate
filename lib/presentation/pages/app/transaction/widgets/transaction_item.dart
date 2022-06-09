import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';
import 'package:flutter_jett_boilerplate/domain/entities/transaction/transaaction.entity.dart';
import 'package:flutter_jett_boilerplate/utils/date_utils.dart';
import 'package:flutter_jett_boilerplate/utils/string_utils.dart';

class TransactionItem extends StatelessWidget {
  final TransactionEntity transaction;
  const TransactionItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "EVENT",
          //   style: AppText.titleSmallBold(color: Color(0xFF0093DD)),
          // ),
          const SizedBox(
            height: 3,
          ),
          Text(
            StringUtils.getOrElse(transaction.uraian, "-"),
            style: AppText.standardBold(),
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                transaction.paidAt != null ? AppDateUtils.formatFromString(transaction.paidAt, format: "dd / MM / yyyy") : "-",
                style: AppText.titleSmall(),
              ),
              Text(
                transaction.total != null ? StringUtils.toIdr(transaction.total!) : "-",
                style: AppText.titleSmallBold(
                  color: const Color(0xFFFFAB00),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
