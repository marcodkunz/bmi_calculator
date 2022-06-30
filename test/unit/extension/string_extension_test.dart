import 'package:bmi_calculator/extension/string_extension.dart';
import 'package:bmi_calculator/model/user_entry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isNullOrEmpty', () {
    void nullCheck(String? string, bool expected) {
      test("$string --> $expected", () {
        expect(string.isNullOrEmpty(), equals(expected));
      });
    }

    nullCheck(null, true);
    nullCheck("", true);
    nullCheck(" ", false);
    nullCheck("test", false);
  });

  group('genderFromString', () {
    void genderCheck(String? string, Gender expected) {
      test("$string --> $expected", () {
        expect(string.genderFromString(), equals(expected));
      });
    }

    genderCheck(null, Gender.unknown);
    genderCheck("", Gender.unknown);
    genderCheck("female", Gender.unknown);
    genderCheck("male", Gender.unknown);
    genderCheck("Gender.female", Gender.female);
    genderCheck("Gender.male", Gender.male);
  });
}
