// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:newapp/FoodApp_Model/cities.dart';



// class DetailsService {
  
//   RestaurantList restaurant;
 
//  Future <dynamic> getRestuarants()async{
//     try{
//       var header = {
//         "user-key": "2146ee2f7a26d5d50079009c13359168",
//         "Accept": "application/json"
//       };
//       final response = await http.get(
//           'https://developers.zomato.com/api/v2.1/restaurant?res_id=54153',

//           headers: header);

//       if (response.statusCode == 200) {
//         // If the server did return a 200 OK response, then parse the JSON.
//         print(response.body.toString());
//       restaurant = RestaurantList.fromJson(json.decode(response.body));
//         print("restaurant ${restaurant.restaurants}");
//         return restaurant;
//       } else {
//         // If the server did not return a 200 OK response, then throw an exception.
//         print(response.statusCode);
//               return null;


//     }
//     }
//     catch(e){
//      print(e);
//       return null; 
//     }
//   }
// }
// DetailsService detailsService = DetailsService();