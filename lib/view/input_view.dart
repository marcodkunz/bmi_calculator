import 'package:bmi_calculator/style/text_styles.dart';
import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:bmi_calculator/viewmodel/input_view_model.dart';
import 'package:bmi_calculator/widget/custom_button.dart';
import 'package:bmi_calculator/widget/custom_drawer.dart';
import 'package:bmi_calculator/widget/custom_slider.dart';
import 'package:bmi_calculator/widget/custom_textformfield.dart';
import 'package:bmi_calculator/widget/rounded_card.dart';
import 'package:bmi_calculator/widget/translate_animation_widget.dart';
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
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.inputTitle)),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: ViewBase<InputViewModel?>(
            viewModel: viewModel,
            builder: (context, model, child) {
              if (model == null) return SizedBox.shrink();

              if (model.state is ErrorState) {
                return Center(
                  child: Text(AppLocalizations.of(context)!.genericError),
                );
              }

              var _cardHeight = MediaQuery.of(context).size.height / 5;

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, right: 10),
                                child: TranslateAnimationWidget(
                                  direction: AxisDirection.right,
                                  child: RoundedCard(
                                    onPressed: model.onFemaleSelected,
                                    height: _cardHeight,
                                    color: model.colorFemaleCard,
                                    child: Icon(
                                      Icons.female,
                                      size: 120,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 20),
                                child: TranslateAnimationWidget(
                                  direction: AxisDirection.left,
                                  child: RoundedCard(
                                    onPressed: model.onMaleSelected,
                                    height: _cardHeight,
                                    color: model.colorMaleCard,
                                    child: Icon(
                                      Icons.male,
                                      size: 120,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20, top: 10, right: 20, bottom: 10),
                        child: TranslateAnimationWidget(
                          direction: AxisDirection.right,
                          child: RoundedCard(
                            height: _cardHeight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .inputLabelHeight,
                                  style: TextStyles.BodyMediumWhite,
                                ),
                                Text(
                                  model.currentHeight.toInt().toString() +
                                      AppLocalizations.of(context)!
                                          .inputLabelHeightSuffix,
                                  style: TextStyles.TitleMediumWhite,
                                ),
                                CustomSlider(
                                  min: model.minHeight,
                                  max: model.maxHeight,
                                  initial: model.currentHeight,
                                  onChanged: model.onHeightChanged,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, right: 10),
                                child: TranslateAnimationWidget(
                                  direction: AxisDirection.right,
                                  child: RoundedCard(
                                    onPressed: model.onAgePressed,
                                    height: _cardHeight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!
                                              .inputLabelAge,
                                          style: TextStyles.BodyMediumWhite,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: CustomTextFormField(
                                              focusNode: model.ageFocusNode,
                                              suffix:
                                                  AppLocalizations.of(context)!
                                                      .inputSuffixAge,
                                              onChange: model.onAgeChanged,
                                              max: 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 20),
                                child: TranslateAnimationWidget(
                                  direction: AxisDirection.left,
                                  child: RoundedCard(
                                    onPressed: model.onWeightPressed,
                                    height: _cardHeight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!
                                              .inputLabelWeight,
                                          style: TextStyles.BodyMediumWhite,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: CustomTextFormField(
                                              focusNode: model.weightFocusNode,
                                              suffix:
                                                  AppLocalizations.of(context)!
                                                      .inputLabelWeightSuffix,
                                              onChange: model.onWeightChanged,
                                              max: 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 30, right: 30, bottom: 20, top: 20),
                        child: TranslateAnimationWidget(
                          direction: AxisDirection.up,
                          child: CustomButton(
                            text: AppLocalizations.of(context)!.inputCalculate,
                            onClick: model.isValid ? model.onCalculate : null,
                          ),
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
