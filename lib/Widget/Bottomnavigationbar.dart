import 'package:flutter/material.dart';

import 'package:newapp/Screen/category.dart';
import 'package:newapp/Screen/home.dart';
import 'package:newapp/Screen/menu.dart';
import 'package:newapp/Utils/colors.dart';



class CustomBottomNavigationBar extends StatefulWidget {
  State<StatefulWidget> createState() {
    return CustomBottomNavigationBarState();
  }  
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedPage = 0;
  List<Widget> tabs = [Homescreen(),Category(), MenuItem()];

  @override
  Widget build(BuildContext context) {

    return SafeArea 
    (child: 
     Scaffold(
      
          body:tabs[_selectedPage],
          bottomNavigationBar: BottomNavigationBar(
      
        //backgroundColor: Colors.green,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;  
          });
        },
        items: [ 
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: greencolor,
            ),
            
            title: Text('Home', style: TextStyle(color: greencolor)),
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              color: greencolor,
            ),
            // onPressed: (){
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));
            // }),

            title: Text('Category', style: TextStyle(color: greencolor)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu, color: greencolor),
            //  onPressed: (){
            //    Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuItem()));
            // }),
            title: Text(
              'Menu',
              style: TextStyle(color: greencolor),
            ),
          ),
         
    
    
        ],
        ),
        ),
    
        );
  }
}
