import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';

import 'test_widget_app.mocks.dart';

@GenerateMocks([],
    customMocks: [MockSpec<NavigatorObserver>(returnNullOnMissingStub: true)])
class WidgetTestApp {
  final MockNavigatorObserver _navigationObserverMock = MockNavigatorObserver();

  MockNavigatorObserver get navigatorObserverMock => _navigationObserverMock;

  Widget createTestApp(Widget widgetUnderTest) {
    return MaterialApp(
      home: widgetUnderTest,
      supportedLocales: const [
        Locale('de'),
      ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      navigatorObservers: [_navigationObserverMock],
      onGenerateRoute: _getPageRoute,
    );
  }

  MaterialPageRoute _createRoute(
      RouteSettings settings, Widget builder, bool fullscreenDialog) {
    return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => builder,
        fullscreenDialog: fullscreenDialog);
  }

  Route _getPageRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return _createRoute(settings, createDefaultScaffold(), false);
    }
  }

  Widget createDefaultScaffold() {
    return const Scaffold();
  }
}
