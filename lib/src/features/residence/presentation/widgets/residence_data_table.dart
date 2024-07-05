import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/residence_model.dart';
import '../bloc/residence_bloc.dart';

class ResidenceDataTable extends StatelessWidget {
  int totalDefault;
  int totalForeign;
  int totalCountrySide;
  int totalNotAvailable;
  int totalLivingStatus;

  ResidenceDataTable(
      {super.key,
      required this.totalDefault,
      required this.totalForeign,
      required this.totalCountrySide,
      required this.totalNotAvailable,
      required this.totalLivingStatus});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BlocBuilder<ResidenceBloc, ResidenceState>(
          builder: (context, state) {
            if (state is ResidenceSuccessState) {
              List<ResidenceModel> fetchedResidenceData =
                  state.fetchedResidenceModel;
              return Card(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text(l10n.wardnumber)),
                    DataColumn(label: Text(l10n.defaultresidence)),
                    DataColumn(label: Text(l10n.countryside)),
                    DataColumn(label: Text(l10n.foreign)),
                    DataColumn(label: Text(l10n.notavailable)),
                    DataColumn(label: Text(l10n.total)),
                  ],
                  rows: fetchedResidenceData.asMap().entries.map((e) {
                    return DataRow(
                        color: MaterialStateProperty.resolveWith((states) {
                          if (e.key % 2 == 0) {
                            return Colors.grey.withOpacity(0.3);
                          } else {
                            return null;
                          }
                        }),
                        cells: [
                          DataCell(Text("   ${e.value.wardNumber.toString()}")),
                          DataCell(Text(
                              "             ${e.value.lsDefault?.toString() ?? '-'}")),
                          DataCell(Text(
                              "            ${e.value.lsCountrySide?.toString() ?? '-'}")),
                          DataCell(Text(
                              "       ${e.value.lsForeign?.toString() ?? '-'}")),
                          DataCell(Text(
                              "          ${e.value.lsNotAvailable?.toString() ?? '-'}")),
                          DataCell(Text(
                              e.value.lsTotalLivingStatus?.toString() ?? '-')),
                        ]);
                  }).toList()
                    ..add(DataRow(
                        color:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.grey.withOpacity(0.6);
                        }),
                        cells: [
                          DataCell(Text(l10n.total)),
                          DataCell(
                              Text("             ${totalDefault.toString()}")),
                          DataCell(Text(
                              "            ${totalCountrySide.toString()}")),
                          DataCell(Text("       ${totalForeign.toString()}")),
                          DataCell(Text(
                              "           ${totalNotAvailable.toString()}")),
                          DataCell(Text(totalLivingStatus.toString()))
                        ])),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
