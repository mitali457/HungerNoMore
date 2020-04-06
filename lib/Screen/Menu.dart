import 'package:flutter/material.dart';

import 'package:newapp/Model/menuitems.dart';
import 'package:newapp/Provider/menuItemsdetails_provider.dart';
import 'package:newapp/Screen/Cart.dart';

import 'package:newapp/Utils/colors.dart';
import 'package:newapp/Widget/Drawer.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MenuItem extends StatefulWidget {
  MenuItemstate createState() => MenuItemstate();
}

class MenuItemstate extends State<MenuItem> {
  bool loader = true;
  final String url = "https://api.myjson.com/bins/zppy0";
  MenuItemList food;
  @override
  void initState() {
    this.getData();
    _getNameEmail();
  }

  Future<String> getData() async {
    
    food = await getMenuItemData();

    setState(() {
      loader = false;
    });
    return "success";
  }

  SharedPreferences sharedPreferences;
  String email;

  _getNameEmail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString("username");
    });
  }

  @override
  Widget build(BuildContext context) {
    var cartitem = Provider.of<Menudetails>(context);
    int totalCount = cartitem.selectedFooditem.length;
    

    return Scaffold(
      //body: Center(child: CircularProgressIndicator()),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('MenuItems!!'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: 150.0,
                width: 30.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("/cartdetails");
                  },
                  child: Stack(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 36,
                        ),
                        onPressed: null,
                      ),
                      Positioned(
                          child: Stack(
                        children: <Widget>[
                          Icon(Icons.brightness_1,
                              size: 20.0, color: Colors.red[700]),
                          Positioned(
                              top: 3.0,
                              right: 7,
                              child: Center(
                                child: Text(
                                  '$totalCount',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ],
                      )),
                    ],
                  ),
                )),
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: loader
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemCount: food.foods.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Cart(foodItem: food.foods[index]),
                          ));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                     
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: greencolor, blurRadius: 4)
                          ]),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(bottom: 10),
                                width: 200,
                                height: 135,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          food.foods[index].foodimage,
                                        ),
                                        fit: BoxFit.cover))),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(food.foods[index].foodname,
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                         
                                  Text("₹ ${food.foods[index].foodprice}",
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: RaisedButton(
                                    onPressed: () {

                      cartitem.addToCart(food.foods[index]);


                                    },
                                    child: Text("Add to cart")))
                          ]),
                    ));
              },
            ),
    );
  }
}
