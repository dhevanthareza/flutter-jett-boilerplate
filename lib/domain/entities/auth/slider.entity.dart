class SliderEntity {
  String? name;
  String? image;
  String? url;
  String? desc;

  SliderEntity({this.name, this.image, this.url, this.desc});

  SliderEntity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    url = json['url'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['url'] = this.url;
    data['desc'] = this.desc;
    return data;
  }
}