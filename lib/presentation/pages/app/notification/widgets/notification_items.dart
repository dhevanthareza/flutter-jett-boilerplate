import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_color.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 1),
        ],
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.event,
                color: AppColor.primaryColor,
                size: 15,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Event",
                style: AppText.titleSmallBold(),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Lakukan pembayaran Workshop sebelum jam 15:00",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "01 / 11 / 2021",
            style: AppText.titleSmall(),
          )
        ],
      ),
    );
  }
}
