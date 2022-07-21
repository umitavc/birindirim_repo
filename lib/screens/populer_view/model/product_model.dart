import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.title,
    this.image,
    this.time,
    this.link,
  });

  String title;
  String image;
  String time;
  String link;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        title: json["title"],
        image: json["image"],
        time: json["time"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "time": time,
        "link": link,
      };
}
