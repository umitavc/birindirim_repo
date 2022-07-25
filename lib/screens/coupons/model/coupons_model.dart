class CouponsModel {
  String image;
  String brand;
  String title;
  String description;
  String link;

  CouponsModel({this.image, this.brand, this.title, this.description, this.link});

  CouponsModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    brand = json['brand'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = image;
    data['brand'] = brand;
    data['title'] = title;
    data['description'] = description;
    data['link'] = link;
    return data;
  }
}
