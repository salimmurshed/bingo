import 'package:bingo_wholesale/presentation/ui/add_credit_line_screen/add_credit_line_view.dart';
import 'package:bingo_wholesale/presentation/ui/add_sales/add_sales_view.dart';
import 'package:bingo_wholesale/presentation/ui/add_store_screen/add_store_screen_view.dart';
import 'package:bingo_wholesale/presentation/ui/home_screen/home_screen_view.dart';
import 'package:bingo_wholesale/presentation/ui/splash_screen/splash_screen_view.dart';
import 'package:bingo_wholesale/presentation/ui/view_credit_line_request_wholesaler/view_credit_line_request_wholesaler_view.dart';
import 'package:flutter/material.dart';

import '../presentation/ui/add_association_request_screen/add_association_request_screen_view.dart';
import '../presentation/ui/add_manage_account/add_manage_account_view.dart';
import '../presentation/ui/add_wholesaler_screen/add_wholesaler_view.dart';
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
  static const associationRequestDetailsScreen = 'association_request_details';
  static const addStoreView = 'add_store_view';
  static const addManageAccountView = 'add_manage_account_view';
  static const addCreditLineView = 'add_credit_line_view';
  static const addWholesalerView = 'add_wholesaler_view';
  static const viewCreditLineRequestWholesalerView = 'view_credit_line_request'
      '_wholesaler_view';
  static const addSales = 'add_sales';

  static const all = {
    startupView,
    login,
    homeScreen,
    addNewAssociationRequest,
    salesDetailsScreen,
    associationRequestDetailsScreen,
    addStoreView,
    addManageAccountView,
    addCreditLineView,
    addWholesalerView,
    viewCreditLineRequestWholesalerView,
    addSales,
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
          builder: (context) => AddAssociationRequestView(),
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

      case Routes.addStoreView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AddStoreView(),
          settings: settings,
        );

      case Routes.addManageAccountView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AddManageAccountView(),
          settings: settings,
        );

      case Routes.addCreditLineView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AddCreditLineView(),
          settings: settings,
        );

      case Routes.addWholesalerView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AddWholesalerView(),
          settings: settings,
        );

      case Routes.viewCreditLineRequestWholesalerView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ViewCreditLineRequestWholesalerView(),
          settings: settings,
        );

      case Routes.addSales:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AddSalesView(),
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
