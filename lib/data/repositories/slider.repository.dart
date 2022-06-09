import 'package:flutter_jett_boilerplate/data/provider/api/slider.api.dart';
import 'package:flutter_jett_boilerplate/data/provider/api/tagihan.api.dart';
import 'package:flutter_jett_boilerplate/domain/entities/auth/slider.entity.dart';
import 'package:flutter_jett_boilerplate/domain/entities/invoice/invoice.entity.dart';
import 'package:flutter_jett_boilerplate/domain/entities/rest_response/paginate_response.dart';

class SliderRepository {
  static Future<List<SliderEntity>> fetchSpottedSlider() async {
    PaginateResponse response =
        await SliderApi.fetchSlider(page: 1, perPage: 10);
    List<SliderEntity> sliders =
        response.rows.map((e) => SliderEntity.fromJson(e)).toList();
    return sliders;
  }
}
