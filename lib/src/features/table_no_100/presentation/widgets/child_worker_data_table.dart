import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/child_worker_model.dart';
import '../bloc/child_worker_bloc.dart';

class ChildWorkerDataTable extends StatelessWidget {
  int totalYes, totalNo, totalNotAvailable, totalWardHouses;

  ChildWorkerDataTable(
      this.totalYes, this.totalNo, this.totalNotAvailable, this.totalWardHouses,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildWorkerBloc, ChildWorkerState>(
      builder: (context, state) {
        if (state is ChildWorkerSuccessState) {
          List<ChildWorkerModel> fetchedData = state.fetchedModel;
          return Card(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.haveChildWorker)),
                  DataColumn(label: Text(l10n.haveNoChildWorker)),
                  DataColumn(label: Text(l10n.Undisclosed)),
                  DataColumn(label: Text(l10n.total)),
                ],
                rows: fetchedData.asMap().entries.map((e) {
                  return DataRow(
                      color: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        if (e.key % 2 == 0) {
                          return Colors.grey.withOpacity(0.3);
                        } else {
                          return null;
                        }
                      }),
                      cells: [
                        DataCell(Text(e.value.wardNumber.toString())),
                        DataCell(Text(e.value.yes?.toString() ?? '0')),
                        DataCell(Text(e.value.no?.toString() ?? '0')),
                        DataCell(Text(e.value.notAvailable?.toString() ?? '0')),
                        DataCell(Text(e.value.wardHouses?.toString() ?? '0'))
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: MaterialStateProperty.resolveWith<Color>(
                          (states) => Colors.grey.withOpacity(0.6)),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalYes.toString())),
                        DataCell(Text(totalNo.toString())),
                        DataCell(Text(totalNotAvailable.toString())),
                        DataCell(Text(totalWardHouses.toString()))
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
