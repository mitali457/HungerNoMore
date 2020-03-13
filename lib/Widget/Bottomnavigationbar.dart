import 'package:flutter/material.dart';
import 'package:newapp/FoodApp_Screen/Cart.dart';
import 'package:newapp/FoodApp_Screen/Category.dart';
import 'package:newapp/FoodApp_Screen/Menu.dart';
import 'package:newapp/Utils/colors.dart';
class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return BottomNavigationBar(
        backgroundColor: greencolor,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(icon:Icon(Icons.category,color: Colors.white,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));
            }),

            title:  Text('Category',style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            
            

            icon: IconButton(icon: Icon(Icons.restaurant_menu,color: Colors.white), onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuItem()));
            }),
            title: Text('Menu',style: TextStyle(color: Colors.white),),
           
           

            
          ),
          
          BottomNavigationBarItem(
              icon:  IconButton(icon:Icon(Icons.shopping_cart,color: Colors.white),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
              }
              ),
               title: Text('Cart',style: TextStyle(color: Colors.white)))
        ],
    );
  }
}