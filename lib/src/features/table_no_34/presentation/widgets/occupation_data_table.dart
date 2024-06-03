import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/src/features/table_no_34/data/model/occupation_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/occupation_bloc.dart';

class OccupationDataTable extends StatelessWidget {
  int totalAgriculture,
      totalOffice,
      totalBusiness,
      totalWorker,
      totalEntrepreneur,
      totalForeignEmp,
      totalStudent,
      totalHousewife,
      totalUnemployed,
      totalUnderage,
      totalPension,
      totalTechnical,
      totalSenior,
      totalOthers,
      totalNotAvailable,
      totalOccupation;

  OccupationDataTable(
      this.totalAgriculture,
      this.totalOffice,
      this.totalBusiness,
      this.totalWorker,
      this.totalEntrepreneur,
      this.totalForeignEmp,
      this.totalStudent,
      this.totalHousewife,
      this.totalUnemployed,
      this.totalUnderage,
      this.totalPension,
      this.totalTechnical,
      this.totalSenior,
      this.totalOthers,
      this.totalNotAvailable,
      this.totalOccupation,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OccupationBloc, OccupationState>(
      builder: (context, state) {
        if (state is OccupationSuccessState) {
          List<OccupationModel> fetchedData = state.fetchedModel;
          return Card(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columns: [
                        DataColumn(label: Text(l10n.wardnumber)),
                        DataColumn(label: Text('${l10n.agriculture}\nपशुपालन')),
                        DataColumn(label: Text(l10n.office)),
                        DataColumn(label: Text(l10n.business)),
                        DataColumn(label: Text(l10n.worker)),
                        DataColumn(label: Text('${l10n.entrepreneur}\nकार्य')),
                        DataColumn(label: Text('${l10n.foreignEmp}\nरोजगारी')),
                        DataColumn(label: Text(l10n.student)),
                        DataColumn(label: Text(l10n.houseWife)),
                        DataColumn(label: Text(l10n.unemployed)),
                        DataColumn(label: Text(l10n.underage)),
                        DataColumn(label: Text(l10n.pension)),
                        DataColumn(label: Text(l10n.technical)),
                        DataColumn(label: Text(l10n.seniorCtzn)),
                        DataColumn(label: Text(l10n.others)),
                        DataColumn(label: Text(l10n.notavailable)),
                        DataColumn(label: Text(l10n.total)),
                      ],
                      rows: fetchedData.asMap().entries.map((e) {
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
                                  Text(e.value.agriculture?.toString() ?? '-')),
                              DataCell(Text(e.value.office?.toString() ?? '-')),
                              DataCell(
                                  Text(e.value.business?.toString() ?? '-')),
                              DataCell(Text(e.value.worker?.toString() ?? '-')),
                              DataCell(Text(
                                  e.value.entrepreneur?.toString() ?? '-')),
                              DataCell(
                                  Text(e.value.foreignEmp?.toString() ?? '-')),
                              DataCell(
                                  Text(e.value.student?.toString() ?? '-')),
                              DataCell(
                                  Text(e.value.houseWife?.toString() ?? '-')),
                              DataCell(
                                  Text(e.value.unemployed?.toString() ?? '-')),
                              DataCell(
                                  Text(e.value.underage?.toString() ?? '-')),
                              DataCell(
                                  Text(e.value.pension?.toString() ?? '-')),
                              DataCell(
                                  Text(e.value.technical?.toString() ?? '-')),
                              DataCell(
                                  Text(e.value.seniorCtzn?.toString() ?? '-')),
                              DataCell(Text(e.value.others?.toString() ?? '-')),
                              DataCell(Text(
                                  e.value.notAvailable?.toString() ?? '-')),
                              DataCell(Text(e.value.total?.toString() ?? '-')),
                            ]);
                      }).toList()
                        ..add(DataRow(
                            color: MaterialStateProperty.resolveWith<Color>(
                                (states) {
                              return Colors.grey.withOpacity(0.6);
                            }),
                            cells: [
                              DataCell(Text(l10n.total)),
                              DataCell(Text(totalAgriculture.toString())),
                              DataCell(Text(totalOffice.toString())),
                              DataCell(Text(totalBusiness.toString())),
                              DataCell(Text(totalWorker.toString())),
                              DataCell(Text(totalEntrepreneur.toString())),
                              DataCell(Text(totalForeignEmp.toString())),
                              DataCell(Text(totalStudent.toString())),
                              DataCell(Text(totalHousewife.toString())),
                              DataCell(Text(totalUnemployed.toString())),
                              DataCell(Text(totalUnderage.toString())),
                              DataCell(Text(totalPension.toString())),
                              DataCell(Text(totalTechnical.toString())),
                              DataCell(Text(totalSenior.toString())),
                              DataCell(Text(totalOthers.toString())),
                              DataCell(Text(totalNotAvailable.toString())),
                              DataCell(Text(totalOccupation.toString())),
                            ])))));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
