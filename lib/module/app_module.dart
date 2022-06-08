import 'package:bmi_calculator/common/configuration.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @Environment(Environment.dev)
  @Environment(Environment.test)
  Configuration configuration() => Configuration(environment: Envi.development);

  @Environment(Environment.prod)
  Configuration configurationProd() =>
      Configuration(environment: Envi.production);

  GlobalKey<NavigatorState> navigationKey() => GlobalKey<NavigatorState>();
}
