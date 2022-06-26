import 'package:bmi_calculator/extension/string_extension.dart';

enum Gender { male, female, unknown }

class UserEntry {
  final int? id;
  final String name;
  final int height;
  final int age;
  final Gender gender;
  final double bmi;

  UserEntry(this.id, this.name, this.height, this.age, this.gender, this.bmi);

  static UserEntry fromMap(Map<String, Object?> map) {
    return UserEntry(
      map['id'] as int,
      map['name'] as String,
      map['height'] as int,
      map['age'] as int,
      (map['gender'] as String).genderFromString(),
      map['bmi'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'height': height,
      'age': age,
      'gender': gender.toString(),
      'bmi': bmi,
    };
  }

  @override
  String toString() {
    return 'UserEntry{id: $id, name: $name, height: $height, age: $age, gender: ${gender.toString()}, bmi: $bmi}';
  }
}
