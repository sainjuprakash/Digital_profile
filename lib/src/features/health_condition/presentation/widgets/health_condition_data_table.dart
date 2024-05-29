import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/health_condition_model.dart';
import '../bloc/health_condition_bloc.dart';

class HealthConditionDataTable extends StatelessWidget {
  int totalHealthy;
  int totalGeneralDisease;
  int totalLongTermDisease;
  int totalCovid;
  int totalNotAvailable;
  int totalWardHealthCondition;

  HealthConditionDataTable(
      {super.key,
      required this.totalHealthy,
      required this.totalGeneralDisease,
      required this.totalLongTermDisease,
      required this.totalCovid,
      required this.totalNotAvailable,
      required this.totalWardHealthCondition});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<HealthConditionBloc, HealthConditionState>(
        builder: (context, state) {
          if (state is HealthConditionSuccessState) {
            List<HealthConditionModel> fetchedHealthData =
                state.healthConditionModel;
            return Card(
              child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.healthy)),
                  DataColumn(label: Text(l10n.generalDisease)),
                  DataColumn(label: Text(l10n.longTermDisease)),
                  DataColumn(label: Text(l10n.covid)),
                  DataColumn(label: Text(l10n.notavailable)),
                  DataColumn(label: Text(l10n.total)),
                ],
                rows: fetchedHealthData.asMap().entries.map((e) {
                  return DataRow(
                      color: MaterialStateProperty.resolveWith((states) {
                        if (e.key % 2 == 0) {
                          return Colors.grey.withOpacity(0.3);
                        } else {
                          return null;
                        }
                      }),
                      cells: [
                        DataCell(Text(e.value.wardNumber.toString() ?? '-')),
                        DataCell(Text(e.value.healthy?.toString() ?? '-')),
                        DataCell(
                            Text(e.value.generalDisease?.toString() ?? '-')),
                        DataCell(
                            Text(e.value.longTermDisease?.toString() ?? '-')),
                        DataCell(Text(e.value.covid?.toString() ?? '-')),
                        DataCell(Text(e.value.notAvailable?.toString() ?? '-')),
                        DataCell(Text(
                            e.value.totalWardHealthCondition?.toString() ??
                                '-')),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: MaterialStateProperty.resolveWith(
                          (states) => Colors.grey.withOpacity(0.6)),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalHealthy.toString())),
                        DataCell(Text(totalGeneralDisease.toString())),
                        DataCell(Text(totalLongTermDisease.toString())),
                        DataCell(Text(totalCovid.toString())),
                        DataCell(Text(totalNotAvailable.toString())),
                        DataCell(Text(totalWardHealthCondition.toString())),
                      ])),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
