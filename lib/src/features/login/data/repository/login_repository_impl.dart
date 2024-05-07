import 'dart:convert';

import 'package:digital_profile/src/features/login/domain/repository/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImplLoginRepository extends LoginRepository {
  get http => null;

  @override
  Future<String?> login(String? email, String? password) async {
    print(email! + password!);
    try {
      print('entered try statement');
      final response = await http.post(
        Uri.parse('https://rubytest.git.com.np/api/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'email': email, 'password': password}),
      );
      print('-----------------------');
      print(response);
      if (response.statuscode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final String? token = data['token'];
        return token;
      } else {
        return null;
      }
    } catch (errormsg) {
      throw Exception('Fail to login $errormsg');
    }
  }
}

// Future<bool> setToken(String value) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.setString('token', value);
// }
