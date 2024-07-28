import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/electricity_model.dart';
import '../bloc/electricity_bloc.dart';

class ElectricityDataTable extends StatelessWidget {
  int totalKerosene;
  int totalBioGas;
  int totalSolar;
  int totalElectricityLaghu;
  int totalElectricityNational;
  int totalElectricityOthers;
  int totalNotAvailable;
  int totalHouseCount;

  ElectricityDataTable(
      {super.key,
      required this.totalKerosene,
      required this.totalBioGas,
      required this.totalSolar,
      required this.totalElectricityLaghu,
      required this.totalElectricityNational,
      required this.totalElectricityOthers,
      required this.totalNotAvailable,
      required this.totalHouseCount});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElectricityBloc, ElectricityState>(
      builder: (context, state) {
        if (state is ElectricityLoadingState) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is ElectricitySuccessState) {
          List<ElectricityModel> fetchedElectricityModel =
              state.electricityModel;
          return Card(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  columns: [
                    DataColumn(label: Text(l10n.wardnumber)),
                    DataColumn(label: Text(l10n.kerosene)),
                    DataColumn(label: Text(l10n.bioGas)),
                    DataColumn(label: Text(l10n.solar)),
                    DataColumn(label: Text(l10n.electricityLaghu)),
                    DataColumn(label: Text(l10n.electricityNational)),
                    DataColumn(label: Text(l10n.electricityOthers)),
                    DataColumn(label: Text(l10n.notavailable)),
                    DataColumn(label: Text(l10n.total)),
                  ],
                  rows: fetchedElectricityModel.asMap().entries.map((e) {
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
                          DataCell(Text(e.value.kerosene?.toString() ?? '-')),
                          DataCell(Text(e.value.bioGas?.toString() ?? '-')),
                          DataCell(Text(e.value.solar?.toString() ?? '-')),
                          DataCell(Text(
                              e.value.electricityLaghu?.toString() ?? '-')),
                          DataCell(Text(
                              e.value.electricityNational?.toString() ?? '-')),
                          DataCell(Text(e.value.others?.toString() ?? '-')),
                          DataCell(
                              Text(e.value.notAvailable?.toString() ?? '-')),
                          DataCell(
                              Text(e.value.totalHouseCount?.toString() ?? '-')),
                        ]);
                  }).toList()
                    ..add(DataRow(
                        color: MaterialStateProperty.resolveWith<Color>(
                            (states) => Colors.grey.withOpacity(0.6)),
                        cells: [
                          DataCell(Text(l10n.total)),
                          DataCell(Text(totalKerosene.toString())),
                          DataCell(Text(totalBioGas.toString())),
                          DataCell(Text(totalSolar.toString())),
                          DataCell(Text(totalElectricityLaghu.toString())),
                          DataCell(Text(totalElectricityNational.toString())),
                          DataCell(Text(totalElectricityOthers.toString())),
                          DataCell(Text(totalNotAvailable.toString())),
                          DataCell(Text(totalHouseCount.toString())),
                        ]))),
            ),
          );
        }
        if (state is ElectricityFailureState) {
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
    );
  }
}
