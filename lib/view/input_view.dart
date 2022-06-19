import 'package:bmi_calculator/style/text_styles.dart';
import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/input_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

@injectable
class InputView extends StatelessWidget {
  final InputViewModel viewModel;

  const InputView(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ViewBase<InputViewModel?>(
            viewModel: viewModel,
            builder: (context, model, child) {
              return Center(
                child: TextButton(
                  child: Text(
                    AppLocalizations.of(context)!.welcomeContinue,
                    style: TextStyles.BodyMediumBlack,
                  ),
                  onPressed: model?.onSubmit,
                ),
              );
            }),
      ),
    );
  }
}