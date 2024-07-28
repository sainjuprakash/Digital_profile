import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/house_ownership_model.dart';
import '../bloc/house_ownership_bloc.dart';

class HouseOwnershipDataTable extends StatelessWidget {
  int totalPersonal;
  int totalRental;
  int totalOrganizational;
  int totalSukumbasi;
  int totalOthers;
  int totalNotAvailable;
  int totalOwnerShip;

  HouseOwnershipDataTable(
      this.totalPersonal,
      this.totalRental,
      this.totalOrganizational,
      this.totalSukumbasi,
      this.totalOthers,
      this.totalNotAvailable,
      this.totalOwnerShip,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<HouseOwnershipBloc, HouseOwnershipState>(
        builder: (context, state) {
          if (state is HouseOwnershipLoadingState) {
            return const SizedBox(
              height: 60,
              width: double.maxFinite,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          if (state is HouseOwnershipSuccessState) {
            List<HouseOwnershipModel> fetchedData = state.ownershipModel;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  columns: [
                    DataColumn(label: Text(l10n.wardnumber)),
                    DataColumn(label: Text(l10n.personal)),
                    DataColumn(label: Text(l10n.rental)),
                    DataColumn(label: Text(l10n.organizational)),
                    DataColumn(label: Text(l10n.sukumbasi)),
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
                          DataCell(Text(e.value.personal?.toString() ?? '-')),
                          DataCell(Text(e.value.rental?.toString() ?? '-')),
                          DataCell(
                              Text(e.value.organizational?.toString() ?? '-')),
                          DataCell(Text(e.value.sukumbasi?.toString() ?? '-')),
                          DataCell(Text(e.value.others?.toString() ?? '-')),
                          DataCell(
                              Text(e.value.notAvailable?.toString() ?? '-')),
                          DataCell(Text(e.value.total?.toString() ?? '-')),
                        ]);
                  }).toList()
                    ..add(DataRow(
                        color:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.grey.withOpacity(0.6);
                        }),
                        cells: [
                          DataCell(Text(l10n.total)),
                          DataCell(Text(totalPersonal.toString())),
                          DataCell(Text(totalRental.toString())),
                          DataCell(Text(totalOrganizational.toString())),
                          DataCell(Text(totalSukumbasi.toString())),
                          DataCell(Text(totalOthers.toString())),
                          DataCell(Text(totalNotAvailable.toString())),
                          DataCell(Text(totalOwnerShip.toString())),
                        ]))),
            );
          }
          if (state is HouseOwnershipFailureState) {
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
