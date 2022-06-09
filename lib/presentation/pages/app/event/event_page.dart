import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/domain/entities/event/event.entity.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_load_more.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/event/detail/event_detail_page.controller.dart';
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
                AppLoadMore<EventPageController>(
                  // isNeedInit: false,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  onTap: () {},
                  itemWidget: (eventJson) {
                    EventEntity event = EventEntity.fromJson(eventJson);
                    return EventItem(event: event,);
                  },
                  controller: EventPageController.to,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
