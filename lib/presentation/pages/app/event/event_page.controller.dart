import 'package:flutter_jett_boilerplate/data/provider/api/event.api.dart';
import 'package:flutter_jett_boilerplate/domain/interface/paginate.controller.interface.dart';
import 'package:get/get.dart';
import 'package:load/load.dart';

import '../../../../domain/entities/core/app_exception.dart';
import '../../../../domain/entities/rest_response/paginate_response.dart';
import '../../../../utils/app_alert.dart';

class EventPageController extends GetxController
    implements PaginationControllerInterface {
  static EventPageController get to => Get.find();

  @override
  bool isLoading = false;

  @override
  List<Map<String, dynamic>> items = [];

  @override
  int page = 0;

  @override
  int total = 1;

  @override
  void fetchInitialItems() async {
    try {
      isLoading = true;
      await fetchItems();
      isLoading = false;
      update();
    } on AppException catch (err) {
      isLoading = false;
      AppAlert.showErrorFlash(
        title: 'Terjadi Error',
        message: err.message ?? "",
      );
      update();
    }
  }

  @override
  Future<void> fetchItems() async {
    page += 1;
    PaginateResponse response = await EventApi.fetchEvent(page: page);
    print(response.rows.length);
    items = [...items, ...response.rows];
    total = response.total != null ? response.total as int : 0;
  }

  @override
  void fetchNextItems() async {
    try {
      showLoadingDialog();
      await fetchItems();
      hideLoadingDialog();
      update();
    } on AppException catch (err) {
      hideLoadingDialog();
      AppAlert.showErrorFlash(
        title: 'Terjadi Error',
        message: err.message ?? "",
      );
      update();
    }
  }

  @override
  void reset() {
    isLoading = true;
    items = [];
    page = 0;
    total = 0;
    update();
  }
}
