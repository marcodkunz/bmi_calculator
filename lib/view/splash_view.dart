import 'package:bmi_calculator/style/color_styles.dart';
import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashView extends StatelessWidget {
  final SplashViewModel viewModel;

  const SplashView(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ViewBase<SplashViewModel?>(
            viewModel: viewModel,
            builder: (context, model, child) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
