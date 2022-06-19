enum Gender { male, female }

class UserEntry {
  final String name;
  final int height;
  final int age;
  final Gender gender;

  UserEntry(this.name, this.height, this.age, this.gender);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'height': height,
      'age': age,
      'gender': gender,
    };
  }
}
