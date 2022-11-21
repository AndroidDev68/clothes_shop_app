import 'dart:developer' as developer;

import 'package:auth_nav/auth_nav.dart';
import 'package:flutter_application/data/blocs/auth/auth_state.dart';
import 'package:flutter_application/data/dto/dto.dart';
import 'package:flutter_application/utils/handle_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:oauth2_dio/oauth2_dio.dart';
import 'package:supabase/supabase.dart';

import '../../../domain/repository/auth_repository.dart';

class AuthBloc extends Cubit<AuthState> with HandleError {
  final AuthNavigationBloc authNavigationBloc = GetIt.instance.get();

  final AuthRepository _authRepository = GetIt.instance.get();

  AuthBloc() : super(const AuthState.unAuthorized()) {
    GetIt.instance
        .get<Oauth2Manager<AuthenticationDto>>()
        .controller
        .stream
        .listen((event) {
      if (event != null) {
        authNavigationBloc.emit(AuthNavigationState.authorized());
      } else {
        authNavigationBloc.emit(AuthNavigationState.unAuthorized());
      }
    });
  }

  //Call on splash screen
  Future initializeApp() async {
    final profile = await _authRepository.profile();
    developer.log("value: initializeApp", name: 'tz');
    emit(AuthState.authorized(profile));
  }

  Future login(String username, String password) async {
    /* final GotrueSessionResponse response =
        await _authRepository.login(username, password);
    if (response.statusCode == 200) {
      final authDto = AuthenticationDto(
          response.data!.accessToken, response.data!.refreshToken!);
      GetIt.instance.get<Oauth2Manager<AuthenticationDto>>().add(authDto);
    } else {
      throw getError(response.error);
    }*/
    final auth = await _authRepository.login(username, password);
    final profile = await _authRepository.profile();
    GetIt.instance
        .get<Oauth2Manager<AuthenticationDto>>()
        .add(AuthenticationDto("accessToken", "refreshToken"));
  }

  Future logout() async {
    await _authRepository.logout();
    GetIt.instance.get<Oauth2Manager<AuthenticationDto>>().add(null);
  }

  Future<String> register(
      String email, String password, String userName) async {
    final response = await _authRepository.register(email, password, userName);
    if (response.statusCode == 200) {
      return "SignUp successfully! Now you can login to start";
    } else {
      throw getError(response.error);
    }
  }
}
