import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/home/home_page.controller.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/home/widgets/event_item.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/home/widgets/tagihan_item.dart';
import 'package:get/get.dart';

import 'widgets/slider_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomePageController(),
      builder: (HomePageController state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 16),
              child: Column(
                children: [
                  _buildHeader(state),
                  const SizedBox(
                    height: 28,
                  ),
                  _buildSlider(state),
                  const SizedBox(
                    height: 29,
                  ),
                  _buildTagihanList(state),
                  const SizedBox(
                    height: 29,
                  ),
                  _buildEventList(state)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(HomePageController state) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage:
              Image.asset("assets/images/sample_avatar.png", fit: BoxFit.cover)
                  .image,
        ),
        const SizedBox(
          width: 11,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "3173101200598",
                style: AppText.titleSmallBold(),
              ),
              Text(
                "Darma Wilantara Setiawan",
                style: AppText.titleSmallBold(
                  color: const Color(0xFF222375),
                ),
              ),
            ],
          ),
        ),
        const Icon(Icons.mail_outline_rounded)
      ],
    );
  }

  Widget _buildSlider(HomePageController state) {
    return CarouselSlider(
      items: const [SliderItem()],
      options: CarouselOptions(
        aspectRatio: 263 / 111,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildTagihanList(HomePageController state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tagihan",
              style: AppText.standardBold(),
            ),
            Text(
              "Lihat Semua",
              style: AppText.titleSmallBold(
                color: const Color(
                  0xFF0093DD,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HomeTagihanItem(),
                HomeTagihanItem(),
                HomeTagihanItem(),
                HomeTagihanItem(),
                HomeTagihanItem()
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEventList(HomePageController state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Event Terdekat",
              style: AppText.standardBold(),
            ),
            Text(
              "Lihat Semua",
              style: AppText.titleSmallBold(
                color: const Color(
                  0xFF0093DD,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HomeEventItem(),
                HomeEventItem(),
                HomeEventItem(),
                HomeEventItem(),
                HomeEventItem(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
