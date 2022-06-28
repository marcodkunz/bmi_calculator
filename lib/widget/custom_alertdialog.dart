import 'package:bmi_calculator/style/color_styles.dart';
import 'package:bmi_calculator/style/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final Function(int?) onDone;

  CustomAlertDialog({Key? key, required this.title, required this.onDone})
      : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorStyles.lightPetrol,
      title: Text(title),

      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text('OK', style: TextStyles.BodyMediumWhite),
        ),
        TextButton(
          onPressed: () {
            var value = int.tryParse(_controller.text);
            onDone(value);
            Navigator.pop(context, 'OK');
          },
          child: Text('Save', style: TextStyles.BodyMediumWhite),
        ),
      ],
    );
  }
}
