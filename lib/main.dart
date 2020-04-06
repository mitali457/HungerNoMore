import 'package:flutter/material.dart';
import 'package:newapp/Provider/FoodItems_provider.dart';
import 'package:newapp/Provider/menuItemsdetails_provider.dart';
import 'package:newapp/Route/routes.dart';
import 'package:newapp/Utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Menudetails>(
          create: (BuildContext context) => Menudetails(),
        ),
        
        
        ChangeNotifierProvider<FoodItemsproviderchange> (
      create: (BuildContext context) => FoodItemsproviderchange(greentheme))
      ],

        //create: (_) => FoodItemsproviderchange(greentheme),
        child: Builder(builder: (BuildContext context) {
          final themechange = Provider.of<FoodItemsproviderchange>(context);
          return MaterialApp(
            theme: themechange.getTheme(),
            routes: Routes.getRoutes(),
            initialRoute: '/',
            debugShowCheckedModeBanner: false,
          );
        }
        )
       
        );
  }
}

// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.onAuthStateChanged,
//       builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting)
//           return SplashScreen();
//         if (!snapshot.hasData || snapshot.data == null) return Login();
//         return Homescreen();
//       },
//     );
//   }
// }
