import 'package:digital_profile/core/services/shared_preferences_service.dart';
import 'package:digital_profile/src/features/login/domain/repository/login_repository.dart';

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
        final accessToken = response.data['token'];
        //final refreshToken = response.data['refresh_token'];

        final prefs = await PrefsService.getInstance();
        await prefs.setString(PrefsServiceKeys.accessTokem, accessToken);
        //await prefs.setString('refresh_token', refreshToken);

        Endpoints.api_token = accessToken;
        // Endpoints.refreshToken = refreshToken;
      } else {
        throw Exception('Failed to login');
      }
    } catch (errMsg) {
      throw Exception("login fail : $errMsg");
    }
  }

  /* @override
  Future<void> logOut() async {
    print('before logout');
    try {
      final prefs = await PrefsService.getInstance();
      await prefs.remove(PrefsServiceKeys.accessTokem);
      Endpoints.api_token = '';
      print('token after logout  : ${Endpoints.api_token}');
    } catch (errMsg) {
      print(errMsg);
      throw Exception("Unable to log-out $errMsg");
    }
    throw UnimplementedError();
  }*/
}
