import 'package:flutter_jett_boilerplate/domain/entities/rest_response/paginate_response.dart';
import 'package:flutter_jett_boilerplate/utils/rest_client.dart';

class TransactionApi {
  static Future<PaginateResponse> fetchTransaction({
    required int page,
    int perPage = 10,
  }) async {
    dynamic response = await RestClient.get("/transaksi",
        queryParameter: {"page": page, "per_page": perPage});
    PaginateResponse paginateResponse = PaginateResponse.fromJson(response);
    return paginateResponse;
  }
}
