import 'package:bmi_calculator/routes.dart';
import 'package:bmi_calculator/start_screen.dart';
import 'package:flutter/material.dart';

class BmiApp extends StatefulWidget {
  const BmiApp({Key? key}) : super(key: key);

  @override
  _BmiAppState createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  Route _getPageRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startScreen:
        return _createRoute(settings, StartScreen(), false);
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
      title: 'BMI calculator',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startScreen,
      onGenerateRoute: _getPageRoute,
    );
  }
}
