import 'package:bmi_calculator/style/text_styles.dart';
import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/home_view_model.dart';
import 'package:bmi_calculator/widget/rounded_card.dart';
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
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
                  child: RoundedCard(
                    onPressed: model?.onInputPressed,
                    height: _cardHeight,
                    child: Text(
                      "New calculation",
                      style: TextStyles.BodyMediumWhite,
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
