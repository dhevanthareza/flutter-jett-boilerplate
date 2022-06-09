class TransactionEntity {
  int? id;
  String? noInv;
  String? noVa;
  String? nir;
  String? nama;
  String? uraian;
  int? total;
  int? isPaid;
  String? paidAt;
  String? expiredAt;

  TransactionEntity(
      {this.id,
      this.noInv,
      this.noVa,
      this.nir,
      this.nama,
      this.uraian,
      this.total,
      this.isPaid,
      this.paidAt,
      this.expiredAt});

  TransactionEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noInv = json['no_inv'];
    noVa = json['no_va'];
    nir = json['nir'];
    nama = json['nama'];
    uraian = json['uraian'];
    total = json['total'];
    isPaid = json['is_paid'];
    paidAt = json['paid_at'];
    expiredAt = json['expired_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no_inv'] = this.noInv;
    data['no_va'] = this.noVa;
    data['nir'] = this.nir;
    data['nama'] = this.nama;
    data['uraian'] = this.uraian;
    data['total'] = this.total;
    data['is_paid'] = this.isPaid;
    data['paid_at'] = this.paidAt;
    data['expired_at'] = this.expiredAt;
    return data;
  }
}