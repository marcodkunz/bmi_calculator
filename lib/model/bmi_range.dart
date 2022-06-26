class BmiRange {
  final double startValue;
  final double endValue;
  final String category;

  BmiRange(
      {required this.startValue,
      required this.endValue,
      required this.category});

  static BmiRange fromMap(Map<String, Object?> map) {
    return BmiRange(
      startValue: map['startValue'] as double,
      endValue: map['endValue'] as double,
      category: map['category'] as String,
    );
  }
}

final List<BmiRange> bmiRange = [

  BmiRange(
      startValue: 00.0, endValue: 16.0, category: 'Underweight (Severe thinness)'),
  BmiRange(
      startValue: 16.1,
      endValue: 16.9,
      category: 'Underweight (Moderate thinness)'),
  BmiRange(
      startValue: 17.0,
      endValue: 18.4,
      category: 'Underweight (Mild thinness)'),
  BmiRange(
      startValue: 18.5,
      endValue: 24.9,
      category: 'Normal range'),
  BmiRange(
      startValue: 25.0,
      endValue: 29.9,
      category: 'Overweight (Pre-obese)'),
  BmiRange(
      startValue: 30.0,
      endValue: 34.9,
      category: 'Obese (Class I)'),
  BmiRange(
      startValue: 35.0,
      endValue: 39.9,
      category: 'Obese (Class II)'),
  BmiRange(
      startValue: 40.0,
      endValue: 99.9,
      category: 'Obese (Class III)'
  ),
];
