import 'package:bmi_calculator/style/color_styles.dart';
import 'package:bmi_calculator/style/text_styles.dart';
import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/input_view_model.dart';
import 'package:bmi_calculator/widget/custom_drawer.dart';
import 'package:bmi_calculator/widget/custom_slider.dart';
import 'package:bmi_calculator/widget/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../widget/custom_button.dart';
import '../widget/custom_textformfield.dart';

@injectable
class InputView extends StatelessWidget {
  final InputViewModel viewModel;

  const InputView(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorStyles.darkPetrol,
          title: Text("Body Mass Index")),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: ViewBase<InputViewModel?>(
            viewModel: viewModel,
            builder: (context, model, child) {
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
                                child: RoundedCard(
                                  onPressed: model?.onFemaleSelected,
                                  height: _cardHeight,
                                  color: model?.colorFemaleCard,
                                  child: Icon(
                                    Icons.female,
                                    size: 120,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 20),
                                child: RoundedCard(
                                  onPressed: model?.onMaleSelected,
                                  height: _cardHeight,
                                  color: model?.colorMaleCard,
                                  child: Icon(
                                    Icons.male,
                                    size: 120,
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
                        child: RoundedCard(
                          height: _cardHeight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Height:",
                                style: TextStyles.BodyMediumWhite,
                              ),
                              Text(
                                "${model?.currentHeight.toInt()} cm",
                                style: TextStyles.TitleMediumWhite,
                              ),
                              CustomSlider(
                                min: 10,
                                max: 230,
                                initial: model?.currentHeight ?? 170,
                                onChanged: model?.onHeightChanged,
                              ),
                            ],
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
                              child: RoundedCard(
                                onPressed: () => {},
                                height: _cardHeight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Age:",
                                      style: TextStyles.BodyMediumWhite,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: CustomTextFormField(
                                            suffix: 'years',
                                            onChange: model?.onAgeChanged,
                                            max: 2)),
                                  ],
                                ),
                              ),
                            )),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 20),
                                child: RoundedCard(
                                  onPressed: () => {},
                                  height: _cardHeight,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Weight:",
                                        style: TextStyles.BodyMediumWhite,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: CustomTextFormField(
                                              suffix: 'kg',
                                              onChange: model?.onWeightChanged,
                                              max: 3)),
                                    ],
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
                        child: CustomButton(
                          text: 'Calculate',
                          onClick: () => model?.onCalculate(),
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
