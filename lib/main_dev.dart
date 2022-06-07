import 'dart:async';

import 'package:bmi_calculator/app_container.dart';
import 'package:bmi_calculator/bmi_app.dart';
import 'package:bmi_calculator/service/logging/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureInjection(Environment.dev);

  var app = getIt.get<BmiApp>();
  var logger = getIt.get<ILogger>();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent)); // TODO define color
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runZonedGuarded(() => runApp(app), (Object error, StackTrace stackTrace) {
      try {
        logger.error('Application', error, stackTrace);
      } catch (e) {
        logger.e('Application',
            'Logging Application Error failed: $e , Error: $error');
      }
    });
  });
}
