import 'package:auth_nav/auth_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/data/blocs/auth/auth_bloc.dart';
import 'package:flutter_application/data/blocs/basket_bloc/basket_bloc.dart';
import 'package:flutter_application/data/blocs/home/home_bloc.dart';
import 'package:flutter_application/initialize_dependencies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'application.dart';
import 'data/blocs/favorite/favorite_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);

  await initializeDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider.value(value: GetIt.instance.get<AuthNavigationBloc>()),
      BlocProvider.value(value: GetIt.instance.get<AuthBloc>()),
      BlocProvider.value(value: GetIt.instance.get<HomeBloc>()),
      BlocProvider.value(value: GetIt.instance.get<BasketBloc>()),
      BlocProvider.value(value: GetIt.instance.get<FavoriteBloc>()),
    ],
    child: const Application(),
  ));
}
