import 'dart:ui';

import 'package:bmi_calculator/common/constants.dart';

class Configuration {
  Locale currentLocale = Constants.defaultLanguage;
  Envi? environment = Envi.development;

  Configuration({
    this.environment,
  });
}

enum Envi { development, production }
