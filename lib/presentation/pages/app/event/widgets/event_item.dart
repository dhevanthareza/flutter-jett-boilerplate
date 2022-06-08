import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';

class EventItem extends StatelessWidget {
  const EventItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            "WORKSHOP RADIOLOGI NASIONAL TAHUN 2021",
            style: AppText.standardBold(),
          ),
          const SizedBox(
            height: 9,
          ),
          _buildAttributeItem(Icons.person, "Pari Pusat"),
          _buildAttributeItem(Icons.calendar_month, "08 - 10 November 2021"),
          _buildAttributeItem(Icons.place, "Hotel Lombok Raya, Mataram"),
          _buildAttributeItem(Icons.people, "235 Kuota Tersisa"),
          _buildAttributeItem(Icons.money, "Rp. 250.000"),
        ],
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
