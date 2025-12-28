// // lib/core/services/menu_api_service.dart

// import 'dart:convert';

// import 'package:http/http.dart' as http;

// import '../models/user_role_response.dart';

// class MenuApiService {
//   Future<UserRoleResponse> fetchUserMenu(String token) async {
//     final response = await http.get(
//       Uri.parse("https://api.example.com/user/menu"),
//       headers: {
//         "Authorization": "Bearer $token",
//         "Content-Type": "application/json",
//       },
//     );

//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       return UserRoleResponse.fromJson(jsonData);
//     } else {
//       throw Exception("Failed to load menu");
//     }
//   }
// }
