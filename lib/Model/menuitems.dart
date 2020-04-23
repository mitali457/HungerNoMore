
class Foods  {
String foodname;
  double foodprice;
  String foodimage;

  Foods({this.foodname, this.foodprice, this.foodimage});

}
List<Foods>fooditem =[
Foods(foodname: "Dhosa",foodimage: 'https://www.nicepng.com/png/detail/252-2522193_south-indian-masala-dosa-images-png.png',
foodprice:40 ),
Foods(foodname:"Idly",foodimage:'https://www.caterem.com/wp-content/uploads/2018/07/caterem_Idli.png',foodprice:30),
Foods(foodname:"Paratha",foodimage: 'https://recipesinhindi.net/wp-content/uploads/2019/06/Lachaa-paratha.png',foodprice: 50,),
Foods(foodname:" Biriyani",foodimage: 'https://www.nicepng.com/png/detail/914-9141005_about-chicken-biryani-ad.png',foodprice: 160),
Foods(foodname:"Pasta",foodimage:'https://i.dlpng.com/static/png/1621901-pasta-png-pasta-png-474_325_preview.png',foodprice:120),
Foods(foodname:"Egg Roll", foodimage:'https://wonderchef.ae/wp-content/uploads/2018/06/Egg-Roll.png',foodprice:65),
Foods(foodname:'Burger',foodimage:'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTNq_Xc3AqPetcHrq68GMqGmNYT3I0_QQiZd3_At4KKoMmR9WrI&usqp=CAU',foodprice:75),
Foods(foodname:'Momo',foodimage:'https://pngimage.net/wp-content/uploads/2018/06/momos-png.png',foodprice:45)

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