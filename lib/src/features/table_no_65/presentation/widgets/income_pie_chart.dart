import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../table_no_74/presentation/bloc/settlement_bloc.dart';

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
          BlocBuilder<SettlementBloc, SettlementState>(
            builder: (context, state) {
              if (state is SettlementLoadingState) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (state is SettlementSuccessState) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: 300,
                      height: 350,
                      child: PieChart(
                          swapAnimationDuration:
                              const Duration(milliseconds: 300),
                          PieChartData(centerSpaceRadius: 90, sections: [
                            PieChartSectionData(
                                color: const Color(0xFF3F51B5),
                                value: totalHerbs.toDouble(),
                                badgeWidget: Text(l10n.herbs),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFF009688),
                                value: totalCrops.toDouble(),
                                badgeWidget: Text(l10n.crops),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFFCDDC39),
                                value: totalLivestock.toDouble(),
                                badgeWidget: Text(l10n.livestock),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFFFF5722),
                                value: totalOthers.toDouble(),
                                badgeWidget: Text(l10n.others),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: Colors.red,
                                value: totalVegi.toDouble(),
                                badgeWidget: Text(l10n.vegetables),
                                badgePositionPercentageOffset: 1.8),
                            PieChartSectionData(
                                color: const Color(0xFF9C27B0),
                                value: totalForeignEmp.toDouble(),
                                badgeWidget: Text(l10n.foreignEmp),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFF00BCD4),
                                value: totalBusiness.toDouble(),
                                badgeWidget: Text(l10n.business),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFFE91E63),
                                value: totalOffice.toDouble(),
                                badgeWidget: Text(l10n.office),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFF1976D2),
                                value: totalFruits.toDouble(),
                                badgeWidget: Text(l10n.fruits),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: Colors.greenAccent,
                                value: totalLabour.toDouble(),
                                badgeWidget: Text(l10n.labour),
                                badgePositionPercentageOffset: 1.5),
                          ]))),
                );
              }
              if (state is SettlementFailureState) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Unable to load data'),
                  ),
                );
              }
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Something went wrong'),
                ),
              );
            },
          ),
          verticalspace(),
        ],
      ),
    );
  }
}
