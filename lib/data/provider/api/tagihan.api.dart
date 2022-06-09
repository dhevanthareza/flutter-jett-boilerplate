import 'package:flutter_jett_boilerplate/domain/entities/rest_response/default_response.entity.dart';
import 'package:flutter_jett_boilerplate/domain/entities/rest_response/paginate_response.dart';
import 'package:flutter_jett_boilerplate/utils/rest_client.dart';

class TagihanApi {
  static Future<PaginateResponse> fetchTagihan({
    required int page,
    required int perPage,
  }) async {
    dynamic response = await RestClient.get("/invoice",
        queryParameter: {"page": page, "per_page": perPage});
    PaginateResponse paginateResponse = PaginateResponse.fromJson(response);
    return paginateResponse;
  }
}
