import 'package:flutter/material.dart';
import 'package:newapp/Provider/menuItemsdetails_provider.dart';
import 'package:newapp/Utils/colors.dart';
import 'package:provider/provider.dart';
class Cart extends StatefulWidget {
  final foodItem;
  
  Cart({Key key, @required this.foodItem}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
 

  @override
  Widget build(BuildContext context) {
     var cartitem = Provider.of<Menudetails>(context);
    int totalCount = 0;
    if (cartitem.cart.length > 0) {
      totalCount = cartitem.cart.values.reduce((a, b) => a + b);
    }
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150.0,
              width: 30.0,
              child: GestureDetector(
                onTap: () {

         Navigator.of(context).pushReplacementNamed("/cartdetails");

                },
                child: Stack(
                    children: <Widget>[IconButton(
                  icon: new Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                Positioned(
                          child:  Stack(
                        children: <Widget>[
                          Icon(Icons.brightness_1,
                              size: 20.0, color: Colors.red[700]),
                          Positioned(
                              top: 3.0,
                              right: 7,
                              child:  Center(
                                child:  Text(
                                  '$totalCount',
                                  style:  TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ],
                      ))
                     ] ),
            ),
          )
           ) ],
        title: Text(
          "Your Food Cart!!",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        //backgroundColor: greencolor,
        elevation: 0.0,
        centerTitle: true,
      ),
      
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Image.network(widget.foodItem.foodimage),
          Text(widget.foodItem.foodname,
          textAlign: TextAlign.center,
          style: TextStyle(color: greencolor,fontSize: 28,fontWeight: FontWeight.bold),
          ),
          Text(widget.foodItem.foodprice,
          textAlign: TextAlign.center,
          style: TextStyle(color: greencolor,fontSize: 28,fontWeight: FontWeight.bold),
          )
        ],
      ),
      bottomNavigationBar: _buildTotalContainer(),
    );
  }

  Widget _buildTotalContainer() {
    return Container(
      height: 90.0,
      padding: EdgeInsets.only(
        //top:7,
        left: 10.0,
        right: 10.0,
       bottom: 30
      ),
      
         child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("/cartdetails");
             
            },
            child: Container(
              height: 20.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Center(
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          
        
      
    );
  }
}
