import 'package:bmi_calculator/model/bmi_range.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (width / 3) - 20,
                      child: Text('Range', textAlign: TextAlign.left),
                    ),
                    Container(
                      width: (width / 3 * 2) - 20,
                      child: Text(
                        'Description',
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
                        bmiRange.elementAt(index).category,
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
    );
  }
}
