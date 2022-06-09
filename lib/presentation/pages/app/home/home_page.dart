import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';
import 'package:flutter_jett_boilerplate/domain/entities/auth/slider.entity.dart';
import 'package:flutter_jett_boilerplate/domain/entities/event/event.entity.dart';
import 'package:flutter_jett_boilerplate/domain/entities/invoice/invoice.entity.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/app_page.controller.dart';
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
    return state.isFetchingUser
        ? SizedBox()
        : Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: Image.network(state.user!.foto!)
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
                      state.user!.noKta!,
                      style: AppText.titleSmallBold(),
                    ),
                    Text(
                      state.user!.nama!,
                      style: AppText.titleSmallBold(
                        color: const Color(0xFF222375),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  state.handleNotificationClick();
                },
                child: const Icon(Icons.mail_outline_rounded),
              )
            ],
          );
  }

  Widget _buildSlider(HomePageController state) {
    return CarouselSlider(
      items: !state.isFetchingSliders
          ? state.sliders
              .map(
                (SliderEntity slider) => SliderItem(
                  slider: slider,
                ),
              )
              .toList()
          : [SliderItem.buildShimmer()],
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
            InkWell(
              onTap: () {
                state.goToTagihanPage();
              },
              child: Text(
                "Lihat Semua",
                style: AppText.titleSmallBold(
                  color: const Color(
                    0xFF0093DD,
                  ),
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
              children: !state.isFetchingInvoice
                  ? state.invoices
                      .map(
                        (InvoiceEntity invoice) =>
                            HomeTagihanItem(invoice: invoice),
                      )
                      .toList()
                  : List.generate(10, (index) => index)
                      .map(
                        (e) => HomeTagihanItem.buildShimmer(),
                      )
                      .toList(),
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
            InkWell(
              onTap: () {
                AppPageController.to.setMenuIndex(2);
              },
              child: Text(
                "Lihat Semua",
                style: AppText.titleSmallBold(
                  color: const Color(
                    0xFF0093DD,
                  ),
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
              children: !state.isFetchingEvents
                  ? state.events
                      .map(
                        (EventEntity event) => HomeEventItem(
                          event: event,
                        ),
                      )
                      .toList()
                  : List.generate(10, (i) => i)
                      .map((e) => HomeEventItem.buildShimmer())
                      .toList(),
            ),
          ),
        )
      ],
    );
  }
}
