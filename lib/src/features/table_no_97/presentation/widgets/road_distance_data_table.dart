import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_localization/l10n.dart';
import '../../data/model/road_distance_model.dart';
import '../bloc/road_distance_bloc.dart';

class RoadDistanceDataTable extends StatelessWidget {
  int totalLessThanOneHours,
      totalTwoHours,
      totalUpToFiveHours,
      totalMoreThanFive,
      totalTotal;

  RoadDistanceDataTable(this.totalLessThanOneHours, this.totalTwoHours,
      this.totalUpToFiveHours, this.totalMoreThanFive, this.totalTotal,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<RoadDistanceBloc, RoadDistanceState>(
        builder: (context, state) {
          if (state is RoadDistanceLoadingState) {
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
          if (state is RoadDistanceSuccessState) {
            List<RoadDistanceModel> fetchedData = state.fetchedModel;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  columns: [
                    DataColumn(label: Text(l10n.wardnumber)),
                    DataColumn(label: Text(l10n.lessThanOneHours)),
                    DataColumn(label: Text(l10n.twoHours)),
                    DataColumn(label: Text(l10n.upToFiveHours)),
                    DataColumn(label: Text(l10n.moreThanFive)),
                    DataColumn(label: Text(l10n.total)),
                  ],
                  rows: fetchedData.asMap().entries.map((e) {
                    return DataRow(
                        color: WidgetStateProperty.resolveWith(
                            (Set<WidgetState> states) {
                          if (e.key % 2 == 0) {
                            return Colors.grey.withOpacity(0.3);
                          } else {
                            return null;
                          }
                        }),
                        cells: [
                          DataCell(Text(e.value.wardNumber.toString())),
                          DataCell(Text(
                              e.value.lessThanOneHours?.toString() ?? '0')),
                          DataCell(Text(e.value.twoHours?.toString() ?? '0')),
                          DataCell(
                              Text(e.value.upToFiveHours?.toString() ?? '0')),
                          DataCell(
                              Text(e.value.moreThanFive?.toString() ?? '0')),
                          DataCell(Text(e.value.total?.toString() ?? '0')),
                        ]);
                  }).toList()
                    ..add(DataRow(
                        color: WidgetStateProperty.resolveWith<Color>(
                            (states) => Colors.grey.withOpacity(0.6)),
                        cells: [
                          DataCell(Text(l10n.total)),
                          DataCell(Text(totalLessThanOneHours.toString())),
                          DataCell(Text(totalTwoHours.toString())),
                          DataCell(Text(totalUpToFiveHours.toString())),
                          DataCell(Text(totalMoreThanFive.toString())),
                          DataCell(Text(totalTotal.toString())),
                        ]))),
            );
          }
          if (state is RoadDistanceFailureState) {
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
