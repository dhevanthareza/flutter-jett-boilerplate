import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';

class HomeTagihanItem extends StatelessWidget {
  const HomeTagihanItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 150,
      height: 133,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xFFF9FFF7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "IURAN KEANGGOTAAN",
            style: AppText.titleSmallBold(),
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            "20 DESEMBER 2021",
            style: AppText.titleSmall(),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "Rp. 10.000",
            style: AppText.titleSmall(),
          ),
          const SizedBox(
            height: 13,
          ),
          const Text(
            "Terbayar",
            style: TextStyle(
                color: Color(0xFF219653),
                fontSize: 10,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
