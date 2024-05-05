import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/ethnicity_model.dart';
import '../bloc/ethnicity_bloc.dart';

class EthnicityDataTable extends StatelessWidget {
  int totalMuslim;
  int totalHillBrahman;
  int totalTeraiBrahman;
  int totalHillJanajati;
  int totalTeraiJanajati;
  int totalHillDalit;
  int totalNotAvailable;
  int totalTotalEthnicity;
  EthnicityDataTable(
      {super.key,
      required this.totalMuslim,
      required this.totalHillBrahman,
      required this.totalTeraiBrahman,
      required this.totalHillJanajati,
      required this.totalTeraiJanajati,
      required this.totalHillDalit,
      required this.totalNotAvailable,
      required this.totalTotalEthnicity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BlocBuilder<EthnicityBloc, EthnicityState>(
          builder: (context, state) {
            if (state is EthnicitySuccessState) {
              List<EthnicityModel> fetchedEthnicityData =
                  state.fetchedEthnicityModel;
              return DataTable(
                  columns: [
                    DataColumn(label: Text(l10n.wardnumber)),
                    DataColumn(label: Text(l10n.hillbrahmen)),
                    DataColumn(label: Text(l10n.teraiBrahman)),
                    DataColumn(label: Text(l10n.hillJanajati)),
                    DataColumn(label: Text(l10n.teraiJanajati)),
                    DataColumn(label: Text(l10n.hillDalit)),
                    DataColumn(label: Text(l10n.muslim)),
                    DataColumn(label: Text(l10n.notavailable)),
                    DataColumn(label: Text(l10n.total)),
                  ],
                  rows: fetchedEthnicityData.asMap().entries.map((e) {
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
                          DataCell(
                              Text(e.value.hillBrahman?.toString() ?? '-')),
                          DataCell(
                              Text(e.value.teraiBrahman?.toString() ?? '-')),
                          DataCell(
                              Text(e.value.hillJanajati?.toString() ?? '-')),
                          DataCell(
                              Text(e.value.teraiJanajati?.toString() ?? '-')),
                          DataCell(Text(e.value.hillDalit?.toString() ?? '-')),
                          DataCell(Text(e.value.muslim?.toString() ?? '-')),
                          DataCell(
                              Text(e.value.notAvailable?.toString() ?? '-')),
                          DataCell(
                              Text(e.value.totalEthnicity?.toString() ?? '-')),
                        ]);
                  }).toList()
                    ..add(DataRow(cells: [
                      DataCell(Text(l10n.total)),
                      DataCell(Text(totalHillBrahman.toString())),
                      DataCell(Text(totalTeraiBrahman.toString())),
                      DataCell(Text(totalHillJanajati.toString())),
                      DataCell(Text(totalTeraiJanajati.toString())),
                      DataCell(Text(totalHillDalit.toString())),
                      DataCell(Text(totalMuslim.toString())),
                      DataCell(Text(totalNotAvailable.toString())),
                      DataCell(Text(totalTotalEthnicity.toString())),
                    ])));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
