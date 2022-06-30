import 'package:bmi_calculator/extension/gender_extension.dart';
import 'package:bmi_calculator/model/user_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('toIcon', () {
    void nullCheck(Gender? gender, IconData expected) {
      test("$gender --> $expected", () {
        expect(gender.toIcon(), equals(expected));
      });
    }

    nullCheck(null, Icons.transgender_sharp);
    nullCheck(Gender.unknown, Icons.transgender_sharp);
    nullCheck(Gender.female, Icons.female);
    nullCheck(Gender.male, Icons.male);
  });

}
