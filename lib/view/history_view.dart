import 'package:bmi_calculator/extension/gender_extension.dart';
import 'package:bmi_calculator/view/base/view_base.dart';
import 'package:bmi_calculator/viewmodel/base/view_model_base.dart';
import 'package:bmi_calculator/viewmodel/history_view_model.dart';
import 'package:bmi_calculator/widget/indeterminate_progressindicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

@injectable
class HistoryView extends StatelessWidget {
  final HistoryViewModel viewModel;

  const HistoryView(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ViewBase<HistoryViewModel?>(
            viewModel: viewModel,
            builder: (context, model, child) {
              if (model?.state is LoadingState || model == null) {
                return Center(
                  child: IndeterminateProgressIndicator(),
                );
              }
              return ListView.separated(
                itemCount: model.userEntries.length,
                padding: EdgeInsets.all(4),
                itemBuilder: (BuildContext context, int index) {
                  var entry = model.userEntries[index];
                  return Row(
                    children: [
                      Text(entry.bmi.toStringAsFixed(2)),
                      Text(entry.name),
                      Text(entry.age.toString()),
                      Icon(entry.gender.toIcon()),
                      IconButton(
                        onPressed: () => model.onDelete(entry.id),
                        icon: Icon(Icons.delete_outline),
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              );
            }),
      ),
    );
  }
}
