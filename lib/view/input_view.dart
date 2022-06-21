import 'package:bmi_calculator/style/text_styles.dart';
import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/input_view_model.dart';
import 'package:bmi_calculator/widget/slider.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../style/color_styles.dart';

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
                            child: InkWell(
                              child: Card(
                                color: ColorStyles.petrol,
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: SizedBox(
                                    height: _cardHeight,
                                    child: Center(
                                      child: Image.asset(
                                        'lib/assets/images/female.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 20),
                            child: InkWell(
                              child: Card(
                                color: ColorStyles.petrol,
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: SizedBox(
                                    height: _cardHeight,
                                    child: Center(
                                      child: Image.asset(
                                        'lib/assets/images/male.png',
                                      ),
                                    ),
                                  ),
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
                        left: 20, top: 10, right: 20, bottom: 20),
                    child: InkWell(
                      child: SizedBox(
                        height: _cardHeight,
                        child: Card(
                          color: ColorStyles.petrol,
                          child: Center(
                            child : SliderHeight(),
                          ),
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
                            child: InkWell(
                              child: Card(
                                color: ColorStyles.petrol,
                                child: SizedBox(
                                  height: _cardHeight,
                                  child: Center(
                                    child: Text(
                                      "Info",
                                      style: TextStyles.BodyMediumWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 20),
                            child: InkWell(
                              child: Card(
                                color: ColorStyles.petrol,
                                child: SizedBox(
                                  height: _cardHeight,
                                  child: Center(
                                    child: Text(
                                      "History",
                                      style: TextStyles.BodyMediumWhite,
                                    ),
                                  ),
                                ),
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
