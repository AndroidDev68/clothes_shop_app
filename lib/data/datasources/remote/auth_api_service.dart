import 'package:flutter_application/data/datasources/remote/base_api_service.dart';
import 'package:flutter_application/data/dto/dto.dart';
import 'package:supabase/supabase.dart';

class AuthApiService extends BaseApiService {
  Future<GotrueSessionResponse> login(String userName, String passWord) async {
    return await suPaBaseClient.auth
        .signIn(email: userName, password: passWord);
  }

  Future<ProfileDto> profile() async {
    return ProfileDto('abc');
  }

  Future logout() async {}

  Future<GotrueSessionResponse> register(
      String email, String password, String userName) async {
    return await suPaBaseClient.auth.signUp(
      email,
      password,
      userMetadata: {
        'data': {'name': userName},
      },
    );
  }
}
