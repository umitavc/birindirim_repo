class OpportunitiesModel {
  String title;
  String oldPrice;
  String newPrice;
  String link;
  String image;

  OpportunitiesModel({this.title, this.oldPrice, this.newPrice, this.link, this.image});

  OpportunitiesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    oldPrice = json['old_price'];
    newPrice = json['new_price'];
    link = json['link'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['old_price'] = oldPrice;
    data['new_price'] = newPrice;
    data['link'] = link;
    data['image'] = image;
    return data;
  }
}
