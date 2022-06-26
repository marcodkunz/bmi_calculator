import 'package:bmi_calculator/common/routes.dart';
import 'package:bmi_calculator/style/color_styles.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorStyles.darkPetrol,
      child: ListView(
        padding: EdgeInsets.only(top: 40),
        children: [
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, Routes.homeView);
            },
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            title: const Text('Info'),
            onTap: () {
              Navigator.pushNamed(context, Routes.infoView);
            },
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            title: const Text('Calculate'),
            onTap: () {
              Navigator.pushNamed(context, Routes.inputView);
            },
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            title: const Text('History'),
            onTap: () {
              Navigator.pushNamed(context, Routes.historyView);
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
}
