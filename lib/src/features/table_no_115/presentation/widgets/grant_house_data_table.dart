import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/src/features/table_no_115/data/model/grant_house_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/grant_house_bloc.dart';

class GrantHouseDataTable extends StatelessWidget {
  int totalHasBuild, totalHasNotBuild, totalNotAvailable, totalTotal;

  GrantHouseDataTable(this.totalHasBuild, this.totalHasNotBuild,
      this.totalNotAvailable, this.totalTotal,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GrantHouseBloc, GrantHouseState>(
      builder: (context, state) {
        if (state is GrantHouseSuccessState) {
          List<GrantHouseModel> fetchedData = state.fetchedModel;
          return Card(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.hasBuild)),
                  DataColumn(label: Text(l10n.hasNotBuild)),
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
                        DataCell(Text(e.value.hasBuild?.toString() ?? '0')),
                        DataCell(Text(e.value.hasNotBuild?.toString() ?? '0')),
                        DataCell(Text(e.value.notAvailable?.toString() ?? '0')),
                        DataCell(Text(e.value.total?.toString() ?? '0')),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: MaterialStateProperty.resolveWith<Color>(
                          (states) => Colors.grey.withOpacity(0.6)),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalHasBuild.toString())),
                        DataCell(Text(totalHasNotBuild.toString())),
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
