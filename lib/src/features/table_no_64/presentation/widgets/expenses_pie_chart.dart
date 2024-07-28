import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/expenses_bloc.dart';

class ExpensesPieChart extends StatelessWidget {
  int totalClothes,
      totalEducation,
      totalHealth,
      totalFestival,
      totalAgriculture,
      totalOthers,
      totalExpenses;

  ExpensesPieChart(
      this.totalClothes,
      this.totalEducation,
      this.totalHealth,
      this.totalFestival,
      this.totalAgriculture,
      this.totalOthers,
      this.totalExpenses,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.expensesTitle),
          BlocBuilder<ExpensesBloc, ExpensesState>(
            builder: (context, state) {
              if (state is ExpensesLoadingState) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is ExpensesSuccessState) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: 300,
                      height: 300,
                      child: PieChart(
                          swapAnimationDuration:
                              const Duration(milliseconds: 300),
                          PieChartData(centerSpaceRadius: 90, sections: [
                            PieChartSectionData(
                                color: const Color(0xFF009688),
                                value: totalClothes.toDouble(),
                                badgeWidget: Text(l10n.clothes),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFF1976D2),
                                value: totalAgriculture.toDouble(),
                                badgeWidget: Text(l10n.agriculture),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: Colors.red,
                                value: totalEducation.toDouble(),
                                badgeWidget: Text(l10n.education),
                                badgePositionPercentageOffset: 1.8),
                            PieChartSectionData(
                                color: const Color(0xFF3F51B5),
                                value: totalHealth.toDouble(),
                                badgeWidget: Text(l10n.health),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFFCDDC39),
                                value: totalFestival.toDouble(),
                                badgeWidget: Text(l10n.festival),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFFFF5722),
                                value: totalOthers.toDouble(),
                                badgeWidget: Text(l10n.others),
                                badgePositionPercentageOffset: 1.5),
                          ]))),
                );
              }
              if (state is ExpensesFailureState) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(l10n.loadDataFail),
                  ),
                );
              }
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(l10n.unknownError),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
