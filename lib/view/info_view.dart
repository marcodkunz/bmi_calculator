import 'package:bmi_calculator/extension/bmi_range_category_extension.dart';
import 'package:bmi_calculator/model/bmi_range.dart';
import 'package:bmi_calculator/widget/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

@injectable
class InfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.infoTitle)),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (width / 3) - 20,
                        child: Text(
                            AppLocalizations.of(context)!.customListviewRange,
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        width: (width / 3 * 2) - 20,
                        child: Text(
                          AppLocalizations.of(context)!
                              .customListviewDescription,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(thickness: 1.5),
            ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: bmiRange.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (width / 3) - 20,
                        child: Text(
                          bmiRange.elementAt(index).startValue.toString() +
                              ' - ' +
                              bmiRange.elementAt(index).endValue.toString(),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        width: (width / 3 * 2) - 20,
                        child: Text(
                          bmiRange.elementAt(index).category.translate(context),
                          textAlign: TextAlign.left,
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
        ),
      ),
    );
  }
}
