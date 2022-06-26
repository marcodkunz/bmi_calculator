import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/info_view_model.dart';
import 'package:bmi_calculator/widget/custom_listview.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../style/color_styles.dart';
import '../widget/custom_drawer.dart';

@injectable
class InfoView extends StatelessWidget {
  final InfoViewModel viewModel;
  const InfoView(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorStyles.darkPetrol,
          title: Text("Body Mass Index")),
      drawer: CustomDrawer(),
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
