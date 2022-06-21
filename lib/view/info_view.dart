import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/info_view_model.dart';
import 'package:bmi_calculator/widget/custom_listview.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class InfoView extends StatelessWidget {
  final InfoViewModel viewModel;
  const InfoView(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ViewBase<InfoViewModel?>(
            viewModel: viewModel,
            builder: (context, model, child) {
              return ListViewBuilder();
            }),
      ),
    );
  }
}
