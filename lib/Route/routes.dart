import 'package:flutter/material.dart';
import 'package:newapp/Screen/Cart.dart';
import 'package:newapp/Screen/Cartdetails.dart';
import 'package:newapp/Screen/Category.dart';
import 'package:newapp/Screen/Login.dart';
import 'package:newapp/Screen/Menu.dart';
import 'package:newapp/Screen/Payment.dart';
import 'package:newapp/Screen/Registration.dart';
import 'package:newapp/Screen/ResetPassword.dart';
import 'package:newapp/Screen/Restaurant_name.dart';
import 'package:newapp/Screen/Settings.dart';
import 'package:newapp/Screen/Trackorders.dart';
import 'package:newapp/Screen/Useraccount.dart';
import 'package:newapp/Screen/helpcenter.dart';
import 'package:newapp/Screen/splash.dart';

import 'package:newapp/Widget/Bottomnavigationbar.dart';


class Routes {
  static final _appRoutes = {
    '/': (BuildContext context) => SplashScreen(),
    
    '/register': (BuildContext context) => Registration(),
    
    '/login': (BuildContext context) => Login(),
    'resetpassword':(BuildContext context)=>ResetPassword(),
    '/homescreen': (BuildContext context) => CustomBottomNavigationBar(),
    '/category': (BuildContext context) => Category(),
    '/menu': (BuildContext context) => MenuItem(),
    '/cart':(BuildContext context)=>Cart() ,
    '/cartdetails':(BuildContext context)=>CartDetails(),
    '/payment':(BuildContext context)=>Payment(),
    '/trackorders':(BuildContext context)=> Trackorder(),
    '/restaurantname':(BuildContext context)=>RestaurantName(),
    '/users':(BuildContext context)=> UserAccount(),
    '/settings':(BuildContext context)=> Settingtheme(),
    '/helpcenter':(BuildContext context)=>HelpCenter(),


    
    
  };

  static getRoutes() {
    return _appRoutes;
  }
}