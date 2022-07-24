import 'dart:convert';

List<BrandsDetailsModel> brandsDetailsModelFromJson(String str) => List<BrandsDetailsModel>.from(json.decode(str).map((x) => BrandsDetailsModel.fromJson(x)));
String brandsDetailsModelToJson(List<BrandsDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BrandsDetailsModel {
 
  BrandsDetailsModel({
    this.title, 
    this.image,
     this.time, 
     this.link
     });
      
  String title;
  String image;
  String time;
  String link;


 factory BrandsDetailsModel.fromJson(Map<String, dynamic> json) =>BrandsDetailsModel(
    title : json['title'],
    image : json['image'],
    time  : json['time'],
    link  : json['link'],
 );

  Map<String, dynamic> toJson( )=> {
    
    'title' : title,
    'image' : image,
    'time' : time,
    'link' : link,
    
  };
}