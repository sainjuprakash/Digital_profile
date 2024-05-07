import 'dart:convert';

import 'package:digital_profile/src/features/login/domain/repository/login_repository.dart';

class ImplLoginRepository extends LoginRepository {
  get http => null;

  @override
  Future<String?> login(String email, String password) async {
    String token = await Candidate().getToken();
    try {
      final response = await http.post(
        Uri.parse('baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (response.statuscode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final String? token = data['token'];
        return token;
      } else {
        return null;
      }
    } catch (errormsg) {
      throw UnimplementedError(errormsg.toString());
    }
  }
}
