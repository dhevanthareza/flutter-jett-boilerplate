import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';
import 'package:flutter_jett_boilerplate/domain/entities/invoice/invoice.entity.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_shimmer.dart';
import 'package:flutter_jett_boilerplate/utils/date_utils.dart';
import 'package:flutter_jett_boilerplate/utils/string_utils.dart';

class HomeTagihanItem extends StatelessWidget {
  final InvoiceEntity invoice;
  const HomeTagihanItem({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 150,
      height: 133,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:
            invoice.isPaid == 1 ? const Color(0xFFF9FFF7) : Color(0xFFFFF4F4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringUtils.getOrElse(invoice.uraian, "-"),
            style: AppText.titleSmallBold(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
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
            invoice.total != null ? StringUtils.toIdr(invoice.total!) : "-",
            style: AppText.titleSmall(),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            invoice.isPaid == 1 ? "Terbayar" : "Belum Terbayar",
            style: TextStyle(
              color:
                  invoice.isPaid == 1 ? Color(0xFF219653) : Color(0xFFEB5757),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildShimmer() {
    return AppShimmer(
        child: Container(
      margin: const EdgeInsets.only(right: 10),
      width: 150,
      height: 133,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey,
      ),
    ));
  }
}
