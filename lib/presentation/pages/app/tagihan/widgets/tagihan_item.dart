import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/domain/entities/invoice/invoice.entity.dart';
import 'package:flutter_jett_boilerplate/utils/date_utils.dart';
import 'package:flutter_jett_boilerplate/utils/string_utils.dart';

import '../../../../../data/const/app_text.dart';

class TagihanItem extends StatelessWidget {
  final InvoiceEntity invoice;
  const TagihanItem({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, right: 20, left: 20),
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:
            invoice.isPaid == 1 ? const Color(0xFFF9FFF7) : Color(0xFFFFF4F4),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 10),
              blurStyle: BlurStyle.normal)
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringUtils.getOrElse(invoice.uraian, ""),
                  style: AppText.titleSmallBold(),
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  invoice.expiredAt != null
                      ? AppDateUtils.formatFromString(invoice.expiredAt)
                      : "-",
                  style: AppText.titleSmall(),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  invoice.total != null
                      ? StringUtils.toIdr(invoice.total!)
                      : "-",
                  style: AppText.standardBold(),
                ),
                const SizedBox(
                  height: 13,
                ),
              ],
            ),
          ),
          Text(
            invoice.isPaid == 1 ? "Terbayar" : "Belum Terbayar",
            style: TextStyle(
              color:
                  invoice.isPaid == 1 ? Color(0xFF219653) : Color(0xFFEB5757),
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          )
        ],
      ),
    );
  }
}
