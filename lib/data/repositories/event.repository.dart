import 'package:flutter_jett_boilerplate/data/provider/api/event.api.dart';
import 'package:flutter_jett_boilerplate/data/provider/api/tagihan.api.dart';
import 'package:flutter_jett_boilerplate/domain/entities/event/event.entity.dart';
import 'package:flutter_jett_boilerplate/domain/entities/invoice/invoice.entity.dart';
import 'package:flutter_jett_boilerplate/domain/entities/rest_response/default_response.entity.dart';
import 'package:flutter_jett_boilerplate/domain/entities/rest_response/paginate_response.dart';

class EventRepository {
  static Future<List<EventEntity>> fetchSpottedEvent() async {
    PaginateResponse response =
        await EventApi.fetchEvent(page: 1, perPage: 10);
    List<EventEntity> events =
        response.rows.map((e) => EventEntity.fromJson(e)).toList();
    return events;
  }

  static Future<EventEntity> eventDetail(int eventId) async {
    DefaultResponseEntity response = await EventApi.detail(eventId: eventId);
    EventEntity event = EventEntity.fromJson(response.data);
    return event;

  }
}
