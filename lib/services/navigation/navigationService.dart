import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // GlobalKey<NavigatorState> get navigatorKey => navigatorKey;

  BuildContext get activeContext => navigatorKey.currentState!.context;

  Future<T?> push<T extends Object>(Route<T> route) {
    return navigatorKey.currentState!.push(route);
  }

  Future<dynamic?> pushNamed<T extends Object>(String routeName,
      {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  void pop<T extends Object>([T? result]) {
    return navigatorKey.currentState?.pop(result);
  }

  Future displayDialog<T>(Widget dialog, {bool barrierDismissible = true}) {
    return showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      barrierDismissible: barrierDismissible,
      builder: (context) => dialog,
    );
  }

  Future<void> displayBottomSheet<T>(
    Widget dialog, {
    bool barrierDismissible = true,
    bool enableDrag = false,
  }) {
    return showModalBottomSheet<void>(
        backgroundColor: Colors.blue,
        enableDrag: enableDrag,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        context: navigatorKey.currentState!.overlay!.context,
        isScrollControlled: true,
        builder: (context) => dialog);
  }

  Future<dynamic?> pushReplacementNamed<T extends Object, TO extends Object>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  void popUntil(bool Function(Route<dynamic>) predicate) {
    return navigatorKey.currentState?.popUntil(predicate);
  }

  Future<Object?> pushNamedAndRemoveUntil<T extends Object>(
      String newRouteName, bool Function(Route<dynamic>) predicate,
      {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
      String message) {
    return ScaffoldMessenger.of(navigatorKey.currentState!.overlay!.context)
        .showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}