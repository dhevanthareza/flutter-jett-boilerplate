import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';

class PengajuanItem extends StatelessWidget {
  final bool isPublished;
  const PengajuanItem({Key? key, this.isPublished = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF222375),
            Color(0xFF4F509D),
          ],
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            padding:
                const EdgeInsets.only(left: 27, right: 30, top: 20, bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "KTA",
                        style: AppText.buttonHeder(color: Colors.white),
                      ),
                      const Text(
                        "Kartu Tanda Anggota",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 26,
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: !isPublished,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                color: const Color(0xFFA8C7F4).withOpacity(0.9),
              ),
              child: Center(
                child: Text(
                  "Segera Hadir!",
                  style: AppText.titleBig(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
