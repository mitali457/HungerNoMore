import 'package:flutter/material.dart';
import 'package:newapp/Screen/ordernotify.dart';


import 'package:newapp/Utils/colors.dart';
import 'package:newapp/Utils/images.dart';

class Payment extends StatefulWidget {
  final String title;
  Payment({this.title});
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  void message() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: 
              
            TextFormField
            (decoration: InputDecoration(
                    
              labelText:'Enter Your Card No-',),
            style: TextStyle(
                      
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color:Colors.blueGrey,
                        )),
            
            
            actions: <Widget>[
              FlatButton(
                child: Text('Ok',style: TextStyle(
                      
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:greencolor,
                        )),
                onPressed: () {
                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Ordernotify()),
                                  );
                },
              ),
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
         // backgroundColor: greencolor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: (){}
            //  => Navigator.pop(context, false),
          ),
          title: Text(
            'Payment',
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
               Navigator.of(context).pushNamedAndRemoveUntil(
                  '/homescreen', (Route<dynamic> route) => false);
              },
              icon: Icon(Icons.home, color: Colors.white),
              iconSize: 30,
            )
          ],
        ),
        
        body: ListView(children: <Widget>[
          SingleChildScrollView(
            child: Container(
                width: width,
                height: height,
                //color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 20.0,
                                    left: 10.0,
                                    right: 20,
                                    bottom: 30),
                                child: Text(
                                  'Choose your payment option:',
                                  style: new TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold,
                                    color: greencolor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 82)),
                          ListTile(
                            leading: Container(
                              width: 70.0,
                              height: 150.0,
                              child: InkWell(
                                onTap: () {
                                  message();
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => Ordernotify()),
                                  // );
                                },
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/credit.png'),
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.only(top: 10, left: 40),
                            title: Text('Credit Card',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ),
                          ListTile(
                            leading: Container(
                              width: 70.0,
                              height: 150.0,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Ordernotify()),
                                  );
                                },
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: paytminpaymentscreen ),
                              ),
                            ),
                            contentPadding: EdgeInsets.only(top: 10, left: 40),
                            title: Text(
                              'Paytm',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/Googlepay.png'),
                              radius: 35,
                            ),
                            contentPadding: EdgeInsets.only(top: 10, left: 40),
                            title: Text('Googlepay',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: phonepeinpaymentscreen,
                              radius: 33,
                            ),
                            contentPadding: EdgeInsets.only(top: 10, left: 40),
                            title: Text('Phonepe',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ),
                          ListTile(
                            leading: Container(
                                width: 70.0,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: cashondeliveryInPaymentScreen
                                  ),
                                )),
                            contentPadding: EdgeInsets.only(top: 10, left: 40),
                            title: Text('Cash On Delivery',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ),
                        ])
                  ],
                )),
          ),
        ]));
  }
}

//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(
//                         padding: EdgeInsets.all(20.0),
//                         child: Container(
//                             width: width / 1.5,
//                             height: height / 1.5,
//                             color: Colors.white,
//                             child: InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           Ordernotify()),
//                                 );
//                               },
//                               child: ListWheelScrollView(
//                                 itemExtent: 150,
//                                 children: <Widget>[
//                                   GestureDetector(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 Ordernotify()),
//                                       );
//                                     },
//                                     child: Container(
//                                       width: width / 1.5,
//                                       height: height / 2.0,
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           boxShadow: [
//                                             BoxShadow(
//                                                 color: Colors.orange,
//                                                 blurRadius: 2.0)
//                                           ],
//                                           borderRadius:
//                                           BorderRadius.circular(20),
//                                       image: DecorationImage(
//                                         image: NetworkImage(
//                                             'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRm_8RNpbpbuaa-Vub7snnqe9nww7KGlbke7UfXUviWuEKowxWS'),
//                                         fit: BoxFit.cover,
//                                       )),
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {

//                                 },
//                                 child: Container(
//                                   width: width / 1.5,
//                                   height: height / 2.0,
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       boxShadow: [
//                                         BoxShadow(
//                                             color: Colors.orange,
//                                             blurRadius: 2.0)
//                                       ],
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           image: DecorationImage(
//                                             image: NetworkImage(
//                                                 'https://image.freepik.com/free-vector/credit-card-vector_23-2147498028.jpg'),
//                                             fit: BoxFit.cover,
//                                           )),
//                                     ),
//                                   ),

//                                   InkWell(
//                                     onTap: () {},
//                                     child: Container(
//                                       margin: EdgeInsets.all(5.0),
//                                       width: width / 1.5,
//                                       height: height / 2.0,
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           boxShadow: [
//                                             BoxShadow(
//                                                 color:
//                                                     Colors.blueAccent,
//                                                 blurRadius: 1.0)
//                                           ],
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           image: DecorationImage(
//                                             image: NetworkImage(
//                                                 'https://www.searchpng.com/wp-content/uploads/2019/02/Paytm-Logo-With-White-Border-PNG-image-715x227.png'),
//                                             fit: BoxFit.contain,
//                                           )),
//                                     ),
//                                   ),
//                                   InkWell(
//                                     onTap: () {},
//                                     child: Container(
//                                       margin: EdgeInsets.all(5.0),
//                                       width: width / 1.5,
//                                       height: height / 2.0,
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           boxShadow: [
//                                             BoxShadow(
//                                                 color:
//                                                     Colors.deepPurple,
//                                                 blurRadius: 2.0)
//                                           ],
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           image: DecorationImage(
//                                             image: NetworkImage(
//                                                 'https://i1.wp.com/www.wealthmann.com/wp-content/uploads/2019/07/Untitled-1-Recovered-27.png?fit=1080%2C720&ssl=1'),
//                                             fit: BoxFit.contain,
//                                           )),
//                                     ),
//                                   ),
//                                   InkWell(
//                                     onTap: () {},
//                                     child: Container(
//                                       margin: EdgeInsets.all(5.0),
//                                       width: width / 1.5,
//                                       height: height / 2.0,
//                                       decoration: BoxDecoration(
//                                           color: Colors.deepPurple[900],
//                                           boxShadow: [
//                                             BoxShadow(
//                                                 color: Colors.blueGrey,
//                                                 blurRadius: 2.0)
//                                           ],
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           image: DecorationImage(
//                                             image: NetworkImage(
//                                                 'https://pngimage.net/wp-content/uploads/2018/06/net-banking-png.png'),
//                                             fit: BoxFit.cover,
//                                           )),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )))
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   ],
// ));
