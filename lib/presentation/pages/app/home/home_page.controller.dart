import 'package:flutter_jett_boilerplate/data/repositories/event.repository.dart';
import 'package:flutter_jett_boilerplate/data/repositories/invoice.repository.dart';
import 'package:flutter_jett_boilerplate/data/repositories/slider.repository.dart';
import 'package:flutter_jett_boilerplate/domain/entities/auth/slider.entity.dart';
import 'package:flutter_jett_boilerplate/domain/entities/core/app_exception.dart';
import 'package:flutter_jett_boilerplate/domain/entities/event/event.entity.dart';
import 'package:flutter_jett_boilerplate/domain/entities/invoice/invoice.entity.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class HomePageController extends GetxController {
  bool isFetchingInvoice = false;
  List<InvoiceEntity> invoices = [];

  bool isFetchingEvents = false;
  List<EventEntity> events = [];

  bool isFetchingSliders = false;
  List<SliderEntity> sliders = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fethInvoice();
    fetchEvent();
    fetchSliders();
  }

  void fethInvoice() async {
    isFetchingInvoice = true;
    update();
    try {
      invoices = await InvoiceRepository.fetchSpottedInvoice();
      isFetchingInvoice = false;
      update();
    } on AppException catch (err) {
      isFetchingInvoice = false;
      update();
    }
  }

  void fetchEvent() async {
    isFetchingEvents = true;
    update();
    try {
      events = await EventRepository.fetchSpottedEvent();
      isFetchingEvents = false;
      update();
    } on AppException catch (err) {
      isFetchingEvents = false;
      update();
    }
  }

  void fetchSliders() async {
    isFetchingSliders = true;
    update();
    try {
      sliders = await SliderRepository.fetchSpottedSlider();
      isFetchingSliders = false;
      update();
    } on AppException catch (err) {
      isFetchingSliders = false;
      update();
    }
  }

  void handleNotificationClick() {
    Get.toNamed("/notification");
  }

  void goToTagihanPage() {
    Get.toNamed("/tagihan");
  }
}
