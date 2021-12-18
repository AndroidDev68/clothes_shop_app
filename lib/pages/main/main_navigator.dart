import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/pages/home/home_page.dart';
import 'package:flutter_application/pages/home/product_detail/product_detail_page.dart';
import 'package:flutter_application/utils/navigator_support.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    return NavigatorSupport(
      initialRoute: 'home_page',
      onGenerateRoute: (setting) {
        switch(setting.name){
          case HomePage.ROUTE_NAME:
            return MaterialPageRoute(builder: (context) => const HomePage());
          case ProductDetailPage.ROUTE_NAME:
            return MaterialPageRoute(builder: (context) => ProductDetailPage(setting.arguments as int));
          default:
            return MaterialPageRoute(builder: (context) => const HomePage());
        }

      },
    );
  }
}
