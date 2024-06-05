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
    return BlocBuilder<SettlementBloc, SettlementState>(
      builder: (context, state) {
        if (state is SettlementSuccessState) {
          List<SettlementModel> fetchedData = state.fetchedModel;
          return Card(
            child: SingleChildScrollView(
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
                      color: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> state) {
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
                      color: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
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
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
