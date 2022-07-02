import 'package:bmi_calculator/view/history_view.dart';
import 'package:bmi_calculator/viewmodel/base/failures.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:bmi_calculator/widget/indeterminate_progressindicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helper/default_user.dart';
import '../helper/mock_implementations.mocks.dart';
import '../helper/test_widget_app.dart';

void main() {
  late MockHistoryViewModel _viewModel;
  late Widget _view;

  setUp(() {
    _viewModel = MockHistoryViewModel();
    _view = WidgetTestApp().createTestApp(HistoryView(_viewModel));
  });

  group('build test', () {
    setUp(() {
      when(_viewModel.userEntries).thenReturn([]);
    });
    testWidgets('LoadingState', (tester) async {
      when(_viewModel.state).thenReturn(LoadingState());

      await tester.pumpWidget(_view);

      expect(find.byType(IndeterminateProgressIndicator), findsOneWidget);
      verify(_viewModel.init());
    });
    testWidgets('EmptyState', (tester) async {
      when(_viewModel.state).thenReturn(EmptyState());

      await tester.pumpWidget(_view);

      expect(find.text('No entries yet'), findsOneWidget);
      verify(_viewModel.init());
    });
    testWidgets('ErrorState', (tester) async {
      when(_viewModel.state).thenReturn(ErrorState(EmptyFailure()));

      await tester.pumpWidget(_view);

      expect(find.text('Something went wrong'), findsOneWidget);
      verify(_viewModel.init());
    });
    testWidgets('LoadedState', (tester) async {
      var _user = defaultUser();
      _user.name = 'test';

      when(_viewModel.userEntries).thenReturn([_user]);
      when(_viewModel.state).thenReturn(LoadedState());

      await tester.pumpWidget(_view);

      expect(find.text('History'), findsOneWidget);

      expect(find.text('Name'), findsOneWidget);
      expect(find.text('test'), findsOneWidget);

      expect(find.text('BMI'), findsOneWidget);
      expect(find.text('27.68'), findsOneWidget);

      expect(find.text('Age'), findsOneWidget);
      expect(find.text('25'), findsOneWidget);

      expect(find.text('Gender'), findsOneWidget);

      expect(find.text('Delete'), findsOneWidget);
      verify(_viewModel.init());
    });
  });

  testWidgets('delete item', (tester) async {
    when(_viewModel.userEntries).thenReturn([storedUser()]);
    when(_viewModel.state).thenReturn(LoadedState());

    await tester.pumpWidget(_view);

    expect(_viewModel.userEntries.length, 1);
    verify(_viewModel.init());

    await tester.tap(find.widgetWithIcon(IconButton, Icons.delete_outline));

    verify(_viewModel.onDelete(1));
  });
}
