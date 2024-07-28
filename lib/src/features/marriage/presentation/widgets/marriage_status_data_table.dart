import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/marriage_status_model.dart';
import '../bloc/marriage_status_bloc.dart';

class MarriageDatatable extends StatelessWidget {
  int totalSingleCount;
  int totalMarriedCount;
  int totalSingleWoman;
  int totalSingleManCount;
  int totalPolygami;
  int totalDivorced;
  int totalRemarried;
  int totalSeperated;
  int totalUnderage;
  int totalNotAvailable;
  int totalMaritalStatus;

  MarriageDatatable(
      {super.key,
      required this.totalSingleCount,
      required this.totalMarriedCount,
      required this.totalSingleWoman,
      required this.totalSingleManCount,
      required this.totalPolygami,
      required this.totalDivorced,
      required this.totalRemarried,
      required this.totalSeperated,
      required this.totalUnderage,
      required this.totalNotAvailable,
      required this.totalMaritalStatus});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<MarriageStatusBloc, MarriageStatusState>(
        builder: (context, state) {
          if (state is MarriageLoadingState) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (state is MarriageSuccessState) {
            List<MarriageStatusModel> fetchedMarriageData = state.marriageModel;
            return Card(
              child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.single)),
                  DataColumn(label: Text(l10n.married)),
                  DataColumn(label: Text(l10n.polygami)),
                  DataColumn(label: Text(l10n.remarried)),
                  DataColumn(
                      label: Text("${l10n.singleman},${l10n.singlewomen}")),
                  DataColumn(label: Text(l10n.divorced)),
                  DataColumn(label: Text(l10n.seperated)),
                  DataColumn(label: Text(l10n.underage)),
                  DataColumn(label: Text(l10n.notavailable)),
                  DataColumn(label: Text(l10n.total))
                ],
                rows: fetchedMarriageData.asMap().entries.map((e) {
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
                        DataCell(Text(e.value.single?.toString() ?? '-')),
                        DataCell(Text(e.value.married?.toString() ?? '-')),
                        DataCell(Text(e.value.polygami?.toString() ?? '-')),
                        DataCell(Text(e.value.remarried?.toString() ?? '-')),
                        DataCell(Text(e.value.singleWoman?.toString() ?? '-')),
                        DataCell(Text(e.value.divorced?.toString() ?? '-')),
                        DataCell(Text(e.value.seperated?.toString() ?? '-')),
                        DataCell(Text(e.value.underage?.toString() ?? '-')),
                        DataCell(Text(e.value.notAvailable?.toString() ?? '-')),
                        DataCell(Text(
                            e.value.totalMaritalStatus?.toString() ?? '-')),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: MaterialStateProperty.resolveWith<Color>((states) {
                        return Colors.grey.withOpacity(0.6);
                      }),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalSingleCount.toString())),
                        DataCell(Text(totalMarriedCount.toString())),
                        DataCell(Text(totalPolygami.toString())),
                        DataCell(Text(totalRemarried.toString())),
                        DataCell(Text(totalSingleWoman.toString())),
                        DataCell(Text(totalDivorced.toString())),
                        DataCell(Text(totalSeperated.toString())),
                        DataCell(Text(totalUnderage.toString())),
                        DataCell(Text(totalNotAvailable.toString())),
                        DataCell(Text(totalMaritalStatus.toString())),
                      ])),
              ),
            );
          }
          if (state is MarriageFailureState) {
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
