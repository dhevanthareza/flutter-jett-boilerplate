import 'package:flutter_jett_boilerplate/data/provider/api/tagihan.api.dart';
import 'package:flutter_jett_boilerplate/domain/entities/invoice/invoice.entity.dart';
import 'package:flutter_jett_boilerplate/domain/entities/rest_response/paginate_response.dart';

class InvoiceRepository {
  static Future<List<InvoiceEntity>> fetchSpottedInvoice() async {
    PaginateResponse response =
        await TagihanApi.fetchTagihan(page: 1, perPage: 10);
    List<InvoiceEntity> invoices =
        response.rows.map((e) => InvoiceEntity.fromJson(e)).toList();
    return invoices;
  }
}
