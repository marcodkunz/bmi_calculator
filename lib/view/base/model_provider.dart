import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ModelProvider<T extends ChangeNotifier?> extends StatelessWidget {
  final ViewBuilderFunction<T> builder;
  final T model;

  ModelProvider({Key? key, required this.model, required this.builder})
      : super(key: key) {
    assert(model != null, 'Model and Builder must be provided');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: builder,
      ),
    );
  }
}
