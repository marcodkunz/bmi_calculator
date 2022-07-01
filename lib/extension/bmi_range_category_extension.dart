import 'package:bmi_calculator/model/bmi_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BmiRangeCategoryExtension on BmiRangeCategory? {
  String translate(BuildContext context) {
    if (this == null) return '';

    switch (this) {
      case BmiRangeCategory.underweightIII:
        return AppLocalizations.of(context)!.bmiRangeUnderweightIII;
      case BmiRangeCategory.underweightII:
        return AppLocalizations.of(context)!.bmiRangeUnderweightII;
      case BmiRangeCategory.underweightI:
        return AppLocalizations.of(context)!.bmiRangeUnderweightI;
      case BmiRangeCategory.normal:
        return AppLocalizations.of(context)!.bmiRangeNormal;
      case BmiRangeCategory.overweight:
        return AppLocalizations.of(context)!.bmiRangeOverweight;
      case BmiRangeCategory.obeseI:
        return AppLocalizations.of(context)!.bmiRangeObeseI;
      case BmiRangeCategory.obeseII:
        return AppLocalizations.of(context)!.bmiRangeObeseII;
      case BmiRangeCategory.obeseIII:
        return AppLocalizations.of(context)!.bmiRangeObeseIII;
      default:
        return '';
    }
  }
}
