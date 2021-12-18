import 'package:auth_nav/auth_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/data/blocs/auth/auth_bloc.dart';
import 'package:flutter_application/data/datasources/local/local_service.dart';
import 'package:flutter_application/pages/authentication/authentication_navigator.dart';
import 'package:flutter_application/pages/intro/intro_page.dart';
import 'package:flutter_application/pages/main/main_navigator.dart';
import 'package:flutter_application/pages/splash/app_splash_page.dart';
import 'package:get_it/get_it.dart';
import 'themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: light(context),
      darkTheme: dark(context),
      home: AuthNavigation(
        //Flow after user login success this page need user NavigatorSupport
        authorizedBuilder: (context) => const MainNavigator(),

        //Flow after user login success
        splashScreen: AppSplashPage((context) async {

          if(!GetIt.instance.get<LocalService>().isShowIntroPage()){
            return AuthNavigationState.maintenance();
          }else{
            if (GetIt.instance.get<LocalService>().isAuthorized()) {
              await GetIt.instance.get<AuthBloc>().initializeApp();
              return AuthNavigationState.authorized();
            } else {
              return AuthNavigationState.unAuthorized();
            }
          }
        }),

        //Flow user login success this page need user NavigatorSupport
        unAuthorizedBuilder: (context) => const AuthenticationNavigator(),

        //Customize if application is have this feature!!
        maintenanceBuilder: (context) => IntroPage(() async {
          await GetIt.instance.get<LocalService>().saveShowIntroPage(true);
          if (GetIt.instance.get<LocalService>().isAuthorized()) {
            await GetIt.instance.get<AuthBloc>().initializeApp();
            context.read<AuthNavigationBloc>().emit(AuthNavigationState.authorized());
          } else {
            context.read<AuthNavigationBloc>().emit(AuthNavigationState.unAuthorized());
          }
        }),
      ),
    );
  }
}
