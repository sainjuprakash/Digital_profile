import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/src/features/age_table2_2/presentation/bloc/age_population_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/population_acc_age.dart';

class AgePopulationDataTable extends StatelessWidget {
  int totalMaleLessThanSix;
  int totalMaleSixToFifteen;
  int totalMaleSixteenToFortyNine;
  int totalMaleFiftyToSixtyNine;
  int totalMaleSeventyToNinety;
  int totalMaleAboveNinety;
  int totalFemaleLessThanSix;
  int totalFemaleSixToFifteen;
  int totalFemaleSixteenToFortyNine;
  int totalFemaleFiftyToSixtyNine;
  int totalFemaleSeventyToNinety;
  int totalFemaleNinetyAbove;
  int totalOthersLessThanSix;
  int totalOthersSixToFifteen;
  int totalOthersSixteenToFortyNine;
  int totalOthersFiftyToSixtyNine;
  int totalOthersSeventyToNinety;
  int totalOthersAboveNinety;
  int totalWardCount;
  AgePopulationDataTable(
      {super.key,
      required this.totalMaleLessThanSix,
      required this.totalMaleSixToFifteen,
      required this.totalMaleSixteenToFortyNine,
      required this.totalMaleFiftyToSixtyNine,
      required this.totalMaleSeventyToNinety,
      required this.totalMaleAboveNinety,
      required this.totalFemaleLessThanSix,
      required this.totalFemaleSixToFifteen,
      required this.totalFemaleSixteenToFortyNine,
      required this.totalFemaleFiftyToSixtyNine,
      required this.totalFemaleSeventyToNinety,
      required this.totalFemaleNinetyAbove,
      required this.totalOthersLessThanSix,
      required this.totalOthersSixToFifteen,
      required this.totalOthersSixteenToFortyNine,
      required this.totalOthersFiftyToSixtyNine,
      required this.totalOthersSeventyToNinety,
      required this.totalOthersAboveNinety,
      required this.totalWardCount});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:
            SizedBox(child: BlocBuilder<AgePopulationBloc, AgePopulationState>(
          builder: (context, state) {
            if (state is AgePopulationSuccessState) {
              List<AgePopulationModel> fetchedAgeData =
                  state.agePopulationModel;
              return DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.malelessthan6)),
                  DataColumn(label: Text(l10n.male6to15)),
                  DataColumn(label: Text(l10n.male16to49)),
                  DataColumn(label: Text(l10n.male50to69)),
                  DataColumn(label: Text(l10n.male70to90)),
                  DataColumn(label: Text(l10n.maleabove90)),
                  DataColumn(label: Text(l10n.femalelessthan6)),
                  DataColumn(label: Text(l10n.female6to15)),
                  DataColumn(label: Text(l10n.female16to49)),
                  DataColumn(label: Text(l10n.female50to69)),
                  DataColumn(label: Text(l10n.female70to90)),
                  DataColumn(label: Text(l10n.femaleabove90)),
                  DataColumn(label: Text(l10n.otherslessthan6)),
                  DataColumn(label: Text(l10n.others6to15)),
                  DataColumn(label: Text(l10n.others16to49)),
                  DataColumn(label: Text(l10n.others50to69)),
                  DataColumn(label: Text(l10n.others70to90)),
                  DataColumn(label: Text(l10n.othersabove90)),
                  DataColumn(label: Text(l10n.total))
                ],
                rows: fetchedAgeData.asMap().entries.map((e) {
                  return DataRow(
                      color: MaterialStateProperty.resolveWith((states) {
                        if (e.key % 2 == 0) {
                          return Colors.grey.withOpacity(0.3);
                        } else {
                          return null;
                        }
                      }),
                      cells: [
                        DataCell(
                          Text(e.value.wardNumber.toString()),
                        ),
                        DataCell(
                          Text(e.value.maleLessThanSix?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.maleSixToFifteen?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.maleSixteenToFortyNine?.toString() ??
                              '-'),
                        ),
                        DataCell(
                          Text(e.value.maleFiftyToSixtyNine?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.maleSeventyToNinety?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.maleAboveNinety?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.femaleLessThanSix?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.femaleSixToFifteen?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.femaleSixteenToFortyNine?.toString() ??
                              '-'),
                        ),
                        DataCell(
                          Text(e.value.femaleFiftyToSixtyNine?.toString() ??
                              '-'),
                        ),
                        DataCell(
                          Text(
                              e.value.femaleSeventyToNinety?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.femaleNinetyAbove?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.othersLessThanSix?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.othersSixToFifteen?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.othersSixteenFortyNine?.toString() ??
                              '-'),
                        ),
                        DataCell(
                          Text(e.value.othersFiftyToSixtyNine?.toString() ??
                              '-'),
                        ),
                        DataCell(
                          Text(
                              e.value.othersSeventyToNinety?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.othersAboveNinety?.toString() ?? '-'),
                        ),
                        DataCell(
                          Text(e.value.totalWardCount?.toString() ?? '-'),
                        ),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: MaterialStateProperty.resolveWith(
                          (states) => Colors.grey.withOpacity(0.6)),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalMaleLessThanSix.toString())),
                        DataCell(Text(totalMaleSixToFifteen.toString())),
                        DataCell(Text(totalMaleSixteenToFortyNine.toString())),
                        DataCell(Text(totalMaleFiftyToSixtyNine.toString())),
                        DataCell(Text(totalMaleSeventyToNinety.toString())),
                        DataCell(Text(totalMaleAboveNinety.toString())),
                        DataCell(Text(totalFemaleLessThanSix.toString())),
                        DataCell(Text(totalFemaleSixToFifteen.toString())),
                        DataCell(
                            Text(totalFemaleSixteenToFortyNine.toString())),
                        DataCell(Text(totalFemaleFiftyToSixtyNine.toString())),
                        DataCell(Text(totalFemaleSeventyToNinety.toString())),
                        DataCell(Text(totalFemaleNinetyAbove.toString())),
                        DataCell(Text(totalOthersLessThanSix.toString())),
                        DataCell(Text(totalOthersSixToFifteen.toString())),
                        DataCell(
                            Text(totalOthersSixteenToFortyNine.toString())),
                        DataCell(Text(totalOthersFiftyToSixtyNine.toString())),
                        DataCell(Text(totalOthersSeventyToNinety.toString())),
                        DataCell(Text(totalOthersAboveNinety.toString())),
                        DataCell(Text(totalWardCount.toString())),
                      ])),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        )),
      ),
    );
  }
}
