import 'package:flutter/material.dart';
import 'package:newapp/Provider/menuItemsdetails_provider.dart';
import 'package:newapp/Utils/colors.dart';

import 'package:provider/provider.dart';

class CartDetails extends StatefulWidget {
  // final foodItem;
  CartDetails({
    Key key,
  }) : super(key: key);
  @override
  _CartDetailsState createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    double total = 0;

    var cartitem = Provider.of<Menudetails>(context);
    int totalCount = cartitem.selectedFooditem.length;
    for (int i = 0; i < cartitem.selectedFooditem.length; i++) {
      if (cartitem.selectedFooditem[i].foodname != null)
        total = total + cartitem.selectedFooditem[i].foodprice;
    }

    print(totalCount);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: cartitem.selectedFooditem.length,
            itemBuilder: (context, index) {
              // int cartIndex = cart.keys.toList()[index];
              // int count = cart[cartIndex];

              return Stack(alignment: Alignment.topRight, children: <Widget>[
                Card(
                    child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: greencolor, blurRadius: 10)
                      ]),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(color: greencolor, blurRadius: 9)
                                ],
                                image: DecorationImage(
                                    image: NetworkImage(cartitem
                                        .selectedFooditem[index].foodimage),
                                    fit: BoxFit.cover))),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              SizedBox(height:10),
                              Text(cartitem.selectedFooditem[index].foodname,
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(
                                  "₹ ${cartitem.selectedFooditem[index].foodprice}",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ]),
                        // Row(children: <Widget>[
                        //   IconButton(
                        //       icon: Icon(
                        //         Icons.remove,
                        //         color: Colors.blueGrey,
                        //         size: 22,
                        //       ),
                        //       onPressed: () {
                        //         // if (cartitem.selectedFooditem[index].foodname.length > 0) {
                        //         //   setState(() {
                        //         //     cartitem.selectedFooditem[index].foodname =
                        //         //         cartitem.selectedFooditem[index] - 1;
                        //         //   });
                        //         // }
                        //       }),
                        //   Text('1',
                        //       style: TextStyle(
                        //         color: Colors.blueGrey,
                        //         fontSize: 18.0,
                        //         fontWeight: FontWeight.bold,
                        //       )),
                        //   IconButton(
                        //       icon: Icon(
                        //         Icons.add,
                        //         color: Colors.blueGrey,
                        //         size: 22,
                        //       ),
                        //       onPressed: () {}),
                        // ]),
                      ]),
                )),
                Padding(
                    padding: EdgeInsets.only(left: 2, right: 1),
                    child: FlatButton(
                        onPressed: () {
                          cartitem.clear(cartitem.selectedFooditem[index]);
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.green[700],
                          child: Icon(Icons.cancel, size: 24),
                        )))
              ]);
            },
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(children: <Widget>[
              Text(
                'Total Amount',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
               '₹ ${total.toString()}',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ]),
          ),
        ],
      ),
      bottomNavigationBar: _buildTotalContainer(context),
    );
  }

  Widget _buildTotalContainer(context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/payment");
        },
        child: Container(
          height: 50.0,
          decoration: BoxDecoration(
            //color: greencolor,
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(35.0),
          ),
          child: Center(
            child: Text(
              "Proceed to Checkout",
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
