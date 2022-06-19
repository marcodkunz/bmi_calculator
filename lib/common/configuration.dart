import 'dart:ui';

import 'package:bmi_calculator/common/constants.dart';

class Configuration {
  Locale currentLocale = Constants.defaultLanguage;
  Envi? environment = Envi.development;
  String databaseFile;
  int databaseVersion;

  Configuration({
    this.environment,
    required this.databaseFile,
    required this.databaseVersion,
  });
}

enum Envi { development, production }
