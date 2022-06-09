import 'package:flutter_jett_boilerplate/domain/entities/rest_response/default_response.entity.dart';
import 'package:flutter_jett_boilerplate/domain/entities/rest_response/paginate_response.dart';
import 'package:flutter_jett_boilerplate/utils/rest_client.dart';

class EventApi {
  static Future<PaginateResponse> fetchEvent({
    required int page,
    int perPage = 5,
  }) async {
    dynamic response = await RestClient.get("/event",
        queryParameter: {"page": page, "per_page": perPage});
    PaginateResponse paginateResponse = PaginateResponse.fromJson(response);
    return paginateResponse;
  }
}
