import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_button.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_loading.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/profile/profile_page.controller.dart';
import 'package:flutter_jett_boilerplate/utils/string_utils.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProfilePageController(),
        builder: (ProfilePageController state) {
          return state.isFetchingUserData
              ? Center(
                  child: AppLoading(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      CircleAvatar(
                        backgroundImage:
                            Image.network(state.userData!.foto!).image,
                        radius: 45,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        StringUtils.getOrElse(state.userData!.nama, "-"),
                        style: AppText.buttonHeader(),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      _buildAttributeItem(
                        "Nomor Anggota",
                        StringUtils.getOrElse(state.userData!.noKta, "-"),
                      ),
                      _buildAttributeItem(
                        "Nama",
                        StringUtils.getOrElse(state.userData!.nama, "-"),
                      ),
                      _buildAttributeItem(
                        "Tempat Tanggal Lahir",
                        "${StringUtils.getOrElse(state.userData!.tmpLahir, "")}, ${StringUtils.getOrElse(state.userData!.tglLahir, "-")}",
                      ),
                      _buildAttributeItem("No. HP",
                          StringUtils.getOrElse(state.userData!.noHp, "-")),
                      _buildAttributeItem(
                        "EMAIL",
                        StringUtils.getOrElse(state.userData!.email, "-"),
                      ),
                      _buildAttributeItem(
                          "STATUS PEGAWAI",
                          StringUtils.getOrElse(
                              state.userData!.statusPegawai, "-")),
                      _buildAttributeItem(
                          "TEMPAT KERJA",
                          StringUtils.getOrElse(
                              state.userData!.tempatKerja, "-")),
                      _buildAttributeItem(
                          "Pengcab",
                          StringUtils.getOrElse(
                              state.userData!.kotaBekerja, "-")),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: AppButton(
                            title: "Log Out",
                            onPressed: () {
                              state.handleLogoutClick();
                            }),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                );
        });
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
