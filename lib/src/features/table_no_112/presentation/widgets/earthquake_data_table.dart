import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/earthquake_model.dart';
import '../bloc/earthquake_bloc.dart';

class EarthquakeDataTable extends StatelessWidget {
  int totalIsDamaged, totalIsNotDamaged, totalNotAvailable, totalDamaged = 0;
  EarthquakeDataTable(this.totalIsDamaged, this.totalIsNotDamaged,
      this.totalNotAvailable, this.totalDamaged,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EarthquakeBloc, EarthquakeState>(
      builder: (context, state) {
        if (state is EarthquakeSuccessState) {
          List<EarthquakeModel> fetchedData = state.fetchedModel;
          return Card(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.haveChildWorker)),
                  DataColumn(label: Text(l10n.haveNoChildWorker)),
                  DataColumn(label: Text(l10n.Undisclosed)),
                  DataColumn(label: Text(l10n.total)),
                ],
                rows: fetchedData.asMap().entries.map((e) {
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
                        DataCell(Text(e.value.wardNumber.toString() ?? '0')),
                        DataCell(Text(e.value.isDamaged?.toString() ?? '0')),
                        DataCell(Text(e.value.isNotDamages?.toString() ?? '0')),
                        DataCell(Text(e.value.notAvailable?.toString() ?? '0')),
                        DataCell(Text(e.value.total?.toString() ?? '0')),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: MaterialStateProperty.resolveWith<Color>(
                          (states) => Colors.grey.withOpacity(0.6)),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalIsDamaged.toString())),
                        DataCell(Text(totalIsNotDamaged.toString())),
                        DataCell(Text(totalNotAvailable.toString())),
                        DataCell(Text(totalDamaged.toString())),
                      ]))),
          ));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
