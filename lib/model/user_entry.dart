import 'package:bmi_calculator/extension/string_extension.dart';

enum Gender { male, female, unknown }

class UserEntry {
  final int? id;
  String? name;
  final int height;
  final int weight;
  final int age;
  final Gender gender;
  final double bmi;

  UserEntry(
      {this.id,
      this.name,
      required this.height,
      required this.weight,
      required this.age,
      required this.gender,
      required this.bmi});

  factory UserEntry.fromMap(Map<String, Object?> map) {
    return UserEntry(
      id: map['id'] as int,
      name: map['name'] as String,
      height: map['height'] as int,
      weight: map['weight'] as int,
      age: map['age'] as int,
      gender: (map['gender'] as String).genderFromString(),
      bmi: map['bmi'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'height': height,
      'weight': weight,
      'age': age,
      'gender': gender.toString(),
      'bmi': bmi,
    };
  }

  @override
  String toString() {
    return 'UserEntry{id: $id, name: $name, height: $height, weight: $weight,age: $age, gender: ${gender.toString()}, bmi: $bmi}';
  }
}
