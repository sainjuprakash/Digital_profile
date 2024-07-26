import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/animals_model.dart';
import '../bloc/animals_bloc.dart';

class AnimalDataTable extends StatelessWidget {
  int totalHouses;
  int totalBirds;
  int totalLiveStock;
  int totalNoAnimals;

  AnimalDataTable(this.totalBirds, this.totalLiveStock, this.totalHouses,
      this.totalNoAnimals,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimalsBloc, AnimalsState>(
      builder: (context, state) {
        if (state is AnimalsSuccessState) {
          List<AnimalsModel> fetchedAnimalsData = state.fetchedAnimalsModel;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Card(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text(l10n.wardnumber)),
                    DataColumn(label: Text(l10n.birds)),
                    DataColumn(label: Text(l10n.animals)),
                   // DataColumn(label: Text(l10n.noAnimals)),
                    DataColumn(label: Text(l10n.total)),
                  ],
                  rows: fetchedAnimalsData.asMap().entries.map((e) {
                    int totalNoAnimals = e.value.wardHouses! -
                        (e.value.wardBirds! + e.value.wardLivestock!);
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
                          DataCell(Text(e.value.wardBirds?.toString() ?? '-')),
                          DataCell(Text(e.value.wardLivestock.toString())),
                         // DataCell(Text(totalNoAnimals.toString())),
                          DataCell(Text(e.value.wardHouses.toString())),
                        ]);
                  }).toList()
                    ..add(DataRow(
                        color: MaterialStateProperty.resolveWith(
                            (states) => Colors.grey.withOpacity(0.6)),
                        cells: [
                          DataCell(Text(l10n.total)),
                          DataCell(Text(totalBirds.toString())),
                          DataCell(Text(totalLiveStock.toString())),
                         // DataCell(Text(totalNoAnimals.toString())),
                          DataCell(Text(totalHouses.toString())),
                        ])),
                ),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
