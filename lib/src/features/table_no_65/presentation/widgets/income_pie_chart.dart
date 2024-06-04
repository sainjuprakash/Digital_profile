import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IncomePieChart extends StatelessWidget {
  int totalCrops,
      totalFruits,
      totalLivestock,
      totalVegi,
      totalHerbs,
      totalLabour,
      totalBusiness,
      totalForeignEmp,
      totalOffice,
      totalOthers,
      totalIncome;

  IncomePieChart(
      this.totalCrops,
      this.totalFruits,
      this.totalLivestock,
      this.totalVegi,
      this.totalHerbs,
      this.totalLabour,
      this.totalBusiness,
      this.totalForeignEmp,
      this.totalOffice,
      this.totalOthers,
      this.totalIncome,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.incomeTitle),
          verticalspace(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                width: 300,
                height: 300,
                child: PieChart(
                    swapAnimationDuration: const Duration(milliseconds: 300),
                    PieChartData(centerSpaceRadius: 90, sections: [
                      PieChartSectionData(
                          color: const Color(0xFF009688),
                          value: totalCrops.toDouble(),
                          badgeWidget: Text(l10n.clothes),
                          badgePositionPercentageOffset: 1.5),
                      PieChartSectionData(
                          color: const Color(0xFF1976D2),
                          value: totalFruits.toDouble(),
                          badgeWidget: Text(l10n.agriculture),
                          badgePositionPercentageOffset: 1.5),
                      PieChartSectionData(
                          color: Colors.red,
                          value: totalVegi.toDouble(),
                          badgeWidget: Text(l10n.education),
                          badgePositionPercentageOffset: 1.8),
                      PieChartSectionData(
                          color: const Color(0xFF3F51B5),
                          value: totalHerbs.toDouble(),
                          badgeWidget: Text(l10n.health),
                          badgePositionPercentageOffset: 1.5),
                      PieChartSectionData(
                          color: const Color(0xFFCDDC39),
                          value: totalLivestock.toDouble(),
                          badgeWidget: Text(l10n.festival),
                          badgePositionPercentageOffset: 1.5),
                      PieChartSectionData(
                          color: const Color(0xFFFF5722),
                          value: totalOthers.toDouble(),
                          badgeWidget: Text(l10n.others),
                          badgePositionPercentageOffset: 1.5),
                      PieChartSectionData(
                          color: const Color(0xFF9C27B0),
                          value: totalForeignEmp.toDouble(),
                          badgeWidget: Text(l10n.ghale),
                          badgePositionPercentageOffset: 1.5),
                      PieChartSectionData(
                          color: const Color(0xFF00BCD4),
                          value: totalBusiness.toDouble(),
                          badgeWidget: Text(l10n.others),
                          badgePositionPercentageOffset: 1.5),
                      PieChartSectionData(
                          color: const Color(0xFFE91E63),
                          value: totalOffice.toDouble(),
                          badgeWidget: Text(l10n.notavailable),
                          badgePositionPercentageOffset: 1.5),
                      PieChartSectionData(
                          color: const Color(0xFFE91E63),
                          value: totalLabour.toDouble(),
                          badgeWidget: Text(l10n.notavailable),
                          badgePositionPercentageOffset: 1.5),
                    ]))),
          )
        ],
      ),
    );
  }
}
