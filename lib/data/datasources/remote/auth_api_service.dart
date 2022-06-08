import 'package:flutter_application/data/datasources/remote/base_api_service.dart';
import 'package:flutter_application/data/dto/dto.dart';
import 'package:supabase/supabase.dart';

class AuthApiService extends BaseApiService {
  Future<AuthenticationDto> login(String userName, String passWord) async {
    return AuthenticationDto('abc', 'def');
  }

  Future<ProfileDto> profile() async {
    return ProfileDto('abc');
  }

  Future logout() async {}

  Future<GotrueSessionResponse> register(String email, String password) async {
    return await suPaBaseClient.auth.signUp(email, password);
  }
}
