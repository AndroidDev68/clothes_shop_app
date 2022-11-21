import 'package:supabase/supabase.dart';

import '../../data/dto/authentication_dto.dart';
import '../../data/dto/profile_dto.dart';

abstract class AuthRepository {
  Future<GotrueSessionResponse> login(String userName, String passWord);

  Future<GotrueSessionResponse> register(String email, String password, String userName);

  Future logout();

  Future<ProfileDto> profile();
}
