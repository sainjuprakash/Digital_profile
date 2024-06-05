import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllowanceBarChart extends StatelessWidget {
  int totalProcessWrong,
      totalbriddhaBhatta,
      totalWidow,
      totalWidower,
      totalDisabled,
      totalNotTaken,
      totalNotProcessed,
      totalIndigenous,
      totalNotAvailable,
      totalSocialSecurity;

  AllowanceBarChart(
      this.totalProcessWrong,
      this.totalbriddhaBhatta,
      this.totalWidow,
      this.totalWidower,
      this.totalDisabled,
      this.totalNotTaken,
      this.totalNotProcessed,
      this.totalIndigenous,
      this.totalNotAvailable,
      this.totalSocialSecurity,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.allowanceTitle),
          verticalspace(),

        ],
      ),
    );
  }
}
