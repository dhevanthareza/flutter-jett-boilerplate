import 'package:get/get.dart';

class PaginationControllerInterface extends GetxController {
  List<Map<String, dynamic>> items = [];
  bool isLoading = true;
  int page = 0;
  int total = 0;

  static PaginationControllerInterface get to => Get.find();

  void fetchNextItems() async {}

  void reset() {}

  void fetchInitialItems() async {}

  Future<void> fetchItems() async {}
}
