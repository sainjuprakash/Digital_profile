import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/allowance_model.dart';
import '../bloc/allowance_bloc.dart';

class AllowanceDataTable extends StatelessWidget {
  int totalProcessWrong,
      totalBriddhaBhatta,
      totalWidow,
      totalWidower,
      totalDisabled,
      totalNotTaken,
      totalNotProcessed,
      totalIndigenous,
      totalNotAvailable,
      totalSocialSecurity;

  AllowanceDataTable(
      this.totalProcessWrong,
      this.totalBriddhaBhatta,
      this.totalWidow,
      this.totalWidower,
      this.totalDisabled,
      this.totalNotTaken,
      this.totalNotProcessed,
      this.totalIndigenous,
      this.totalNotAvailable,
      this.totalSocialSecurity,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<AllowanceBloc, AllowanceState>(
        builder: (context, state) {
          if (state is AllowanceLoadingState) {
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
          if (state is AllowanceSuccessState) {
            List<AllowanceModel> fetchedData = state.fetchedModel;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.processWrong)),
                  DataColumn(label: Text(l10n.briddhaBhatta)),
                  DataColumn(label: Text(l10n.widow)),
                  DataColumn(label: Text(l10n.widower)),
                  DataColumn(label: Text(l10n.disableAllowance)),
                  DataColumn(label: Text(l10n.notTaken)),
                  DataColumn(label: Text(l10n.notProcessed)),
                  DataColumn(label: Text(l10n.indigenous)),
                  DataColumn(label: Text(l10n.Undisclosed)),
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
                        DataCell(Text(e.value.processWrong?.toString() ?? '0')),
                        DataCell(
                            Text(e.value.briddhaBhatta?.toString() ?? '0')),
                        DataCell(Text(e.value.widow?.toString() ?? '0')),
                        DataCell(Text(e.value.widower?.toString() ?? '0')),
                        DataCell(Text(e.value.disabled?.toString() ?? '0')),
                        DataCell(Text(e.value.notTaken?.toString() ?? '0')),
                        DataCell(Text(e.value.notProcessed?.toString() ?? '0')),
                        DataCell(Text(e.value.indigenous?.toString() ?? '0')),
                        DataCell(Text(e.value.notAvailable?.toString() ?? '0')),
                        DataCell(
                            Text(e.value.socialSecurity?.toString() ?? '0')),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                        return Colors.grey.withOpacity(0.6);
                      }),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalProcessWrong.toString())),
                        DataCell(Text(totalBriddhaBhatta.toString())),
                        DataCell(Text(totalWidow.toString())),
                        DataCell(Text(totalWidower.toString())),
                        DataCell(Text(totalDisabled.toString())),
                        DataCell(Text(totalNotTaken.toString())),
                        DataCell(Text(totalNotProcessed.toString())),
                        DataCell(Text(totalIndigenous.toString())),
                        DataCell(Text(totalNotAvailable.toString())),
                        DataCell(Text(totalSocialSecurity.toString())),
                      ])),
              ),
            );
          }
          if (state is AllowanceFailureState) {
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
