class EventEntity {
  int? id;
  String? nama;
  String? tglMulai;
  String? tglSelesai;
  String? regTglMulai;
  String? regTglSelesai;
  String? tempat;
  int? kuota;
  int? biaya;
  String? pamflet;
  int? sisaKuota;

  EventEntity(
      {this.id,
      this.nama,
      this.tglMulai,
      this.tglSelesai,
      this.regTglMulai,
      this.regTglSelesai,
      this.tempat,
      this.kuota,
      this.biaya,
      this.pamflet,
      this.sisaKuota});

  EventEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    tglMulai = json['tgl_mulai'];
    tglSelesai = json['tgl_selesai'];
    regTglMulai = json['reg_tgl_mulai'];
    regTglSelesai = json['reg_tgl_selesai'];
    tempat = json['tempat'];
    kuota = json['kuota'];
    biaya = json['biaya'];
    pamflet = json['pamflet'];
    sisaKuota = json['sisa_kuota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['tgl_mulai'] = this.tglMulai;
    data['tgl_selesai'] = this.tglSelesai;
    data['reg_tgl_mulai'] = this.regTglMulai;
    data['reg_tgl_selesai'] = this.regTglSelesai;
    data['tempat'] = this.tempat;
    data['kuota'] = this.kuota;
    data['biaya'] = this.biaya;
    data['pamflet'] = this.pamflet;
    data['sisa_kuota'] = this.sisaKuota;
    return data;
  }
}