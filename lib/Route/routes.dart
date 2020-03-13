import 'package:flutter/material.dart';
import 'package:newapp/FoodApp_Screen/Cart.dart';
import 'package:newapp/FoodApp_Screen/Category.dart';
import 'package:newapp/FoodApp_Screen/Homescreen.dart';
import 'package:newapp/FoodApp_Screen/Login.dart';
import 'package:newapp/FoodApp_Screen/Menu.dart';
import 'package:newapp/FoodApp_Screen/Payment.dart';
import 'package:newapp/FoodApp_Screen/Registration.dart';
import 'package:newapp/FoodApp_Screen/ResetPassword.dart';
import 'package:newapp/FoodApp_Screen/Restaurant_name.dart';
import 'package:newapp/FoodApp_Screen/Trackorders.dart';
import 'package:newapp/FoodApp_Screen/splash.dart';

class Routes {
  static final _appRoutes = {
    '/': (BuildContext context) => SplashScreen(),
    
    '/register': (BuildContext context) => Registration(),
    
    '/login': (BuildContext context) => Login(),
    'resetpassword':(BuildContext context)=>ResetPassword(),
    '/homescreen': (BuildContext context) => Homescreen(),
    '/category': (BuildContext context) => Category(),
    '/menu': (BuildContext context) => MenuItem(),
    '/cart':(BuildContext context)=>Cart (),
    '/payment':(BuildContext context)=>Payment(),
    '/trackorders':(BuildContext context)=> Trackorder(),
    '/restaurantname':(BuildContext context)=>RestaurantName()


    
    
  };

  static getRoutes() {
    return _appRoutes;
  }
}