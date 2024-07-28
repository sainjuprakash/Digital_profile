import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/src/features/table_no_33/data/model/earthquake_resistance_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/earthquake_resistance_bloc.dart';

class EarthquakeResistanceDataTable extends StatelessWidget {
  int totalResistance, totalNotResistance, totalResistanceData;
  EarthquakeResistanceDataTable(
      this.totalResistance, this.totalNotResistance, this.totalResistanceData,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<EarthquakeResistanceBloc, EarthquakeResistanceState>(
        builder: (context, state) {
          if (state is EarthquakeResistanceInitialState) {
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
          if (state is EarthquakeResistanceSuccessState) {
            List<EarthquakeResistanceModel> fetchedData = state.fetchedModel;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  columns: [
                    DataColumn(label: Text(l10n.wardnumber)),
                    DataColumn(label: Text(l10n.resistance)),
                    DataColumn(label: Text(l10n.notResistance)),
                    DataColumn(label: Text(l10n.total)),
                  ],
                  rows: fetchedData.asMap().entries.map((e) {
                    return DataRow(
                        color: WidgetStateProperty.resolveWith((states) {
                          if (e.key % 2 == 0) {
                            return Colors.grey.withOpacity(0.3);
                          } else {
                            return null;
                          }
                        }),
                        cells: [
                          DataCell(Text(e.value.wardNumber.toString())),
                          DataCell(
                              Text(e.value.earthquakeResistance.toString())),
                          DataCell(
                              Text(e.value.notEarthquakeResistance.toString())),
                          DataCell(Text(e.value.total.toString())),
                        ]);
                  }).toList()
                    ..add(DataRow(
                        color: WidgetStateProperty.resolveWith<Color>((states) {
                          return Colors.grey.withOpacity(0.6);
                        }),
                        cells: [
                          DataCell(Text(l10n.total)),
                          DataCell(Text(totalResistance.toString())),
                          DataCell(Text(totalNotResistance.toString())),
                          DataCell(Text(totalResistanceData.toString())),
                        ]))),
            );
          }
          if (state is EarthquakeResistanceFailureState) {
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
