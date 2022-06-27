import 'package:flutter/material.dart';
import '../style/text_styles.dart';

class CustomResultView extends StatelessWidget {
  final String title;
  final String value;

  const CustomResultView({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 80),
                width: (MediaQuery.of(context).size.width / 2) - 10,
                child: Text(title, style: TextStyles.mediumWhite, textAlign: TextAlign.center,),
              ),
              Container(
                padding: EdgeInsets.only(right: 120),
                width: (MediaQuery.of(context).size.width / 2) - 10,
                child: Text(value, style: TextStyles.mediumWhite, textAlign: TextAlign.center,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
