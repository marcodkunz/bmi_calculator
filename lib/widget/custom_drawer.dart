import 'package:bmi_calculator/app_container.dart';
import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/service/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 40),
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.drawerHome),
            onTap: () {
              _navigate(Routes.homeView);
            },
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.drawerInfo),
            onTap: () {
              _navigate(Routes.infoView);
            },
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.drawerCalculate),
            onTap: () {
              _navigate(Routes.inputView);
            },
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.drawerHistory),
            onTap: () {
              _navigate(Routes.historyView);
            },
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  void _navigate(String route) {
    var navigator = getIt<INavigationService>();
    navigator.pushNamedAndRemoveUntil(route);
  }
}
