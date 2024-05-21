/**
 * Copyright (c) 2024
 * Created by Mahesh Yakami on 5/7/24.
 *
 * yakami.mahesh@gmail.com
 */
// ignore_for_file: constant_identifier_names

class Endpoints {
  static const String baseUrl = 'http://rubytest.git.com.np/api';
  static const String login = '/login';

  static const String api_key = '';

  // will save token here for now
  static const String api_token = '';
  static const Duration connectTimeout = Duration(milliseconds: 5000);
  static const Duration receiveTimeout = Duration(milliseconds: 3000);
}
