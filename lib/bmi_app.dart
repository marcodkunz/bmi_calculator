import 'package:bmi_calculator/app_container.dart';
import 'package:bmi_calculator/common/configuration.dart';
import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/service/logging/logger.dart';
import 'package:bmi_calculator/service/navigation/navigation_service.dart';
import 'package:bmi_calculator/style/themes.dart';
import 'package:bmi_calculator/view/history_view.dart';
import 'package:bmi_calculator/view/home_view.dart';
import 'package:bmi_calculator/view/info_view.dart';
import 'package:bmi_calculator/view/input_view.dart';
import 'package:bmi_calculator/view/result_view.dart';
import 'package:bmi_calculator/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

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
      case Routes.splashView:
        return _createRoute(settings, getIt<SplashView>(), false);
      case Routes.homeView:
        return _createRoute(settings, getIt<HomeView>(), false);
      case Routes.inputView:
        return _createRoute(settings, getIt<InputView>(), false);
      case Routes.historyView:
        return _createRoute(settings, getIt<HistoryView>(), false);
      case Routes.infoView:
        return _createRoute(settings, getIt<InfoView>(), false);
      case Routes.resultView:
        return _createRoute(settings, getIt<ResultView>(), false);
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
      theme: Themes.dark,
      debugShowCheckedModeBanner:
          widget.configuration.environment == Envi.development,
      initialRoute: Routes.splashView,
      onGenerateRoute: _getPageRoute,
      navigatorKey: widget.navigationService.globalNavigator,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
