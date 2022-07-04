import 'package:bmi_calculator/extension/bmi_range_category_extension.dart';
import 'package:bmi_calculator/model/user_entry.dart';
import 'package:bmi_calculator/style/color_styles.dart';
import 'package:bmi_calculator/style/text_styles.dart';
import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:bmi_calculator/viewmodel/result_view_model.dart';
import 'package:bmi_calculator/widget/custom_button.dart';
import 'package:bmi_calculator/widget/custom_drawer.dart';
import 'package:bmi_calculator/widget/custom_listview_result.dart';
import 'package:bmi_calculator/widget/indeterminate_progressindicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResultView extends StatelessWidget {
  final ResultViewModel viewModel;

  const ResultView(this.viewModel);

  @override
  Widget build(BuildContext context) {
    final userEntry = ModalRoute.of(context)!.settings.arguments as UserEntry?;
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.resultTitle)),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: ViewBase<ResultViewModel?>(
            viewModel: viewModel,
            onReady: (_) => viewModel.onReady(userEntry),
            builder: (context, model, child) {
              if (model == null || model.state is LoadingState) {
                return Center(
                  child: IndeterminateProgressIndicator(),
                );
              }
              if (model.state is ErrorState) {
                return Center(
                  child: Text(AppLocalizations.of(context)!.genericError),
                );
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          AppLocalizations.of(context)!.resultLabelBmi +
                              (model.currentEntry?.bmi.toString() ?? ''),
                          style: TextStyles.TitleMediumWhite),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(model.currentCategory.translate(context)),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomResultView(
                          title: AppLocalizations.of(context)!.resultLabelAge,
                          value: model.currentEntry?.age.toString() ??
                              '' +
                                  AppLocalizations.of(context)!
                                      .resultLabelAgeSuffix),
                      CustomResultView(
                          title:
                              AppLocalizations.of(context)!.resultLabelHeight,
                          value: model.currentEntry?.height.toString() ??
                              '' +
                                  AppLocalizations.of(context)!
                                      .resultLabelHeightSuffix),
                      CustomResultView(
                          title:
                              AppLocalizations.of(context)!.resultLabelWeight,
                          value: model.currentEntry?.weight.toString() ??
                              '' +
                                  AppLocalizations.of(context)!
                                      .resultLabelWeightSuffix),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                              cursorColor: ColorStyles.white,
                              textAlign: TextAlign.center,
                              style: TextStyles.mediumWhite,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!
                                      .resultNamePlaceholder),
                              onChanged: model.onNameChanged),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15, right: 25, top: 20, bottom: 30),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: CustomButton(
                              text: AppLocalizations.of(context)!.resultSave,
                              onClick: model.isValid ? model.onSave : null),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
