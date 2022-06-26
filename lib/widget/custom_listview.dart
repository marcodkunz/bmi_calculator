import 'package:flutter/material.dart';

import '../style/color_styles.dart';

class ListViewBuilder extends StatelessWidget {
  //final List<Map> overview;

  final List<Map> overview = [
    {'value': '<16.0', 'description' : 'Underweight (Severe thinness)'},
    {'value': '16.0 - 16.9', 'description' :  'Underweight (Moderate thinness)'},
    {'value': '17.0 - 18.4', 'description' :  'Underweight (Mild thinness)'},
    {'value':'18.5 - 24.9', 'description' : 'Normal range'},
    {'value': '15.0 - 29.9', 'description' : 'Overweight (Pre-obese)'},
    {'value': '30.0 - 34.9', 'description' :  'Obese (Class I)'},
    {'value': '35.0 - 39.9', 'description' : 'Obese (Class II)'},
    {'value': '>40.0', 'description' : 'Obese (Class III)'}
  ];
  //const ListViewBuilder({Key? key, required this.overview})
    //  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            thickness: 2,
            color: ColorStyles.white,
          ),
          itemCount: overview.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              trailing: Text(overview[index]["description"]),
              title: Text(overview[index]["value"]),
            );
          },
        ),
      ),
    );
  }
}

