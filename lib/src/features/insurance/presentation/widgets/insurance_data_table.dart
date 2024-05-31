import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/insurance_model.dart';
import '../bloc/insurance_bloc.dart';

class InsuranceDataTable extends StatelessWidget {
  int totalLifeInsurance;
  int totalHealthInsurance;
  int totalLiveStockInsurance;
  int totalOthersInsurance;
  int totalNotAvailable;
  int totalInsurance;

  InsuranceDataTable({
    super.key,
    required this.totalLifeInsurance,
    required this.totalHealthInsurance,
    required this.totalLiveStockInsurance,
    required this.totalOthersInsurance,
    required this.totalNotAvailable,
    required this.totalInsurance,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<InsuranceBloc, InsuranceState>(
        builder: (context, state) {
          if (state is InsuranceSuccessState) {
            List<InsuranceModel> fetchedInsuranceData = state.insuranceModel;
            return Card(
              child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.lifeInsurance)),
                  DataColumn(label: Text(l10n.healthInsurance)),
                  DataColumn(label: Text(l10n.liveStockInsurance)),
                  DataColumn(label: Text(l10n.othersInsurance)),
                  DataColumn(label: Text(l10n.noInsurance)),
                  DataColumn(label: Text(l10n.total)),
                ],
                rows: fetchedInsuranceData.asMap().entries.map((e) {
                  return DataRow(
                      color: MaterialStateProperty.resolveWith((states) {
                        if (e.key % 2 == 0) {
                          return Colors.grey.withOpacity(0.3);
                        } else {
                          return null;
                        }
                      }),
                      cells: [
                        DataCell(Text(e.value.wardNumber.toString())),
                        DataCell(
                            Text(e.value.lifeInsurance?.toString() ?? '-')),
                        DataCell(
                            Text(e.value.healthInsurance?.toString() ?? '-')),
                        DataCell(Text(
                            e.value.liveStockInsurance?.toString() ?? '-')),
                        DataCell(
                            Text(e.value.othersInsurance?.toString() ?? '-')),
                        DataCell(Text(e.value.notAvailable?.toString() ?? '-')),
                        DataCell(
                            Text(e.value.totalInsurance?.toString() ?? '-')),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: MaterialStateProperty.resolveWith<Color>((states) {
                        return Colors.grey.withOpacity(0.6);
                      }),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalLifeInsurance.toString())),
                        DataCell(Text(totalHealthInsurance.toString())),
                        DataCell(Text(totalLiveStockInsurance.toString())),
                        DataCell(Text(totalOthersInsurance.toString())),
                        DataCell(Text(totalNotAvailable.toString())),
                        DataCell(Text(totalInsurance.toString())),
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
