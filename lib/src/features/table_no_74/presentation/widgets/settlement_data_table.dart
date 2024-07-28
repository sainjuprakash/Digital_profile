import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/src/features/table_no_74/data/model/settlement_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/settlement_bloc.dart';

class SettlementDataTable extends StatelessWidget {
  int totalPermanent, totalTemporary, totalOthers, totalResidence;

  SettlementDataTable(this.totalPermanent, this.totalTemporary,
      this.totalOthers, this.totalResidence,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<SettlementBloc, SettlementState>(
        builder: (context, state) {
          if (state is SettlementLoadingState) {
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
          if (state is SettlementSuccessState) {
            List<SettlementModel> fetchedData = state.fetchedModel;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.permanent)),
                  DataColumn(label: Text(l10n.temporary)),
                  DataColumn(label: Text(l10n.others)),
                  DataColumn(label: Text(l10n.total)),
                ],
                rows: fetchedData.asMap().entries.map((e) {
                  return DataRow(
                      color: WidgetStateProperty.resolveWith(
                          (Set<WidgetState> state) {
                        if (e.key % 2 == 0) {
                          return Colors.grey.withOpacity(0.3);
                        } else {
                          return null;
                        }
                      }),
                      cells: [
                        DataCell(Text(e.value.wardNumber.toString())),
                        DataCell(Text(e.value.permanent?.toString() ?? '-')),
                        DataCell(Text(e.value.temporary?.toString() ?? '-')),
                        DataCell(Text(e.value.others?.toString() ?? '-')),
                        DataCell(Text(e.value.total?.toString() ?? '-')),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                        return Colors.grey.withOpacity(0.6);
                      }),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalPermanent.toString())),
                        DataCell(Text(totalTemporary.toString())),
                        DataCell(Text(totalOthers.toString())),
                        DataCell(Text(totalResidence.toString())),
                      ])),
              ),
            );
          }
          if (state is SettlementFailureState) {
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
