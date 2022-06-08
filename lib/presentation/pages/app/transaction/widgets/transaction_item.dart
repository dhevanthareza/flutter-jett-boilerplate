import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({Key? key}) : super(key: key);

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
          Text(
            "EVENT",
            style: AppText.titleSmallBold(color: Color(0xFF0093DD)),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            "Pembayaran Workshop Radiologi Nasional",
            style: AppText.standardBold(),
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "28 / 09 / 2021",
                style: AppText.titleSmall(),
              ),
              Text(
                "Rp 250.000",
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
