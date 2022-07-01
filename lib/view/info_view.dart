import 'package:bmi_calculator/widget/custom_drawer.dart';
import 'package:bmi_calculator/widget/custom_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

@injectable
class InfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.infoTitle)),
      drawer: CustomDrawer(),
      body: SafeArea(child: CustomListView()),
    );
  }
}
