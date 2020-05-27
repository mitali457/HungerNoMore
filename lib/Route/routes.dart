import 'package:flutter/material.dart';


import 'package:newapp/Screen/cartdetails.dart';
import 'package:newapp/Screen/category.dart';
import 'package:newapp/Screen/login.dart';
import 'package:newapp/Screen/menu.dart';
import 'package:newapp/Screen/ordernotify.dart';
import 'package:newapp/Screen/payment.dart';
import 'package:newapp/Screen/registration.dart';
import 'package:newapp/Screen/resetpassword.dart';

import 'package:newapp/Screen/settings.dart';
import 'package:newapp/Screen/trackorders.dart';
import 'package:newapp/Screen/useraccount.dart';
import 'package:newapp/Screen/cart.dart';
import 'package:newapp/Screen/helpcenter.dart';
import 'package:newapp/Screen/popularfood.dart';
import 'package:newapp/Screen/splash.dart';

import 'package:newapp/Widget/bottomnavigationbar.dart';
import 'package:newapp/Widget/googlemapview.dart';


class Routes {
  static final _appRoutes = {
    '/': (BuildContext context) => SplashScreen(),
    
    '/register': (BuildContext context) => Registration(),
    
    '/login': (BuildContext context) => Login(),
    'resetpassword':(BuildContext context)=>ResetPassword(),
    '/homescreen': (BuildContext context) => CustomBottomNavigationBar(),
    '/category': (BuildContext context) => Category(),
    '/menu': (BuildContext context) => MenuItem(),
    '/order':(BuildContext context)=>Ordernotify(),
    '/cart':(BuildContext context)=>Cart() ,
    '/cartdetails':(BuildContext context)=>CartDetails(),
    '/payment':(BuildContext context)=>Payment(),
    '/trackorders':(BuildContext context)=> Trackorder(),
    
    '/users':(BuildContext context)=>  UserAccount (),
    '/settings':(BuildContext context)=> Settingtheme(),
    '/helpcenter':(BuildContext context)=>HelpCenter(),
    '/gmap':(BuildContext context)=> GoogleMapView(),

    '/popularfooddetails':(BuildContext context)=> Popularfooddetails (),


    
    
  };

  static getRoutes() {
    return _appRoutes;
  }
}