import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          CircleAvatar(
            backgroundImage:
                Image.asset("assets/images/sample_avatar.png").image,
            radius: 45,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Darma Wilantara Setiawan",
            style: AppText.buttonHeader(),
          ),
          const SizedBox(
            height: 35,
          ),
          _buildAttributeItem("Nomor Anggota", "3173101200598"),
          _buildAttributeItem("Nama", "Darma Wilantara Setiawan"),
          _buildAttributeItem("Tempat Tanggal Lahir", "Jakarta Pusat, 19 Desember 1989"),
          _buildAttributeItem("No. HP", "081234567890"),
          _buildAttributeItem("EMAIL", "darmawilantara@gmail.com"),
          _buildAttributeItem("STATUS PEGAWAI", "Swasta"),
          _buildAttributeItem("TEMPAT KERJA", "Kota Jakarta Pusat"),
          _buildAttributeItem("Pengcab", "Kota Jakarta Pusat"),
        ],
      ),
    );
  }

  Widget _buildAttributeItem(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F8FF),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 1),
        ],
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: AppText.titleSmallBold(
              color: const Color(0xFF222375),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            value,
            style: AppText.titleSmall(),
          )
        ],
      ),
    );
  }
}
