import 'package:digital_profile/src/features/house_roof_condition/data/model/house_condition_model.dart';
import 'package:digital_profile/src/features/house_roof_condition/presentation/bloc/house_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_localization/l10n.dart';

class HouseRoofDataTable extends StatelessWidget {
  int totalKhar;
  int totalJasta;
  int totalStoneTile;
  int totalRcc;
  int totalWood;
  int totalMud;
  int totalOthers;
  int totalNotAvailable;
  int totalWardRoof;

  HouseRoofDataTable(
      this.totalKhar,
      this.totalJasta,
      this.totalStoneTile,
      this.totalRcc,
      this.totalWood,
      this.totalMud,
      this.totalOthers,
      this.totalNotAvailable,
      this.totalWardRoof,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<HouseBloc, HouseState>(
        builder: (context, state) {
          if (state is HouseSuccessState) {
            List<HouseConditionModel> fetchedRoofData = state.houseModel;
            return Card(
              child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text('${l10n.khar} ${l10n.roof}')),
                  DataColumn(label: Text('${l10n.jasta} ${l10n.roof}')),
                  DataColumn(label: Text('${l10n.stoneRoof} ${l10n.roof}')),
                  DataColumn(label: Text(l10n.rcc)),
                  DataColumn(label: Text('${l10n.wood} ${l10n.roof}')),
                  DataColumn(label: Text('${l10n.mud} ${l10n.roof}')),
                  DataColumn(label: Text(l10n.others)),
                  DataColumn(label: Text(l10n.notavailable)),
                  DataColumn(label: Text(l10n.others)),
                ],
                rows: fetchedRoofData.asMap().entries.map((e) {
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
                        DataCell(Text(e.value.khar?.toString() ?? '-')),
                        DataCell(Text(e.value.jasta?.toString() ?? '-')),
                        DataCell(Text(e.value.stoneTile?.toString() ?? '-')),
                        DataCell(Text(e.value.rcc?.toString() ?? '-')),
                        DataCell(Text(e.value.wood?.toString() ?? '-')),
                        DataCell(Text(e.value.mud?.toString() ?? '-')),
                        DataCell(Text(e.value.others?.toString() ?? '-')),
                        DataCell(Text(e.value.notAvailable?.toString() ?? '-')),
                        DataCell(Text(e.value.totalRoof?.toString() ?? '-')),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: MaterialStateProperty.resolveWith<Color>((states) {
                        return Colors.grey.withOpacity(0.6);
                      }),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalKhar.toString())),
                        DataCell(Text(totalJasta.toString())),
                        DataCell(Text(totalStoneTile.toString())),
                        DataCell(Text(totalRcc.toString())),
                        DataCell(Text(totalWood.toString())),
                        DataCell(Text(totalMud.toString())),
                        DataCell(Text(totalOthers.toString())),
                        DataCell(Text(totalNotAvailable.toString())),
                        DataCell(Text(totalWardRoof.toString())),
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
