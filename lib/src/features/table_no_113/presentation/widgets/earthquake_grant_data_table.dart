import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/src/features/table_no_113/data/model/earthquake_grant_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/earthquake_grant_bloc.dart';

class EarthquakeGrantDatatable extends StatelessWidget {
  int totalGotGrant, totalHasNotGotGranted, totalNotAvailable, totalTotal;

  EarthquakeGrantDatatable(this.totalNotAvailable, this.totalHasNotGotGranted,
      this.totalGotGrant, this.totalTotal,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EarthquakeGrantBloc, EarthquakeGrantState>(
      builder: (context, state) {
        if (state is EarthquakeGrantSuccessState) {
          List<EarthquakeGrantModel> fetchedData = state.fetchedModel;
          return Card(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.got)),
                  DataColumn(label: Text(l10n.doesNotGot)),
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
                        DataCell(Text(e.value.gotGranted?.toString() ?? '0')),
                        DataCell(
                            Text(e.value.doesNotGotGranted?.toString() ?? '0')),
                        DataCell(Text(e.value.notAvailable?.toString() ?? '0')),
                        DataCell(Text(e.value.totalGranted?.toString() ?? '0')),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: MaterialStateProperty.resolveWith<Color>(
                          (states) => Colors.grey.withOpacity(0.6)),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalGotGrant.toString())),
                        DataCell(Text(totalHasNotGotGranted.toString())),
                        DataCell(Text(totalNotAvailable.toString())),
                        DataCell(Text(totalTotal.toString())),
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
