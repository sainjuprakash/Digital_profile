import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/religion_model.dart';
import '../bloc/religion_bloc.dart';

class ReligionDataTable extends StatelessWidget {
  int totalHindu;
  int totalBoudha;
  int totalChristian;
  int totalMuslim;
  int totalKirat;
  int totalJains;
  int totalBon;
  int totalOthers;
  int totalNotAvailable;
  int totalWardRel;

  ReligionDataTable(
      {super.key,
      required this.totalHindu,
      required this.totalBoudha,
      required this.totalChristian,
      required this.totalMuslim,
      required this.totalKirat,
      required this.totalJains,
      required this.totalBon,
      required this.totalOthers,
      required this.totalNotAvailable,
      required this.totalWardRel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<ReligionBloc, ReligionState>(
        builder: (context, state) {
          if (state is ReligionLoadingState) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (state is ReligionSuccessState) {
            List<ReligionModel> fetchedReligionData = state.religionModel;
            return Card(
              child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.hindu)),
                  DataColumn(label: Text(l10n.boudha)),
                  DataColumn(label: Text(l10n.christian)),
                  DataColumn(label: Text(l10n.muslim)),
                  DataColumn(label: Text(l10n.kirat)),
                  DataColumn(label: Text(l10n.jains)),
                  DataColumn(label: Text(l10n.bon)),
                  DataColumn(label: Text(l10n.others)),
                  DataColumn(label: Text(l10n.notavailable)),
                  DataColumn(label: Text(l10n.totalreligion)),
                ],
                rows: fetchedReligionData.asMap().entries.map((e) {
                  return DataRow(
                      color: MaterialStateProperty.resolveWith((states) {
                        if (e.key % 2 == 0) {
                          return Colors.grey.withOpacity(0.3);
                        } else {
                          return null;
                        }
                      }),
                      cells: [
                        DataCell(Text(e.value.wardNumber.toString() ?? '-')),
                        DataCell(Text(e.value.hindu?.toString() ?? '-')),
                        DataCell(Text(e.value.boudha?.toString() ?? '-')),
                        DataCell(Text(e.value.christian?.toString() ?? '-')),
                        DataCell(Text(e.value.muslim?.toString() ?? '-')),
                        DataCell(Text(e.value.kirat?.toString() ?? '-')),
                        DataCell(Text(e.value.jains?.toString() ?? '-')),
                        DataCell(Text(e.value.bon?.toString() ?? '-')),
                        DataCell(Text(e.value.others?.toString() ?? '-')),
                        DataCell(Text(e.value.notAvailable?.toString() ?? '-')),
                        DataCell(Text(e.value.wardRelCount?.toString() ?? '-')),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: MaterialStateProperty.resolveWith((states) {
                        return Colors.grey.withOpacity(0.6);
                      }),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalHindu.toString())),
                        DataCell(Text(totalBoudha.toString())),
                        DataCell(Text(totalChristian.toString())),
                        DataCell(Text(totalMuslim.toString())),
                        DataCell(Text(totalKirat.toString())),
                        DataCell(Text(totalJains.toString())),
                        DataCell(Text(totalBon.toString())),
                        DataCell(Text(totalOthers.toString())),
                        DataCell(Text(totalNotAvailable.toString())),
                        DataCell(Text(totalWardRel.toString())),
                      ])),
              ),
            );
          }
          if (state is ReligionFailureState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(l10n.loadDataFail),
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
