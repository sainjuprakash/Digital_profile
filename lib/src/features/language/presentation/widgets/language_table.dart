import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_localization/l10n.dart';
import '../../data/models/language_model.dart';
import '../bloc/language_bloc.dart';

class LanguageTable extends StatelessWidget {
  int totalNepali = 0;
  int totalTamang = 0;
  int totalSherpa = 0;
  int totalLimbu = 0;
  int totalRai = 0;
  int totalGurung = 0;
  int totalGhale = 0;
  int totalOthers = 0;
  int totalNotAvailable = 0;
  int totalTotal = 0;

  LanguageTable(
      {super.key,
      required this.totalNepali,
      required this.totalTamang,
      required this.totalSherpa,
      required this.totalLimbu,
      required this.totalRai,
      required this.totalGurung,
      required this.totalGhale,
      required this.totalOthers,
      required this.totalNotAvailable,
      required this.totalTotal});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoadingState) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (state is LanguageLoadedState) {
            List<LanguageModel> fetchedLanguageData =
                state.fetchedLanguageModel;
            return Card(
              child: DataTable(
                  columns: [
                    DataColumn(label: Text(l10n.wardnumber)),
                    DataColumn(label: Text(l10n.nepali)),
                    DataColumn(label: Text(l10n.tamang)),
                    DataColumn(label: Text(l10n.sherpa)),
                    DataColumn(label: Text(l10n.limbu)),
                    DataColumn(label: Text(l10n.rai)),
                    DataColumn(label: Text(l10n.gurung)),
                    DataColumn(label: Text(l10n.ghale)),
                    DataColumn(label: Text(l10n.others)),
                    DataColumn(label: Text(l10n.notavailable)),
                    DataColumn(label: Text(l10n.total)),
                  ],
                  rows: fetchedLanguageData.asMap().entries.map((languageData) {
                    return DataRow(
                        color: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> state) {
                          if (languageData.key % 2 == 0) {
                            return Colors.grey.withOpacity(0.3);
                          } else {
                            return null;
                          }
                        }),
                        cells: [
                          DataCell(Text(languageData.value.wardNo.toString())),
                          DataCell(Text(
                              languageData.value.nepali?.toString() ?? '-')),
                          DataCell(Text(
                              languageData.value.tamang?.toString() ?? '-')),
                          DataCell(Text(
                              languageData.value.sherpa?.toString() ?? '-')),
                          DataCell(Text(
                              languageData.value.limbu?.toString() ?? '-')),
                          DataCell(
                              Text(languageData.value.rai?.toString() ?? '-')),
                          DataCell(Text(
                              languageData.value.gurung?.toString() ?? '-')),
                          DataCell(Text(
                              languageData.value.ghale?.toString() ?? '-')),
                          DataCell(Text(
                              languageData.value.othersLanguage?.toString() ??
                                  '-')),
                          DataCell(Text(
                              languageData.value.notAvailable?.toString() ??
                                  '-')),
                          DataCell(Text(languageData.value.totalLanguageCount
                                  ?.toString() ??
                              '-')),
                        ]);
                  }).toList()
                    ..add(DataRow(
                        color: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return Colors.grey.withOpacity(0.6);
                        }),
                        cells: [
                          DataCell(Text(l10n.total)),
                          DataCell(Text(totalNepali.toString())),
                          DataCell(Text(totalTamang.toString())),
                          DataCell(Text(totalSherpa.toString())),
                          DataCell(Text(totalLimbu.toString())),
                          DataCell(Text(totalRai.toString())),
                          DataCell(Text(totalGurung.toString())),
                          DataCell(Text(totalGhale.toString())),
                          DataCell(Text(totalOthers.toString())),
                          DataCell(Text(totalNotAvailable.toString())),
                          DataCell(Text(totalTotal.toString())),
                        ]))),
            );
          }
          if (state is LanguageFailureState) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(child: Text(l10n.loadDataFail)),
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
