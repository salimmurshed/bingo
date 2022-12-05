import 'package:bingo_wholesale/presentation/ui/home_screen/home_screen_view.dart';
import 'package:bingo_wholesale/presentation/ui/splash_screen/splash_screen_view.dart';
import 'package:flutter/material.dart';

import '../presentation/ui/add_association_request_screen/add_association_request_screen_view.dart';
import '../presentation/ui/association_request_details_screen/association_request_details_screen_view.dart';
import '../presentation/ui/bottom_tabs/bottom_tabs_screen_view.dart';
import '../presentation/ui/login_screen/login_screen_view.dart';
import '../presentation/ui/sales_details_screen/sales_details_screen_view.dart';

abstract class Routes {
  static const startupView = '/';
  static const login = 'login';
  static const homeScreen = 'home_screen';
  static const dashboardScreen = 'bottom_tabs';
  static const addNewAssociationRequest = 'add_new_association_request';
  static const salesDetailsScreen = 'sales_details_screen';
  static const associationRequestDetailsScreen = 'association_request_details'
      '_screen';

  static const all = {
    startupView,
    login,
    homeScreen,
    addNewAssociationRequest,
    salesDetailsScreen,
    associationRequestDetailsScreen,
  };
}

class Router {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startupView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SplashScreenView(),
          settings: settings,
        );
      case Routes.login:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginScreenView(),
          settings: settings,
        );

      case Routes.homeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const HomeScreenView(),
          settings: settings,
        );

      case Routes.dashboardScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const BottomTabsScreenView(),
          settings: settings,
        );

      case Routes.addNewAssociationRequest:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AddAssociationRequestScreenView(),
          settings: settings,
        );

      case Routes.associationRequestDetailsScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AssociationRequestDetailsScreen(),
          settings: settings,
        );

      case Routes.salesDetailsScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SalesDetailsScreenView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("${settings.name} route does not exist"),
            ),
          ),
        );
    }
  }
}
