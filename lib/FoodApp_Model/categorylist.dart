class Categorylist {
  String image;
  String name;
  int minOrder;

  Categorylist({this.image, this.name, this.minOrder});

  Categorylist.fromJson(Map<String, dynamic> json) {
    image = json['Image'];
    name = json['Name'];
    minOrder = json['minOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Image'] = this.image;
    data['Name'] = this.name;
    data['minOrder'] = this.minOrder;
    return data;
  }
}