import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/grant_stage_model.dart';
import '../bloc/grant_stage_bloc.dart';

class GrantStageDataTable extends StatelessWidget {
  int totalFirst, totalSecond, totalLast, totalNotAvailable, totalTotal;

  GrantStageDataTable(this.totalFirst, this.totalSecond, this.totalLast,
      this.totalNotAvailable, this.totalTotal,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<GrantStageBloc, GrantStageState>(
        builder: (context, state) {
          if (state is GrantStageLoadingState) {
            return const SizedBox(
              height: 60,
              width: double.maxFinite,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          if (state is GrantStageSuccessState) {
            List<GrantStageModel> fetchedData = state.fetchedModel;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.first)),
                  DataColumn(label: Text(l10n.secondary)),
                  DataColumn(label: Text(l10n.last)),
                  DataColumn(label: Text(l10n.Undisclosed)),
                  DataColumn(label: Text(l10n.total)),
                ],
                rows: fetchedData.asMap().entries.map((e) {
                  return DataRow(
                      color: WidgetStateProperty.resolveWith(
                          (Set<WidgetState> states) {
                        if (e.key % 2 == 0) {
                          return Colors.grey.withOpacity(0.3);
                        } else {
                          return null;
                        }
                      }),
                      cells: [
                        DataCell(Text(e.value.wardNumber.toString())),
                        DataCell(Text(e.value.firstStage?.toString() ?? '0')),
                        DataCell(Text(e.value.secondStage?.toString() ?? '0')),
                        DataCell(Text(e.value.thirdStage?.toString() ?? '0')),
                        DataCell(Text(e.value.notAvailable?.toString() ?? '0')),
                        DataCell(Text(e.value.total?.toString() ?? '0')),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: WidgetStateProperty.resolveWith<Color>(
                          (states) => Colors.grey.withOpacity(0.6)),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalFirst.toString())),
                        DataCell(Text(totalSecond.toString())),
                        DataCell(Text(totalLast.toString())),
                        DataCell(Text(totalNotAvailable.toString())),
                        DataCell(Text(totalTotal.toString())),
                      ])),
              ),
            );
          }
          if (state is GrantStageFailureState) {
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
      ),
    );
  }
}
