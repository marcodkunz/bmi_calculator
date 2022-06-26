import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/result_view_model.dart';
import 'package:bmi_calculator/widget/indeterminate_progressindicator.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResultView extends StatelessWidget {
  final ResultViewModel viewModel;

  const ResultView(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ViewBase<ResultViewModel?>(
            viewModel: viewModel,
            builder: (context, model, child) {
              return Center(
                child: IndeterminateProgressIndicator(),
              );
            }),
      ),
    );
  }
}