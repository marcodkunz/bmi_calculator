enum BmiRangeCategory {
  underweightIII,
  underweightII,
  underweightI,
  normal,
  overweight,
  obeseI,
  obeseII,
  obeseIII
}

class BmiRange {
  final double startValue;
  final double endValue;
  final BmiRangeCategory category;

  BmiRange(
      {required this.startValue,
      required this.endValue,
      required this.category});
}

final List<BmiRange> bmiRange = [
  BmiRange(
      startValue: 0.0,
      endValue: 16.0,
      category: BmiRangeCategory.underweightIII),
  BmiRange(
      startValue: 16.01,
      endValue: 16.99,
      category: BmiRangeCategory.underweightII),
  BmiRange(
      startValue: 17.0,
      endValue: 18.49,
      category: BmiRangeCategory.underweightI),
  BmiRange(
      startValue: 18.5, endValue: 24.99, category: BmiRangeCategory.normal),
  BmiRange(
      startValue: 25.0, endValue: 29.99, category: BmiRangeCategory.overweight),
  BmiRange(
      startValue: 30.0, endValue: 34.99, category: BmiRangeCategory.obeseI),
  BmiRange(
      startValue: 35.0, endValue: 39.99, category: BmiRangeCategory.obeseII),
  BmiRange(
      startValue: 40.0, endValue: 99.99, category: BmiRangeCategory.obeseIII),
];
