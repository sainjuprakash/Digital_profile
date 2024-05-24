import 'dart:convert';
import 'dart:io';

import 'package:digital_profile/src/features/login/domain/repository/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/endpoints.dart';

class ImplLoginRepository extends LoginRepository {
  final DioClient _dioClient = DioClient();
  get http => null;

  @override
  Future<String?> login(String? email, String? password) async {
    try {
      final response = await _dioClient.post(
        '/login',
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
       // print(response.statusCode);
        final accessToken = response.data['token'];
        //final refreshToken = response.data['refresh_token'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', accessToken);
        //await prefs.setString('refresh_token', refreshToken);

        Endpoints.api_token = accessToken;
        // Endpoints.refreshToken = refreshToken;
      } else {
        throw Exception('Failed to login');
      }
    } catch (errMsg) {
      print(errMsg);
      throw Exception("login fail : $errMsg");
    }
  }
}
