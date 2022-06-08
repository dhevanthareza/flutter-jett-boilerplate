import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';

class HomeEventItem extends StatelessWidget {
  const HomeEventItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 157,
      width: 113,
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 97,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset("assets/images/sample_webinar.png").image,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "Webinar Workshop Standar Penulisan Artikel",
            style: AppText.p4(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "10 Oktober 2021",
            style: AppText.p5(
              color: const Color(0xFF828282),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "Live Via Zoom",
            style: AppText.p5(
              color: const Color(0xFF222375),
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
