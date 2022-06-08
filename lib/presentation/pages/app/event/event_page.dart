import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/event/event_page.controller.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/event/widgets/event_item.dart';
import 'package:get/get.dart';

import '../../../../data/const/app_text.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EventPageController(),
      builder: (state) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Event",
                  style: AppText.titleBig(),
                ),
                const SizedBox(
                  height: 5,
                ),
                EventItem(),
                EventItem(),
                EventItem(),
                EventItem(),
                EventItem(),
              ],
            ),
          ),
        );
      },
    );
  }
}
