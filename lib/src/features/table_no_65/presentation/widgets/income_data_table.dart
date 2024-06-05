import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/income_model.dart';
import '../bloc/income_bloc.dart';

class IncomeDataTable extends StatelessWidget {
  int totalCrops,
      totalFruits,
      totalLivestock,
      totalVegi,
      totalHerbs,
      totalLabour,
      totalBusiness,
      totalForeignEmp,
      totalOffice,
      totalOthers,
      totalIncome;

  IncomeDataTable(
      this.totalCrops,
      this.totalFruits,
      this.totalLivestock,
      this.totalVegi,
      this.totalHerbs,
      this.totalLabour,
      this.totalBusiness,
      this.totalForeignEmp,
      this.totalOffice,
      this.totalOthers,
      this.totalIncome,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeBloc, IncomeState>(
      builder: (context, state) {
        if (state is IncomeSuccessState) {
          List<IncomeModel> fetchedData = state.fetchedModel;
          return Card(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.crops)),
                  DataColumn(label: Text(l10n.fruits)),
                  DataColumn(label: Text(l10n.livestock)),
                  DataColumn(label: Text(l10n.vegetables)),
                  DataColumn(label: Text(l10n.herbs)),
                  DataColumn(label: Text(l10n.labour)),
                  DataColumn(label: Text(l10n.business)),
                  DataColumn(label: Text(l10n.foreignEmp)),
                  DataColumn(label: Text(l10n.office)),
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
                        DataCell(Text(e.value.crops?.toString() ?? '-')),
                        DataCell(Text(e.value.fruits?.toString() ?? '-')),
                        DataCell(Text(e.value.livestock?.toString() ?? '-')),
                        DataCell(Text(e.value.vegi?.toString() ?? '-')),
                        DataCell(Text(e.value.medi?.toString() ?? '-')),
                        DataCell(Text(e.value.labour?.toString() ?? '-')),
                        DataCell(Text(e.value.business?.toString() ?? '-')),
                        DataCell(Text(e.value.foreignEmp?.toString() ?? '-')),
                        DataCell(Text(e.value.office?.toString() ?? '-')),
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
                        DataCell(Text(l10n.wardnumber)),
                        DataCell(Text(totalCrops.toString())),
                        DataCell(Text(totalFruits.toString())),
                        DataCell(Text(totalLivestock.toString())),
                        DataCell(Text(totalVegi.toString())),
                        DataCell(Text(totalHerbs.toString())),
                        DataCell(Text(totalLabour.toString())),
                        DataCell(Text(totalBusiness.toString())),
                        DataCell(Text(totalForeignEmp.toString())),
                        DataCell(Text(totalOffice.toString())),
                        DataCell(Text(totalOthers.toString())),
                        DataCell(Text(totalIncome.toString())),
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
