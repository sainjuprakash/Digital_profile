import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/toilet_model.dart';
import '../bloc/toilet_bloc.dart';

class ToiletDataTable extends StatelessWidget {
  int totalNoToilet;
  int totalPublicDhal;
  int totalSeftiTank;
  int totalOrdinary;
  int totalNotAvailable;
  int totalWardToilet;

  ToiletDataTable(this.totalNoToilet, this.totalPublicDhal, this.totalSeftiTank,
      this.totalOrdinary, this.totalNotAvailable, this.totalWardToilet,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<ToiletBloc, ToiletState>(
        builder: (context, state) {
          if (state is ToiletLoadingState) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is ToiletSuccessState) {
            List<ToiletModel> fetchedToiletData = state.toiletModel;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.noToilet)),
                  DataColumn(label: Text(l10n.publicDhal)),
                  DataColumn(label: Text(l10n.seftiTank)),
                  DataColumn(label: Text(l10n.ordinary)),
                  DataColumn(label: Text(l10n.notavailable)),
                  DataColumn(label: Text(l10n.total)),
                ],
                rows: fetchedToiletData.asMap().entries.map((e) {
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
                        DataCell(Text(e.value.wardNumber.toString() ?? '-')),
                        DataCell(Text(e.value.noToilet?.toString() ?? '-')),
                        DataCell(Text(e.value.publicDhal?.toString() ?? '-')),
                        DataCell(Text(e.value.seftiTank?.toString() ?? '-')),
                        DataCell(Text(e.value.ordinary?.toString() ?? '-')),
                        DataCell(Text(e.value.notAvailable?.toString() ?? '-')),
                        DataCell(Text(e.value.totalToilet?.toString() ?? '-')),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: MaterialStateProperty.resolveWith<Color>(
                          (states) => Colors.grey.withOpacity(0.6)),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalNoToilet.toString())),
                        DataCell(Text(totalPublicDhal.toString())),
                        DataCell(Text(totalSeftiTank.toString())),
                        DataCell(Text(totalOrdinary.toString())),
                        DataCell(Text(totalNotAvailable.toString())),
                        DataCell(Text(totalWardToilet.toString())),
                      ])),
              ),
            );
          }
          if (state is ToiletFailureState) {
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
