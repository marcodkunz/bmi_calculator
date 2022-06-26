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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30, right: 10),
                child: Text(title, style: TextStyles.mediumWhite),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 30),
                child: Text(value, style: TextStyles.mediumWhite),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
