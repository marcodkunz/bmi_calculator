import 'package:bmi_calculator/style/color_styles.dart';
import 'package:bmi_calculator/style/text_styles.dart';
import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeView extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeView(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ViewBase<HomeViewModel?>(
          viewModel: viewModel,
          builder: (context, model, child) {
            var _cardHeight = MediaQuery.of(context).size.height / 5;
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      "BMI calculator",
                      style: TextStyles.TitleMediumWhite,
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
                            onTap: model?.onInfoPressed,
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
                            onTap: model?.onHistoryPressed,
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
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
                  child: InkWell(
                    onTap: model?.onInputPressed,
                    child: SizedBox(
                      height: _cardHeight,
                      child: Card(
                        color: ColorStyles.petrol,
                        child: Center(
                          child: Text(
                            "New calculation",
                            style: TextStyles.BodyMediumWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
