import 'package:auth_nav/auth_nav.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application/data/blocs/auth/auth_bloc.dart';
import 'package:flutter_application/data/blocs/basket_bloc/basket_bloc.dart';
import 'package:flutter_application/data/blocs/favorite/favorite_bloc.dart';
import 'package:flutter_application/data/datasources/local/local_service.dart';
import 'package:flutter_application/data/repositories/basket_repository_impl.dart';
import 'package:flutter_application/data/repositories/favorite_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:oauth2_dio/oauth2_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/blocs/home/home_bloc.dart';
import 'data/dto/dto.dart';
import 'data/repositories/home_repository_impl.dart';
import 'data/repositories/repositories.dart';
import 'env.dart';

Future initializeDependencies() async {
  Dio dio = Dio(BaseOptions(baseUrl: baseURL));
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  GetIt.instance.registerSingleton(dio);

  GetIt.instance.registerSingleton(AuthRepository());

  //region Local Service
  GetIt.instance.registerSingleton(await SharedPreferences.getInstance());

  GetIt.instance.registerSingleton(LocalService());
  //endregion

  //region OAuth Manager
  Oauth2Manager<AuthenticationDto> _oauth2manager = Oauth2Manager<
          AuthenticationDto>(
      currentValue: GetIt.instance.get<LocalService>().getAuthenticationDto(),
      onSave: (value) {
        GetIt.instance.get<LocalService>().saveAuth(value as AuthenticationDto);
      });

  GetIt.instance
      .registerSingleton<Oauth2Manager<AuthenticationDto>>(_oauth2manager);

  dio.interceptors.add(
    Oauth2Interceptor(
      dio: GetIt.instance.get<Dio>(),
      oauth2Dio: Dio(BaseOptions(baseUrl: dio.options.baseUrl)),
      pathRefreshToken: 'auth/refresh-token',
      parserJson: (json) {
        return AuthenticationDto.fromJson(json as Map<String, dynamic>);
      },
      tokenProvider: _oauth2manager,
    ),
  );
  //endregion

  GetIt.instance.registerSingleton(AuthNavigationBloc());

  GetIt.instance.registerSingleton(AuthBloc());

  GetIt.instance.registerSingleton(BasketBloc());

  GetIt.instance.registerSingleton(FavoriteBloc());

  GetIt.instance.registerSingleton(HomeRepositoryImpl());

  GetIt.instance.registerSingleton(FavoriteRepositoryImpl());

  GetIt.instance.registerSingleton(BasketRepositoryImpl());

  GetIt.instance.registerSingleton(HomeBloc());




}
