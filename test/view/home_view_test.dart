import 'package:bmi_calculator/view/home_view.dart';
import 'package:bmi_calculator/widget/custom_drawer.dart';
import 'package:bmi_calculator/widget/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helper/mock_implementations.mocks.dart';
import '../helper/test_widget_app.dart';

void main() {
  late MockHomeViewModel _viewModel;
  late Widget _view;

  setUp(() {
    _viewModel = MockHomeViewModel();
    _view = WidgetTestApp().createTestApp(HomeView(_viewModel));
  });

  testWidgets('build test', (tester) async {
    await tester.pumpWidget(_view);

    expect(
        find.widgetWithIcon(RoundedCard, Icons.info_outline), findsOneWidget);
    expect(find.widgetWithIcon(RoundedCard, Icons.person), findsOneWidget);
    expect(find.text('Calculate'), findsOneWidget);
  });

  testWidgets('onInfoPressed', (tester) async {
    when(_viewModel.onInfoPressed()).thenAnswer((_) => Future.value());
    await tester.pumpWidget(_view);

    await tester.tap(
        find.widgetWithIcon(RoundedCard, Icons.info_outline));

    verify(_viewModel.onInfoPressed());
  });

  testWidgets('onHistoryPressed', (tester) async {
    when(_viewModel.onHistoryPressed()).thenAnswer((_) => Future.value());
    await tester.pumpWidget(_view);

    await tester.tap(
        find.widgetWithIcon(RoundedCard, Icons.person));

    verify(_viewModel.onHistoryPressed());
  });

  testWidgets('onInputPressed', (tester) async {
    when(_viewModel.onInputPressed()).thenAnswer((_) => Future.value());
    await tester.pumpWidget(_view);

    await tester.tap(
        find.text('Calculate'));

    verify(_viewModel.onInputPressed());
  });

  testWidgets('drawer', (tester) async {
    await tester.pumpWidget(_view);

    await tester.dragFrom(tester.getTopLeft(find.byType(MaterialApp)), Offset(300, 0));
    await tester.pumpAndSettle();

    expect(find.byType(CustomDrawer), findsOneWidget);
  });
}
