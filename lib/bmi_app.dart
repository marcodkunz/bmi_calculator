import 'package:bmi_calculator/app_container.dart';
import 'package:bmi_calculator/common/configuration.dart';
import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/service/logging/logger.dart';
import 'package:bmi_calculator/service/navigation/navigation_service.dart';
import 'package:bmi_calculator/view/start_screen.dart';
import 'package:bmi_calculator/view/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@injectable
class BmiApp extends StatefulWidget {
  final INavigationService navigationService;
  final ILogger logger;
  final Configuration configuration;

  BmiApp(this.navigationService, this.logger, this.configuration);

  @override
  _BmiAppState createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  Route _getPageRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startScreen:
        return _createRoute(settings, const StartScreen(), false);
      case Routes.welcomeView:
        return _createRoute(settings, getIt<WelcomeView>(), false);
      default:
        return _createRoute(
            settings,
            const Scaffold(
              body: Center(child: Text('Route not Found')),
            ),
            false);
    }
  }

  MaterialPageRoute _createRoute(
      RouteSettings settings, Widget builder, bool modalDialog) {
    return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => builder,
        fullscreenDialog: modalDialog);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI",
      debugShowCheckedModeBanner:
          widget.configuration.environment == Envi.development,
      initialRoute: Routes.welcomeView,
      onGenerateRoute: _getPageRoute,
      navigatorKey: widget.navigationService.globalNavigator,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
