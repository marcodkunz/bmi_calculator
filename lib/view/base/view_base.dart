import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef ViewBuilderFunction<T> = Widget Function(
    BuildContext context, T model, Widget? child);

typedef ViewInitFunction<T> = Function(T? model);

class ViewBase<T extends ViewModelBase?> extends StatefulWidget {
  final ViewBuilderFunction<T> builder;
  final ViewInitFunction? onReady;
  final T viewModel;

  ViewBase(
      {Key? key, required this.viewModel, required this.builder, this.onReady})
      : super(key: key) {
    assert(viewModel != null,
        'Model and Builder must be provided');
  }

  @override
  _ViewBaseState<T> createState() => _ViewBaseState<T>();
}

class _ViewBaseState<T extends ViewModelBase?> extends State<ViewBase<T>> {
  T? viewModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T?>.value(
      value: viewModel,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }

  @override
  void initState() {
    viewModel = widget.viewModel;
    if (widget.onReady != null) {
      widget.onReady!(viewModel);
    }
    viewModel!.init();

    super.initState();
  }

  @override
  void dispose() {
    viewModel?.teardown();
    super.dispose();
  }
}
