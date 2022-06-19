import 'package:bmi_calculator/common/configuration.dart';
import 'package:bmi_calculator/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @Environment(Environment.dev)
  @Environment(Environment.test)
  Configuration configuration() => Configuration(
      environment: Envi.development,
      databaseFile: Constants.devDatabaseFile,
      databaseVersion: Constants.devDatabaseVersion);

  @Environment(Environment.prod)
  Configuration configurationProd() => Configuration(
      environment: Envi.production,
      databaseFile: Constants.prodDatabaseFile,
      databaseVersion: Constants.prodDatabaseVersion);

  GlobalKey<NavigatorState> navigationKey() => GlobalKey<NavigatorState>();
}
