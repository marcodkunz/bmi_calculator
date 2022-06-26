import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/result_view_model.dart';
import 'package:bmi_calculator/widget/indeterminate_progressindicator.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../style/color_styles.dart';
import '../widget/custom_drawer.dart';

@injectable
class ResultView extends StatelessWidget {
  final ResultViewModel viewModel;

  const ResultView(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorStyles.darkPetrol,
          title: Text("Body Mass Index")),
      drawer: CustomDrawer(),
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