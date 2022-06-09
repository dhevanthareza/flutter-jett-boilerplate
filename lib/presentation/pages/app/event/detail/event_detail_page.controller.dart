import 'package:flutter_jett_boilerplate/data/repositories/event.repository.dart';
import 'package:flutter_jett_boilerplate/domain/entities/event/event.entity.dart';
import 'package:get/get.dart';

import '../../../../../domain/entities/core/app_exception.dart';

class EventDetailPageController extends GetxController {
  bool isFetching = false;
  EventEntity? event;

  @override
  void onInit() {
    super.onInit();
    fetchEvent();
  }

  void fetchEvent() async {
    int eventId = int.parse(Get.parameters['eventId']!);
    isFetching = true;
    update();
    try {
      event = await EventRepository.eventDetail(eventId);
      isFetching = false;
      update();
    } on AppException catch (err) {
      isFetching = false;
      update();
    }
  }
}
