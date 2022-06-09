import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_color.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_loading.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/event/detail/event_detail_page.controller.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/event/event_page.controller.dart';
import 'package:get/get.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRegisterButton(),
            ],
          )
        ],
      ),
      body: GetBuilder<EventDetailPageController>(
        init: EventDetailPageController(),
        builder: (EventDetailPageController state) => SingleChildScrollView(
          child: state.isFetching
              ? Center(
                  child: AppLoading(),
                )
              : Column(
                  children: [
                    Image.network(
                      state.event!.pamflet!,
                      width: double.infinity,
                      height: 360,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 17),
                      child: Text(
                        sampleContent,
                        style: AppText.titleSmall(),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      margin: const EdgeInsets.only(right: 13),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Text(
        "Daftar",
        style: AppText.titleSmallBold(color: Colors.white),
      ),
    );
  }

  final String sampleContent = """
[1st Annoucement  Webinar Radiografi dan Digital Imaging]
 
Webinar Radiografer Indonesia-How to Computed Radiography Works?dan Kegiatan Amal Peduli Bencana Alam
 
Pengurus Pusat Perhimpunan Radiografer Indonesia (PP PARI) bersama Komunitas Radiografi dan Digital Imaging akan menggelar seminar daring dengan tema "Perkembangan Digital Imaging Radiografidan Kegiatan Amal Peduli Bencana Alam".
 
Webinar ini akan diselenggarakan pada:
Hari : Minggu 
Tgl   : 28 Februari 2021
Waktu : 08.00 - 12.00 WIB
 
Kuota peserta adalah 300 orang Radiografer. Registrasi peserta melalui link di bawah ini. Biaya kepesertaan Rp. 150.000,- transfer melalui Virtual Account. 
 
Peserta mendapatkan fasilitas :
○Kepesertaan dalam seminar daring
○Folder eMateri
○Doorprize
○Sertifikat Webinar 1 SKP PARI
 
Kontak dan Informasi:
Nuning P. (+6285230021579)

Wilda (+6281388177856)

Mari ikuti Webinar Radiografer Indonesia dari PP PARI untuk meningkatkan wawasan, kompetensi dan kapasitas Radiografer Indonesia dalam digital radiografi, sekaligus beramal untuk saudara kita yang ditimpa musibah bencana alam di Sulawesi Barat dan Kalimantan Selatan.
 
===
 
Pengurus Pusat Perhimpunan Radiografer Indonesia
""";
}
