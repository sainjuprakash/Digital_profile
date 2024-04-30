import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_localization/l10n.dart';
import '../../data/models/population_model.dart';
import '../bloc/population_bloc.dart';

class PopulationDatatable extends StatelessWidget {
  const PopulationDatatable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BlocBuilder<PopulationBloc, PopulationState>(
          builder: (context, state) {
            if (state is PopulationSuccessState) {
              List<PopulationModel>? populationData = state.populationModel;

              return DataTable(
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
                    int totalWardHhCount =
                        ((population.value.maleHhCount ?? 0) +
                            (population.value.femaleHhCount ?? 0));
                    return DataRow(
                        color: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          if (population.key % 2 == 0) {
                            return Colors.grey.withOpacity(0.3); // even row
                          }
                          return null;
                        }),
                        cells: [
                          DataCell(Text(population.value.surveyWardNumber)),
                          DataCell(Text(
                              population.value.maleCount?.toString() ?? '-')),
                          DataCell(Text(
                              population.value.femaleCount?.toString() ?? '-')),
                          DataCell(Text(
                              population.value.othersCount?.toString() ?? '-')),
                          DataCell(
                              Text(population.value.totalWardpop.toString())),
                          DataCell(
                              Text(population.value.maleHhCount.toString())),
                          DataCell(
                              Text(population.value.femaleHhCount.toString())),
                          DataCell(Text(totalWardHhCount.toString())),
                        ]);
                  }).toList());
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
