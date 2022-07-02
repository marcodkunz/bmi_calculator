import 'package:bmi_calculator/model/user_entry.dart';

UserEntry defaultUser() => UserEntry(
    height: 170, weight: 80, age: 25, gender: Gender.female, bmi: 27.68);

UserEntry storedUser() => UserEntry(
    id: 1, height: 170, weight: 80, age: 25, gender: Gender.female, bmi: 27.68);
