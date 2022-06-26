import 'package:flutter/material.dart';
import '../model/bmi_range.dart';

class CustomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(),
                      child: Text('Range'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 66,
                          right: 10),
                      child: Text('Description'),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(),
                      child: Text(
                          bmiRange.elementAt(index).startValue.toString() +
                              ' - ' +
                              bmiRange.elementAt(index).endValue.toString()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 50,
                        right: 10,
                      ),
                      child: Text(bmiRange.elementAt(index).category),
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
