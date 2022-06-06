import 'package:bmi_calculator/service/logging/logger.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class INavigationService {
  GlobalKey<NavigatorState>? get globalNavigator;

  void pop([Object? result]);

  bool get canPop;

  Future<T?> pushNamed<T>(String route, {dynamic arguments});

  Future pushAndRemoveUntil(String route, String until, {dynamic arguments});

  Future pushNamedAndRemoveUntil(String route, {dynamic arguments});

  void popUntil(String route);
}

@Singleton(as: INavigationService)
class NavigationService implements INavigationService {
  final GlobalKey<NavigatorState> navigationKey;
  final ILogger _logger;

  NavigationService(this._logger, this.navigationKey);

  @override
  GlobalKey<NavigatorState>? get globalNavigator => navigationKey;

  @override
  void pop([Object? result]) {
    _logger.d('NavigationService', 'pop()');

    globalNavigator!.currentState!.pop(result);
  }

  @override
  bool get canPop => globalNavigator!.currentState!.canPop();

  @override
  Future<T?> pushNamed<T>(String route, {dynamic arguments}) {
    _logger.d('NavigationService', 'pushNamed() with route = $route');
    return globalNavigator!.currentState!
        .pushNamed(route, arguments: arguments);
  }

  @override
  void popUntil(String route) {
    _logger.d('NavigationService', 'popUntil() with route = $route');
    globalNavigator!.currentState!.popUntil(ModalRoute.withName(route));
  }

  @override
  Future pushAndRemoveUntil(String route, String until, {dynamic arguments}) {
    _logger.d('NavigationService', 'pushAndRemoveUntil() with route = $route');
    return globalNavigator!.currentState!.pushNamedAndRemoveUntil(
        route, (route) => route.settings.name == until,
        arguments: arguments);
  }

  @override
  Future pushNamedAndRemoveUntil(String route, {arguments}) {
    _logger.d(
        'NavigationService', 'pushNamedAndRemoveUntil() with route = $route');
    return globalNavigator!.currentState!
        .pushNamedAndRemoveUntil(route, (r) => false, arguments: arguments);
  }
}
