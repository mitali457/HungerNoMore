// import 'dart:convert';

// import 'package:http/http.dart' as http;



// class CategoryService {
//   CategoriesList categories;
  
 
//   Future<CategoriesList> getCategories() async {
//     try {
//       var header = {
//         "user-key": "2146ee2f7a26d5d50079009c13359168",
//         "Accept": "application/json"
//       };
//       final response = await http.get(
//           'https://developers.zomato.com/api/v2.1/categories',
//           headers: header);

//       if (response.statusCode == 200) {
//         // If the server did return a 200 OK response, then parse the JSON.
//         print(response.body.toString());
//         categories = CategoriesList.fromJson(json.decode(response.body));
//         print("categories ${categories.category[0].categories.id}");
//         return categories;
//       } else {
//         // If the server did not return a 200 OK response, then throw an exception.
//         print(response.statusCode);
//               return null;

//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }

//   }
// }

// CategoryService categoryService = CategoryService();