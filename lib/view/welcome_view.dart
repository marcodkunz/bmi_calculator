import 'package:bmi_calculator/style/text_styles.dart';
import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/welcome_view_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@injectable
class WelcomeView extends StatelessWidget {
  final WelcomeViewModel viewModel;

  const WelcomeView(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ViewBase<WelcomeViewModel?>(
            viewModel: viewModel,
            builder: (context, model, child) {
              return Center(
                child: TextButton(
                  child: Text(AppLocalizations.of(context)!.welcomeContinue, style: TextStyles.BodyMediumBlack,),
                  onPressed: model?.onSubmit,
                ),
              );
            }),
      ),
    );
  }
}
