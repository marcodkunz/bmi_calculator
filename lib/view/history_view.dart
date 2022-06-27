import 'package:bmi_calculator/extension/gender_extension.dart';
import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:bmi_calculator/viewmodel/history_view_model.dart';
import 'package:bmi_calculator/widget/indeterminate_progressindicator.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../style/color_styles.dart';
import '../widget/custom_drawer.dart';

@injectable
class HistoryView extends StatelessWidget {
  final HistoryViewModel viewModel;

  const HistoryView(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorStyles.darkPetrol,
          title: Text('Body Mass Index')),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: ViewBase<HistoryViewModel?>(
          viewModel: viewModel,
          builder: (context, model, child) {
            if (model?.state is LoadingState || model == null) {
              return Center(
                child: IndeterminateProgressIndicator(),
              );
            }
            return Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(),
                              child: Text('Name'),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(),
                              child: Text('BMI'),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(),
                              child: Text('Age'),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(),
                              child: Text('Gender'),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(),
                              child: Text('Delete'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: model.userEntries.length,
                  padding: EdgeInsets.all(4),
                  itemBuilder: (BuildContext context, int index) {
                    var entry = model.userEntries[index];
                    return Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(),
                              child: Text(entry.name ?? ""),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(),
                              child: Text(entry.bmi.toString()),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(),
                              child: Text(
                                entry.age.toString(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(entry.gender.toIcon())),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              alignment: Alignment.centerLeft,
                              onPressed: () => model.onDelete(entry.id),
                              icon: Icon(Icons.delete_outline),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 1,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
