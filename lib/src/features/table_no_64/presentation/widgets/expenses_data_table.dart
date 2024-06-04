import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/expenses_model.dart';
import '../bloc/expenses_bloc.dart';

class ExpensesDataTable extends StatelessWidget {
  int totalClothes,
      totalEducation,
      totalHealth,
      totalFestival,
      totalAgriculture,
      totalOthers,
      totalExpenses;

  ExpensesDataTable(
      this.totalClothes,
      this.totalEducation,
      this.totalHealth,
      this.totalFestival,
      this.totalAgriculture,
      this.totalOthers,
      this.totalExpenses,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesBloc, ExpensesState>(
      builder: (context, state) {
        if (state is ExpensesSuccessState) {
          List<ExpensesModel> fetchedData = state.fetchedModel;
          return Card(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  columns: [
                    DataColumn(label: Text(l10n.wardnumber)),
                    DataColumn(label: Text(l10n.clothes)),
                    DataColumn(label: Text(l10n.education)),
                    DataColumn(label: Text(l10n.health)),
                    DataColumn(label: Text(l10n.festival)),
                    DataColumn(label: Text(l10n.agriculture)),
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
                          DataCell(Text(e.value.clothes?.toString() ?? '-')),
                          DataCell(Text(e.value.education?.toString() ?? '-')),
                          DataCell(Text(e.value.health?.toString() ?? '-')),
                          DataCell(Text(e.value.festival?.toString() ?? '-')),
                          DataCell(
                              Text(e.value.agriculture?.toString() ?? '-')),
                          DataCell(Text(e.value.others?.toString() ?? '-')),
                          DataCell(
                              Text(e.value.totalExpenses?.toString() ?? '-')),
                        ]);
                  }).toList()
                    ..add(DataRow(
                        color: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return Colors.grey.withOpacity(0.6);
                        }),
                        cells: [
                          DataCell(Text(l10n.total)),
                          DataCell(Text(totalClothes.toString())),
                          DataCell(Text(totalEducation.toString())),
                          DataCell(Text(totalHealth.toString())),
                          DataCell(Text(totalFestival.toString())),
                          DataCell(Text(totalAgriculture.toString())),
                          DataCell(Text(totalOthers.toString())),
                          DataCell(Text(totalExpenses.toString())),
                        ]))),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
