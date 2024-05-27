import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_localization/l10n.dart';
import '../../data/model/disability_model.dart';
import '../bloc/disability_bloc.dart';

class DisabilityDataTable extends StatelessWidget {
  int totalAble;
  int totalDisable;
  int totalDeaf;
  int totalBlind;
  int totalHearingLoss;
  int totalSlammer;
  int totalCeleberal;
  int totalRetarded;
  int totalMental;
  int totalMultiDisable;
  int totalNotAvailable;
  int totalWardDis;
  DisabilityDataTable(
      {super.key,
      required this.totalAble,
      required this.totalDisable,
      required this.totalDeaf,
      required this.totalBlind,
      required this.totalHearingLoss,
      required this.totalSlammer,
      required this.totalCeleberal,
      required this.totalRetarded,
      required this.totalMental,
      required this.totalMultiDisable,
      required this.totalNotAvailable,
      required this.totalWardDis});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(child: BlocBuilder<DisabilityBloc, DisabilityState>(
          builder: (context, state) {
            if (state is DisabilitySuccessState) {
              List<DisabilityModel> fetchedDisabilityData =
                  state.disabilityModel;
              return DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.able)),
                  DataColumn(label: Text(l10n.disable)),
                  DataColumn(label: Text(l10n.deaf)),
                  DataColumn(label: Text(l10n.blind)),
                  DataColumn(label: Text(l10n.hearingloss)),
                  DataColumn(label: Text(l10n.slammer)),
                  DataColumn(label: Text(l10n.celeberal)),
                  DataColumn(label: Text(l10n.retarded)),
                  DataColumn(label: Text(l10n.mental)),
                  DataColumn(label: Text(l10n.multidisable)),
                  DataColumn(label: Text(l10n.others)),
                  DataColumn(label: Text(l10n.total))
                ],
                rows: fetchedDisabilityData.asMap().entries.map((e) {
                  return DataRow(
                      color: MaterialStateProperty.resolveWith((states) {
                        if (e.key % 2 == 0) {
                          return Colors.grey.withOpacity(0.3);
                        } else {
                          return null;
                        }
                      }),
                      cells: [
                        DataCell(
                          Text(e.value.wardNumber.toString()),
                        ),
                        DataCell(
                          Text(e.value.able?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.disable?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.deaf?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.blind?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.hearingLoss?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.slammer?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.celeberal?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.redarded?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.mental?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.multiDisable?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.notAvailable?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(
                              e.value.totalDisabilityStatus?.toString() ?? '-'),
                        ),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: MaterialStateProperty.resolveWith(
                          (states) => Colors.grey.withOpacity(0.6)),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalAble.toString())),
                        DataCell(Text(totalDisable.toString())),
                        DataCell(Text(totalDeaf.toString())),
                        DataCell(Text(totalBlind.toString())),
                        DataCell(Text(totalHearingLoss.toString())),
                        DataCell(Text(totalSlammer.toString())),
                        DataCell(Text(totalCeleberal.toString())),
                        DataCell(Text(totalRetarded.toString())),
                        DataCell(Text(totalMental.toString())),
                        DataCell(Text(totalMultiDisable.toString())),
                        DataCell(Text(totalNotAvailable.toString())),
                        DataCell(Text(totalWardDis.toString())),
                      ])),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        )),
      ),
    );
    ;
  }
}
