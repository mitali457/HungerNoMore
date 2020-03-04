import 'package:flutter/material.dart';
import 'package:newapp/FoodApp_Screen/Menu.dart';
import 'package:newapp/FoodApp_Screen/Restaurant_name.dart';



import 'package:newapp/Widget/Drawer.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomescreenState();
  }
}



class _HomescreenState extends State<Homescreen> {
  final TextEditingController _nameFilter = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   CategoriesList categoriesList;
 // RestaurantList resto;
  //String restaurantsname;
  //bool loader = true;
  SharedPreferences sharedPreferences;
  String name;
  String email;

  @override
  void initState() {
    super.initState();
    //_getcategories();
    _getNameEmail();
  //  _getrestaurants();
  }

  _getNameEmail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString("username");
      name = sharedPreferences.getString("name");
    });
  }

  // _getcategories() async {
  //   categoriesList = await  CategoryService.getCategories();
  //   print("categories in home ${categoriesList?.category[0].categories.id}");

  //   setState(() {});
//   }
  // _getrestaurants() async {
  //   resto = await cityService.getRestuarants();
  //   print('resto $resto');
  //   setState(() {
  //     loader = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
   // if (loader)
      //return Scaffold(body: Center(child: CircularProgressIndicator()));
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(children: <Widget>[
            SizedBox(
              height: 5,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(5),
            //         boxShadow: [
            //           BoxShadow(
            //               color: Colors.grey[300],
            //               offset: Offset(2, 1),
            //               blurRadius: 5)
            //         ]),
            //     child: ListTile(
            //       leading: Icon(
            //         Icons.search,
            //         color: Colors.green,
            //       ),
            //       title: TextField(
            //         decoration: InputDecoration(
            //             hintText: "Find Nearby Restuarant ",
            //             border: InputBorder.none),
            //       ),
            //       trailing: Icon(
            //         Icons.filter_list,
            //         color: Colors.green,
            //       ),
            //     ),
            //   ),
            // ),

            // Expanded(
            //               child: ListView.builder(
            //       itemCount: resto.restaurants.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         print(resto.restaurants.length);
            //          return GestureDetector(
            //             onTap: () {
            //               // Navigator.push(
            //               // context,
            //               // MaterialPageRoute(
            //               //     builder: (context) => MyHomePage()));

            //             },
            //         child:ListTile(
            //          leading:
            //               Image.network(resto.restaurants[index].restaurant.url),
            //           title: Text(resto.restaurants[index].restaurant.name),
            //          ));
            //       }),
            // ),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 15.0, left: 60),
                width: 120,
                child: Image.network(
                        'https://images.jdmagicbox.com/comp/kolkata/48/033pf002148/catalogue/sholo-ana-bangali-jodhpur-park-kolkata-home-delivery-restaurants-1ej97et.png?clr=#521414'),

              ),
              Container(
                padding: EdgeInsets.all(6),
                height: 140,
                width: 200,
                decoration: BoxDecoration(),
                child: FlatButton(
                    color: Colors.white,
                     child: Text("Yauatcha Bengaluru  ",
                    textAlign: TextAlign.center,
                    //textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),

                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantName()));
                    }),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 15.0, left: 60),
                width: 120,
                child: Image.network(
                        'https://pngriver.com/wp-content/uploads/2018/04/Download-Indian-Food-PNG-Image.png'),
              ),
              Container(
                padding: EdgeInsets.all(6),
                height: 140,
                width: 200,
                decoration: BoxDecoration(),
                child: FlatButton(
                    color: Colors.white,
                    child: Text("Jalsa Restaurant - Celebrating Food and Love  ",
                    textAlign: TextAlign.center,
                    //textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),

                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantName()));
                    }),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 15.0, left: 60),
                width: 120,
                child: Image.network(
                        'https://pngimage.net/wp-content/uploads/2018/05/biryani-png-images-2.png'),
              ),
              Container(
                padding: EdgeInsets.all(6),
                height: 140,
                width: 200,
                decoration: BoxDecoration(),
                child: FlatButton(
                    color: Colors.white,
                    child: Text("Ebony Restaurant  ",
                    textAlign: TextAlign.center,
                    //textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),

                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantName()));
                    }),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 15.0, left: 60),
                width: 120,
                child: Image.network(
                        'https://blog.railyatri.in/wp-content/uploads/2016/04/Cover.png'),
              ),
              Container(
                padding: EdgeInsets.all(6),
                height: 140,
                width: 200,
                decoration: BoxDecoration(),
                child: FlatButton(
                    color: Colors.white,
                    child: Text("Raj Pavilion ",
                    textAlign: TextAlign.center,
                    //textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),

                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantName()));
                    }),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 15.0, left: 60),
                width: 120,
                child: Image.network(
                        'https://www.deccanherald.com/sites/dh/files/styles/article_detail/public/article_images/2019/09/07/file74zjbh39v2x9uew71kj-1567864519.jpg?itok=Vnd3cnWc'),
              ),
              Container(
                padding: EdgeInsets.all(6),
                height: 140,
                width: 200,
                decoration: BoxDecoration(),
                child: FlatButton(
                    color: Colors.white,
                    child: Text("Caprese ",
                    textAlign: TextAlign.center,
                    //textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),

                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantName()));
                    }),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 15.0, left: 60),
                width: 120,
                child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQistWxyC9Slba1WMmsGJhBs2rgwh7pjnMddbsis86wBW0blYQ-'),
              ),
              Container(
                padding: EdgeInsets.all(6),
                height: 140,
                width: 200,
                decoration: BoxDecoration(),
                child: FlatButton(
                    color: Colors.white,
                    child: Text("Vidyarthi Bhavan",
                    textAlign: TextAlign.center,
                    //textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),

                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantName()));
                    }),
              ),
            ]),

            // SizedBox(height: 10.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     Text(
            //       "Category",
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         fontSize: 23,
            //         fontWeight: FontWeight.w800,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ],
            // ),
            // Container(
            //   height: MediaQuery.of(context).size.height / 6,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     itemCount: categoriesList.category.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       Category category = categoriesList.category[index];

            //       return Padding(
            //         padding: EdgeInsets.only(right: 10.0),
            //         child: Column(
            //           children: <Widget>[
            //             Center(
            //               child: Container(
            //                 height: MediaQuery.of(context).size.height / 6,
            //                 width: MediaQuery.of(context).size.height / 6,
            //                 padding: EdgeInsets.all(1),
            //                 constraints: BoxConstraints(
            //                   minWidth: 20,
            //                   minHeight: 20,
            //                 ),
            //                 child: Center(
            //                   child: Text(
            //                     category.categories.name,
            //                     style: TextStyle(
            //                       color: Colors.green,
            //                       fontSize: 20,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                     textAlign: TextAlign.center,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     Text(
            //       "Restaurants",
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         fontSize: 23,
            //         fontWeight: FontWeight.w800,
            //         color: Colors.black,
            //       ),
            //     ),
            //     RaisedButton(
            //       onPressed:(

            //       )
            //      {
            //        Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => RestaurantName()));
            //      }
            //     ),
            //   ],
            // ),

            //     Container(
            //       height: MediaQuery.of(context).size.height / 6,
            //       child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         shrinkWrap: true,
            //         itemCount:0,
            //         itemBuilder: (BuildContext context, int index) {

            //          // String resto= RestaurantList.location.city;

            //           return Padding(
            //             padding: EdgeInsets.only(right: 10.0),
            //             child: Column(
            //               children: <Widget>[
            //                 Center(
            //                   child: Container(
            //                     height: MediaQuery.of(context).size.height / 6,
            //                     width: MediaQuery.of(context).size.height / 6,
            //                     padding: EdgeInsets.all(1),
            //                     constraints: BoxConstraints(
            //                       minWidth: 20,
            //                       minHeight: 20,
            //                     ),
            //                     child: Center(
            //                       child: Text('hh',
            //                        // restaurant.location.city,
            //                         style: TextStyle(
            //                           color: Colors.green,
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //                         textAlign: TextAlign.center,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           );
            //          },
            //       ),
            //     ),
        //           )
        //         )
           ]),
         ),
        appBar: AppBar(
          title: Text(
            ("HuNgEr No MoRe"),
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 3,
              //height: 2
            ),
          ),
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
              color: Colors.white),
        ),
        drawer: CustomDrawer(email: email),
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.category,color: Colors.white,),
            title: new Text('Category',style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            
            

            icon: new Icon(Icons.restaurant_menu,color: Colors.white),
            title: new Text('Menu',style: TextStyle(color: Colors.white),),
           
           

            
          ),
          
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,color: Colors.white), title: Text('Cart',style: TextStyle(color: Colors.white)))
        ],
      ),
        );
  }
}
