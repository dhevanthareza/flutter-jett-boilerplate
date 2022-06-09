import 'package:flutter/material.dart';

import '../../../../../data/const/app_text.dart';

class TagihanItem extends StatelessWidget {
  const TagihanItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, right: 20, left: 20),
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF9FFF7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const  Offset(0, 10),
            blurStyle: BlurStyle.normal
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
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
                  style: AppText.standardBold(),
                ),
                const SizedBox(
                  height: 13,
                ),
              ],
            ),
          ),
          const Text(
            "Terbayar",
            style: TextStyle(
              color: Color(0xFF219653),
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
