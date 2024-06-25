import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_localization/l10n.dart';
import '../../data/models/population_model.dart';
import '../bloc/population_bloc.dart';

class PopulationDatatable extends StatelessWidget {
  PopulationDatatable({super.key});
  int totalMale = 0;
  int totalFemale = 0;
  int totalOthers = 0;
  int totalMaleFemale = 0;
  int totalHhMale = 0;
  int totalHhFemale = 0;
  int totalWardHh = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopulationBloc, PopulationState>(
      builder: (context, state) {
        if (state is PopulationLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PopulationSuccessState) {
          List<PopulationModel>? populationData = state.populationModel;
          populationData.asMap().forEach((key, value) {
            totalMale += populationData[key].maleCount ?? 0;
            totalFemale += populationData[key].femaleCount ?? 0;
            totalOthers += populationData[key].othersCount ?? 0;
            totalMaleFemale += populationData[key].totalWardPop ?? 0;
            totalHhMale += populationData[key].maleHhCount ?? 0;
            totalHhFemale += populationData[key].femaleHhCount ?? 0;
          });

          return Card(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  columns: [
                    DataColumn(label: Text(l10n.wardnumber)),
                    DataColumn(label: Text(l10n.male)),
                    DataColumn(label: Text(l10n.female)),
                    DataColumn(label: Text(l10n.others)),
                    DataColumn(label: Text(l10n.totalwardpop)),
                    DataColumn(label: Text(l10n.malehhcount)),
                    DataColumn(label: Text(l10n.femalehhcount)),
                    DataColumn(label: Text(l10n.totalhhcount)),
                  ],
                  rows: populationData.asMap().entries.map((population) {
                    int totalWardHhCount = (population.value.maleHhCount ?? 0) +
                        (population.value.femaleHhCount ?? 0);
                    totalWardHh += totalWardHhCount;
                    return DataRow(
                        color: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          if (population.key % 2 == 0) {
                            return Colors.grey.withOpacity(0.3); // even row
                          }
                          return null;
                        }),
                        cells: [
                          DataCell(Text(
                              population.value.surveyWardNumber.toString())),
                          DataCell(Text(
                              population.value.maleCount?.toString() ?? '-')),
                          DataCell(Text(
                              population.value.femaleCount?.toString() ?? '-')),
                          DataCell(Text(
                              population.value.othersCount?.toString() ?? '-')),
                          DataCell(
                              Text(population.value.totalWardPop.toString())),
                          DataCell(
                              Text(population.value.maleHhCount.toString())),
                          DataCell(
                              Text(population.value.femaleHhCount.toString())),
                          DataCell(Text(totalWardHhCount.toString())),
                        ]);
                  }).toList()
                    ..add(DataRow(
                        color: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return Colors.grey.withOpacity(0.6);
                        }),
                        cells: [
                          DataCell(Text(l10n.total.toString())),
                          DataCell(Text(totalMale.toString())),
                          DataCell(Text(totalFemale.toString())),
                          DataCell(Text(totalOthers.toString())),
                          DataCell(Text(totalMaleFemale.toString())),
                          DataCell(Text(totalHhMale.toString())),
                          DataCell(Text(totalHhFemale.toString())),
                          DataCell(Text(totalWardHh.toString())),
                        ]))),
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
