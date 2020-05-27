class Foods {
  String foodname;
  double foodprice;
  String foodimage;
  String rating;
  String numberOfRating;
  String slug;

  Foods(
      {this.foodname,
      this.foodprice,
      this.foodimage,
      this.numberOfRating,
      this.rating,
      this.slug});
}

List<Foods> fooditem = [
  Foods(
      foodname: "Dhosa",
      foodimage:
          'images/menuitem/dhosa.png',
      foodprice: 40),
  Foods(
      foodname: "Idly",
      foodimage:
          'images/menuitem/Idli.png',
      foodprice: 30),
  Foods(
    foodname: "Paratha",
    foodimage:
        'images/menuitem/paratha.png',
    foodprice: 50,
  ),
  Foods(
      foodname: " Biriyani",
      foodimage:
          'images/menuitem/biryani.png',
      foodprice: 160),
  Foods(
      foodname: "Pasta",
      foodimage:
          'images/menuitem/pasta.png',
      foodprice: 120),
  Foods(
      foodname: "Egg Roll",
      foodimage:
          'images/menuitem/EggRoll.png',
      foodprice: 65),

  Foods(
      foodname: 'Momo',
      foodimage:
          'images/menuitem/momos.png',
      foodprice: 45)
];

List<Foods> popularFoodItems = [
  Foods(
      foodname: "Fried Egg",
      foodimage: "images/popular_foods/ic_popular_food_1.png",
      rating: '4.9',
      numberOfRating: '200',
      foodprice: 15,
      slug: "fried_egg"),
  Foods(
      foodname: "Mixed Vegetable",
      foodimage: "images/popular_foods/ic_popular_food_3.png",
      rating: "4.9",
      numberOfRating: "100",
      foodprice: 17,
      slug: ""),
  Foods(
      foodname: "Salad With Chicken",
      foodimage: "images/popular_foods/ic_popular_food_4.png",
      rating: "4.0",
      numberOfRating: "50",
      foodprice: 11,
      slug: ""),
  Foods(
      foodname: "Mixed Salad",
      foodimage: "images/popular_foods/ic_popular_food_5.png",
      rating: "4",
      numberOfRating: "100",
      foodprice: 11,
      slug: ""),
  Foods(
      foodname: "Red meat,Salad",
      foodimage: "images/popular_foods/ic_popular_food_2.png",
      rating: "4.6",
      numberOfRating: "150",
      foodprice: 12,
      slug: ""),
      Foods(
      foodname: "Potato,Meat fry",
      foodimage: "images/popular_foods/ic_popular_food_6.png",
      rating: "4.2",
      numberOfRating: "70",
      foodprice: 23,
      slug: ""),
  Foods(
      foodname: "Mixed Salad",
      foodimage: "images/popular_foods/ic_popular_food_5.png",
      rating: "4",
      numberOfRating: "100",
      foodprice: 11,
      slug: ""),
  
  Foods(
      foodname: "Fried Egg",
      foodimage: "images/popular_foods/ic_popular_food_1.png",
      rating: '4.9',
      numberOfRating: '200',
      foodprice: 14,
      slug: "fried_egg"),
  Foods(
      foodname: "Red meat,Salad",
      foodimage: "images/popular_foods/ic_popular_food_2.png",
      rating: "4.6",
      numberOfRating: "150",
      foodprice: 12,
      slug: "")
];

// class MenuItemList {
//   List<Foods> foods;

//   MenuItemList({this.foods});

//   MenuItemList.fromJson(Map<String, dynamic> json) {
//     if (json['foods'] != null) {
//       foods = new List<Foods>();
//       json['foods'].forEach((v) {
//         foods.add(new Foods.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.foods != null) {
//       data['foods'] = this.foods.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Foods {
//   String foodname;
//   String foodprice;
//   String foodimage;

//   Foods({this.foodname, this.foodprice, this.foodimage});

//   Foods.fromJson(Map<String, dynamic> json) {
//     foodname = json['foodname'];
//     foodprice = json['foodprice'];
//     foodimage = json['foodimage'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['foodname'] = this.foodname;
//     data['foodprice'] = this.foodprice;
//     data['foodimage'] = this.foodimage;
//     return data;
//   }
// }
