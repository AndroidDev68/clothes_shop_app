import 'package:supabase/supabase.dart';

import '../../data/dto/authentication_dto.dart';
import '../../data/dto/profile_dto.dart';

abstract class AuthRepository {
  Future<AuthenticationDto> login(String userName, String passWord);

  Future<GotrueSessionResponse> register(String email, String password);

  Future logout();

  Future<ProfileDto> profile();
}
