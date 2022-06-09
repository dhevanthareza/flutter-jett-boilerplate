class UserEntity {
  String? noKta;
  String? nama;
  String? tmpLahir;
  String? tglLahir;
  String? noHp;
  String? email;
  String? tempatKerja;
  String? kotaBekerja;
  String? foto;
  String? statusPegawai;

  UserEntity(
      {this.noKta,
      this.nama,
      this.tmpLahir,
      this.tglLahir,
      this.noHp,
      this.email,
      this.tempatKerja,
      this.kotaBekerja,
      this.foto,
      this.statusPegawai});

  UserEntity.fromJson(Map<String, dynamic> json) {
    noKta = json['no_kta'];
    nama = json['nama'];
    tmpLahir = json['tmp_lahir'];
    tglLahir = json['tgl_lahir'];
    noHp = json['no_hp'];
    email = json['email'];
    tempatKerja = json['tempat_kerja'];
    kotaBekerja = json['kota_bekerja'];
    foto = json['foto'];
    statusPegawai = json['status_pegawai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no_kta'] = this.noKta;
    data['nama'] = this.nama;
    data['tmp_lahir'] = this.tmpLahir;
    data['tgl_lahir'] = this.tglLahir;
    data['no_hp'] = this.noHp;
    data['email'] = this.email;
    data['tempat_kerja'] = this.tempatKerja;
    data['kota_bekerja'] = this.kotaBekerja;
    data['foto'] = this.foto;
    data['status_pegawai'] = this.statusPegawai;
    return data;
  }
}