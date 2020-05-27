
import 'package:flutter/material.dart';

import 'package:newapp/Model/menuitems.dart';




class Menudetails extends ChangeNotifier {
  Map<int, int> _cart = {};

  Map<int, int> get cart => _cart;
  List<Foods> selectedFooditem = [];
  // List<PopularFoodTiles> selectedFooditem = [];

  // int get totalPrice =>
  //     selectedFooditem.fold(0, (total, current) => total + current.foodprice.);

  void addToCart(Foods food) {
    if(selectedFooditem.contains(food)){
      return;
    }
    selectedFooditem.add(food);
    notifyListeners();
  }

  void clear(index) {
    if (selectedFooditem.contains(index)) {
    selectedFooditem.remove(index);
      notifyListeners();
    }
  }


// void addCart(PopularFoodTiles popularfood) {
//     if(selectedFooditem.contains(popularfood)){
//       return;
//     }
//     print(addCart);
//     print('addCart');

//     selectedFooditem.add(popularfood);
//     notifyListeners();
//   }

//   void clear1(index) {
//     if (selectedFooditem.contains(index)) {
//     selectedFooditem.remove(index);
//       notifyListeners();
//     }
//   }


}
  // addCart(Foods food, int index) {
  //   selectedFooditem.forEach((foodItem) {
  //     if (foodItem.food.foodname == food.foodname) {
  //       foodItem.quantity = foodItem.quantity + 1;
  //         notifyListeners();

  //       return;
  //     }
  //   });

  //   CartItem item = CartItem();
  //   item.food = food;
  //   item.quantity = 1;
  //   selectedFooditem.add(item);
  //   notifyListeners();
  // }


  // Random random = new Random();
  // Map<String, String> item = {};
  // List<Map<String, String>> itemList = [];
  // List<int> itemQuantity = [];
  // int total = 0;
  // int quantity = 0;
  // int totalQuantity = 0;
  // List<CartItem> selectedFooditem = [];

  // generateList() {
  //   for (var i = 0; i < 10; i++) {
  //     int randomNumber = 1 + random.nextInt(10);
  //     item = {
  //       'item': 'Item$i',
  //       'price': 'Rs ${randomNumber * 75}',
  //       'image': ''
  //     };
  //     itemList.add(item);
  //   }

  //   notifyListeners();
  // }

  // addToCart(Foods food, int index) {
  //   selectedFooditem.forEach((foodItem) {
  //     if (foodItem.food.foodname == food.foodname) {
  //       foodItem.quantity = foodItem.quantity + 1;
  //         notifyListeners();

  //       return;
  //     }
  //   });

  //   CartItem item = CartItem();
  //   item.food = food;
  //   item.quantity = 1;
  //   selectedFooditem.add(item);
  //   notifyListeners();
  // }

  


// Future<MenuItemList> getMenuItemData() async {
//   final String url = "https://api.myjson.com/bins/zppy0";

//   var response = await http
//       .get(Uri.encodeFull(url), headers: {"ACCEPT": "application/json"});
//   MenuItemList convertDataToJson =
//       MenuItemList.fromJson(json.decode(response.body));

//   return convertDataToJson;
// }
