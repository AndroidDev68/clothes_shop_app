import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/pages/authentication/select_option_page.dart';
import 'package:flutter_application/pages/authentication/signin/sign_in_page.dart';
import 'package:flutter_application/pages/authentication/signup/signup_page.dart';
import 'package:flutter_application/utils/navigator_support.dart';

class AuthenticationNavigator extends StatefulWidget {
  const AuthenticationNavigator({Key? key}) : super(key: key);

  @override
  _AuthenticationNavigatorState createState() =>
      _AuthenticationNavigatorState();
}

class _AuthenticationNavigatorState extends State<AuthenticationNavigator> {
  @override
  Widget build(BuildContext context) {
    return NavigatorSupport(
      initialRoute: SelectOptionPage.ROUTE_NAME,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case SelectOptionPage.ROUTE_NAME:
            return MaterialPageRoute(
                builder: (context) => const SelectOptionPage(),
                settings:
                    const RouteSettings(name: SelectOptionPage.ROUTE_NAME));
          case SignInPage.ROUTE_NAME:
            return MaterialPageRoute(
              builder: (context) => const SignInPage(),
              settings: const RouteSettings(name: SignupPage.ROUTE_NAME),
            );
          case SignupPage.ROUTE_NAME:
            return MaterialPageRoute(
              builder: (context) => const SignupPage(),
              settings: const RouteSettings(name: SignupPage.ROUTE_NAME),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const SelectOptionPage(),
              settings: const RouteSettings(name: SelectOptionPage.ROUTE_NAME),
            );
        }
      },
    );
  }
}
