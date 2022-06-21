import 'package:bmi_calculator/extension/string_extension.dart';

enum Gender { male, female, unknown }

class UserEntry {
  final String name;
  final int height;
  final int age;
  final Gender gender;

  UserEntry(this.name, this.height, this.age, this.gender);

  static UserEntry fromMap(Map<String, Object?> map) {
    return UserEntry(
      map['name'] as String,
      map['height'] as int,
      map['age'] as int,
      (map['gender'] as String).genderFromString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'height': height,
      'age': age,
      'gender': gender.toString(),
    };
  }

  @override
  String toString() {
    return 'UserEntry{name: $name, height: $height, age: $age, gender: ${gender.toString()}}';
  }
}
