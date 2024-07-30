import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/src/features/table_no_113/data/model/earthquake_grant_model.dart';
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
    return Card(
      child: BlocBuilder<EarthquakeGrantBloc, EarthquakeGrantState>(
        builder: (context, state) {
          if (state is EarthquakeGrantLoadingState) {
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
          if (state is EarthquakeGrantSuccessState) {
            List<EarthquakeGrantModel> fetchedData = state.fetchedModel;
            return SingleChildScrollView(
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
                        DataCell(Text(e.value.gotGranted?.toString() ?? '0')),
                        DataCell(
                            Text(e.value.doesNotGotGranted?.toString() ?? '0')),
                        DataCell(Text(e.value.notAvailable?.toString() ?? '0')),
                        DataCell(Text(e.value.totalGranted?.toString() ?? '0')),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: WidgetStateProperty.resolveWith<Color>(
                          (states) => Colors.grey.withOpacity(0.6)),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalGotGrant.toString())),
                        DataCell(Text(totalHasNotGotGranted.toString())),
                        DataCell(Text(totalNotAvailable.toString())),
                        DataCell(Text(totalTotal.toString())),
                      ])),
              ),
            );
          }
          if (state is EarthquakeGrantFailureState) {
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
