import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';
import 'package:flutter_jett_boilerplate/domain/entities/event/event.entity.dart';
import 'package:flutter_jett_boilerplate/utils/string_utils.dart';
import 'package:get/get.dart';

import '../../../../../utils/date_utils.dart';

class EventItem extends StatelessWidget {
  final EventEntity event;
  const EventItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("/event/${event.id}");
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringUtils.getOrElse(event.nama, ""),
              style: AppText.standardBold(),
            ),
            const SizedBox(
              height: 9,
            ),
            // _buildAttributeItem(Icons.person, "Pari Pusat"),
            _buildAttributeItem(
                Icons.calendar_month,
                event.tglMulai != null && event.tglSelesai != null
                    ? event.tglMulai != event.tglSelesai
                        ? "${AppDateUtils.formatFromString(event.tglMulai)} - ${AppDateUtils.formatFromString(event.tglSelesai)}"
                        : AppDateUtils.formatFromString(event.tglMulai)
                    : "-"),
            _buildAttributeItem(Icons.place, StringUtils.getOrElse(event.tempat, "-")),
            _buildAttributeItem(Icons.people, "${event.sisaKuota != null ? event.sisaKuota.toString() : "-"} Kuota Tersisa"),
            _buildAttributeItem(Icons.money, event.biaya != null ? StringUtils.toIdr(event.biaya!) : "-"),
          ],
        ),
      ),
    );
  }

  Widget _buildAttributeItem(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFFFFAB00),
            size: 15,
          ),
          const SizedBox(
            width: 10.5,
          ),
          Text(
            text,
            style: AppText.titleSmall(),
          )
        ],
      ),
    );
  }
}
