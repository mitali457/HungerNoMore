import 'package:flutter/material.dart';
import 'package:newapp/Utils/colors.dart';


class RestaurantName extends StatefulWidget {
  final String title;
  RestaurantName ({this.title});
  @override
  _RestaurantNameState createState() => _RestaurantNameState();
}



class _RestaurantNameState extends State< RestaurantName > {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    )
                  ),
                  child: Image.asset("images/f1.png", fit: BoxFit.fitWidth,),
                ),

                Padding(
                  padding: const EdgeInsets.only(left:15.0, top: 40.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15.0,
                    
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("The Protorix Cafe", style: TextStyle(fontSize: 20.0, color: Colors.black),),
            ),

            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Row(
                    children: <Widget>[
                    Icon(Icons.location_on, color: Colors.grey,),
                      SizedBox(width: 5.0,),
                      Text("34, Banani-11, Chennai; ", style: TextStyle(fontSize: 14.0, color: Colors.black),),

                  ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right:15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7.0, right: 7.0, top: 3.0, bottom: 3.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.access_time, color: Colors.orange,),
                          SizedBox(width: 5.0,),
                          Text("Closes in 2hrs", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold,fontSize: 14.0),)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5.0, bottom: 5.0),
              child: Divider(
                color: Colors.grey.withOpacity(0.2),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 15.0),
              child: Container(
                height: 40.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color:  greencolor,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: Center(
                          child: FlatButton(
                          child: Text("Breakfast", style: TextStyle(color: Colors.white, fontSize: 16.0, letterSpacing: 0.5),),
                        
                        onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantName()));
                    }
                    )),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: new Border.all(color:  greencolor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: Center(
                          child: Text("Lunch", style: TextStyle(
                            color:  greencolor,
                            fontSize: 16.0,
                            letterSpacing: 0.5
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: new Border.all(color:  greencolor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: Center(
                          child: Text("Snacks", style: TextStyle(
                              color:  greencolor,
                              fontSize: 16.0,
                              letterSpacing: 0.5
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: new Border.all(color:  greencolor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: Center(
                          child: Text("Brunch", style: TextStyle(
                              color:  greencolor,
                              fontSize: 16.0,
                              letterSpacing: 0.5
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: new Border.all(color:  greencolor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: Center(
                          child: Text("Dinner", style: TextStyle(
                              color:  greencolor,
                              fontSize: 16.0,
                              letterSpacing: 0.5
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.topRight,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            child: Image.asset("images/food4.png", fit: BoxFit.fitWidth,),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.7),
                            radius: 25.0,
                            child: Icon(Icons.favorite_border, color: Colors.white, size: 30.0,),
                          )
                      ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("Goru Mango Waffle", style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),),
                              ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text("Continental", style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),),
                                ),
                            ],),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    border: new Border.all(color:  greencolor),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.add, color:  greencolor, size: 20.0,),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.topRight,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                            ),
                            child: GestureDetector(
                              onTap: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (_){
                                //   return Second();
                                // }));
                              },
                              child: Hero(
                                  tag: 'food',
                                  child: Image.asset("images/food2.png", fit: BoxFit.fitWidth,)
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.7),
                            radius: 25.0,
                            child: Icon(Icons.favorite_border, color: Colors.white, size: 30.0,),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text("Asian Ramen Noodle", style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text("Co & Cookers", style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),),
                                ),
                              ],),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    border: new Border.all(color:  greencolor),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.add, color:  greencolor, size: 20.0,),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
      appBar: AppBar(
        title:Text('Restaurants'),
      ),

     )
      );
  }
}