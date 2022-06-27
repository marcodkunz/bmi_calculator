import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/result_view_model.dart';
import 'package:bmi_calculator/widget/indeterminate_progressindicator.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../model/user_entry.dart';
import '../style/color_styles.dart';
import '../style/text_styles.dart';
import '../viewmodel/base/view_model_base.dart';
import '../widget/custom_button.dart';
import '../widget/custom_drawer.dart';
import '../widget/custom_listview_result.dart';

@injectable
class ResultView extends StatelessWidget {
  final ResultViewModel viewModel;

  const ResultView(this.viewModel);

  @override
  Widget build(BuildContext context) {
    final userEntry = ModalRoute.of(context)!.settings.arguments as UserEntry;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorStyles.darkPetrol,
          title: Text("Body Mass Index")),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: ViewBase<ResultViewModel?>(
            viewModel: viewModel,
            onReady: (_) => viewModel.onReady(userEntry),
            builder: (context, model, child) {
              if (model?.state is LoadingState) {
                return Center(
                  child: IndeterminateProgressIndicator(),
                );
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Your BMI: ' + userEntry.bmi.toString(),
                          style: TextStyles.TitleMediumWhite),
                      SizedBox(
                        height: 10,
                      ),
                      Text(model?.currentCategory ?? ""),
                      SizedBox(
                        height: 20,
                      ),
                      CustomResultView(
                          title: 'Age:',
                          value: userEntry.age.toString() + ' years'),
                      CustomResultView(
                          title: 'Height:',
                          value: userEntry.height.toString() + ' cm'),
                      CustomResultView(
                          title: 'Weight:',
                          value: userEntry.weight.toString() + ' kg'),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                              cursorColor: ColorStyles.white,
                              textAlign: TextAlign.center,
                              style: TextStyles.mediumWhite,
                              textInputAction: TextInputAction.done,
                              decoration:
                                  InputDecoration(hintText: 'Enter your Name'),
                              onChanged: model?.onNameChanged),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15, right: 25, top: 20, bottom: 30),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: CustomButton(
                              text: 'Save', onClick: () => model?.onSave()),
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
