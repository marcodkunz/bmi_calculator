import 'package:bmi_calculator/style/text_styles.dart';
import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/input_view_model.dart';
import 'package:bmi_calculator/widget/custom_slider.dart';
import 'package:bmi_calculator/widget/rounded_card.dart';
import 'package:flutter/material.dart';
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
              var _cardHeight = MediaQuery.of(context).size.height / 5;
              return Column(
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
                        left: 20, top: 10, right: 20, bottom: 20),
                    child: RoundedCard(
                      height: _cardHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              onPressed: model?.onInfoPressed,
                              height: _cardHeight,
                              child: Text(
                                "Info",
                                style: TextStyles.BodyMediumWhite,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 20),
                            child: RoundedCard(
                              onPressed: model?.onHistoryPressed,
                              height: _cardHeight,
                              child: Text(
                                "History",
                                style: TextStyles.BodyMediumWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
