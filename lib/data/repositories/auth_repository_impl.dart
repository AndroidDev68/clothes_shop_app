import 'package:flutter_application/data/data.dart';
import 'package:flutter_application/data/datasources/remote/auth_api_service.dart';
import 'package:flutter_application/data/dto/dto.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase/supabase.dart';

import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthApiService authApiService = AuthApiService();

  @override
  Future<AuthenticationDto> login(String userName, String passWord) {
    return authApiService.login(userName, passWord);
  }

  @override
  Future logout() {
    GetIt.instance.get<LocalService>().clear();
    return authApiService.logout();
  }

  @override
  Future<ProfileDto> profile() {
    return authApiService.profile();
  }

  @override
  Future<GotrueSessionResponse>  register(String email, String password) async {
    return authApiService.register(email, password);
  }
}
