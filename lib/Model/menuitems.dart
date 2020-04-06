
class MenuItemList {
  List<Foods> foods;

  MenuItemList({this.foods});

  MenuItemList.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      foods = new List<Foods>();
      json['foods'].forEach((v) {
        foods.add(new Foods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.foods != null) {
      data['foods'] = this.foods.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Foods {
  String foodname;
  String foodprice;
  String foodimage;

  Foods({this.foodname, this.foodprice, this.foodimage});

  Foods.fromJson(Map<String, dynamic> json) {
    foodname = json['foodname'];
    foodprice = json['foodprice'];
    foodimage = json['foodimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foodname'] = this.foodname;
    data['foodprice'] = this.foodprice;
    data['foodimage'] = this.foodimage;
    return data;
  }
}