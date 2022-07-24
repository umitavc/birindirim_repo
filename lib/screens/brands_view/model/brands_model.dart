import 'dart:convert';

List<BrandsModel> brandsModelFromJson(String str) => List<BrandsModel>.from(json.decode(str).map((x) => BrandsModel.fromJson(x)));
String brandsModelToJson(List<BrandsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BrandsModel {

  BrandsModel({
    this.title, 
    this.link, 
    this.logo
    
    });

    String title;
    String link;
    String logo;

 factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(

    title : json['title'],
    link : json['link'],
    logo : json['logo'],
 );
   
  

  Map<String, dynamic> toJson()=> {
        "title": title,
        "link": link,
        "logo": logo,
      };
}