import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/literacy_model.dart';
import '../bloc/literacy_bloc.dart';

class LiteracyDataTable extends StatelessWidget {
  int totalLiterate,
      totalPrePrimary,
      totalPrimary,
      totalSecondary,
      totalTechnical,
      totalBachelor,
      totalMaster,
      totalMphil,
      totalUnderAge,
      totalIlliterate,
      totalNotAvailable,
      totalMaleLiterate,
      totalMalePrePrimary,
      totalMalePrimary,
      totalMaleSecondary,
      totalMaleTechnical,
      totalMaleBachelor,
      totalMaleMaster,
      totalMaleMphil,
      totalMaleUnderAge,
      totalMaleIlliterate,
      totalMaleNotAvailable,
      totalFemaleLiterate,
      totalFemalePrePrimary,
      totalFemalePrimary,
      totalFemaleSecondary,
      totalFemaleTechnical,
      totalFemaleBachelor,
      totalFemaleMaster,
      totalFemaleMphil,
      totalFemaleUnderAge,
      totalFemaleIlliterate,
      totalFemaleNotAvailable,
      totalOthersLiterate,
      totalOthersPrePrimary,
      totalOthersPrimary,
      totalOthersSecondary,
      totalOthersTechnical,
      totalOthersBachelor,
      totalOthersMaster,
      totalOthersMphil,
      totalOthersUnderAge,
      totalOthersIlliterate,
      totalOthersNotAvailable,
      totalVillageEduCount;

  LiteracyDataTable(
      this.totalLiterate,
      this.totalPrePrimary,
      this.totalPrimary,
      this.totalSecondary,
      this.totalTechnical,
      this.totalBachelor,
      this.totalMaster,
      this.totalMphil,
      this.totalUnderAge,
      this.totalIlliterate,
      this.totalNotAvailable,
      this.totalMaleLiterate,
      this.totalMalePrePrimary,
      this.totalMalePrimary,
      this.totalMaleSecondary,
      this.totalMaleTechnical,
      this.totalMaleBachelor,
      this.totalMaleMaster,
      this.totalMaleMphil,
      this.totalMaleUnderAge,
      this.totalMaleIlliterate,
      this.totalMaleNotAvailable,
      this.totalFemaleLiterate,
      this.totalFemalePrePrimary,
      this.totalFemalePrimary,
      this.totalFemaleSecondary,
      this.totalFemaleTechnical,
      this.totalFemaleBachelor,
      this.totalFemaleMaster,
      this.totalFemaleMphil,
      this.totalFemaleUnderAge,
      this.totalFemaleIlliterate,
      this.totalFemaleNotAvailable,
      this.totalOthersLiterate,
      this.totalOthersPrePrimary,
      this.totalOthersPrimary,
      this.totalOthersSecondary,
      this.totalOthersTechnical,
      this.totalOthersBachelor,
      this.totalOthersMaster,
      this.totalOthersMphil,
      this.totalOthersUnderAge,
      this.totalOthersIlliterate,
      this.totalOthersNotAvailable,
      this.totalVillageEduCount,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<LiteracyBloc, LiteracyState>(
        builder: (context, state) {
          if (state is LiteracyLoadingState) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (state is LiteracySuccessState) {
            List<LiteracyModel> fetchedLiteracyModel = state.literacyModel;
            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: DataTable(
                        columns: [
                          DataColumn(label: Text(l10n.wardnumber)),
                          DataColumn(label: Text(l10n.literate)),
                          DataColumn(label: Text(l10n.preprimary)),
                          DataColumn(label: Text(l10n.primary)),
                          DataColumn(label: Text(l10n.secondary)),
                          DataColumn(label: Text(l10n.technical)),
                          DataColumn(label: Text(l10n.bachelor)),
                          DataColumn(label: Text(l10n.master)),
                          DataColumn(label: Text(l10n.mphil)),
                          DataColumn(label: Text(l10n.underage)),
                          DataColumn(label: Text(l10n.illiterate)),
                          DataColumn(label: Text(l10n.notavailable)),
                          DataColumn(label: Text(l10n.total))
                        ],
                        rows: fetchedLiteracyModel.asMap().entries.map((e) {
                          int? literate = (e.value.maleLiterate ?? 0) +
                              (e.value.femaleLiterate ?? 0) +
                              (e.value.othersLiterate ?? 0);
                          int prePrimary = (e.value.malePrePrimary ?? 0) +
                              (e.value.femalePrePrimary ?? 0) +
                              (e.value.othersPrePrimary ?? 0);
                          int primary = (e.value.malePrimary ?? 0) +
                              (e.value.femalePrimary ?? 0) +
                              (e.value.othersPrimary ?? 0);
                          int secondary = (e.value.maleSecondary ?? 0) +
                              (e.value.femaleSecondary ?? 0) +
                              (e.value.othersSecondary ?? 0);
                          int technical = (e.value.maleTechnical ?? 0) +
                              (e.value.femaleTechincal ?? 0) +
                              (e.value.othersTechnical ?? 0);
                          int bachelor = (e.value.maleBachelor ?? 0) +
                              (e.value.femaleBachelor ?? 0) +
                              (e.value.othersBachelor ?? 0);
                          int master = (e.value.maleMasters ?? 0) +
                              (e.value.femaleMasters ?? 0) +
                              (e.value.othersMasters ?? 0);
                          int mphil = (e.value.maleMphil ?? 0) +
                              (e.value.femaleMphil ?? 0) +
                              (e.value.othersMphil ?? 0);
                          int underage = (e.value.maleUnderAge ?? 0) +
                              (e.value.femaleUnderAge ?? 0) +
                              (e.value.othersUnderAge ?? 0);
                          int illiterate = (e.value.maleIlitrate ?? 0) +
                              (e.value.femaleIliterate ?? 0) +
                              (e.value.othersIliterate ?? 0);
                          int notAvailable = (e.value.maleNotAvailable ?? 0) +
                              (e.value.femaleNotAvailable ?? 0) +
                              (e.value.othersNotAvailable ?? 0);

                          return DataRow(
                              color: WidgetStateProperty.resolveWith(
                                  (Set<WidgetState> state) {
                                if (e.key % 2 == 0) {
                                  return Colors.grey.withOpacity(0.3);
                                } else {
                                  return null;
                                }
                              }),
                              cells: [
                                DataCell(Text(e.value.wardNumber.toString())),
                                DataCell(Text(literate.toString())),
                                DataCell(Text(prePrimary.toString())),
                                DataCell(Text(primary.toString())),
                                DataCell(Text(secondary.toString())),
                                DataCell(Text(technical.toString())),
                                DataCell(Text(bachelor.toString())),
                                DataCell(Text(master.toString())),
                                DataCell(Text(mphil.toString())),
                                DataCell(Text(underage.toString())),
                                DataCell(Text(illiterate.toString())),
                                DataCell(Text(notAvailable.toString())),
                                DataCell(Text(
                                    e.value.totalWardEdu?.toString() ?? ''))
                              ]);
                        }).toList()
                          ..add(DataRow(
                              color: WidgetStateProperty.resolveWith<Color>(
                                  (Set<WidgetState> states) {
                                return Colors.grey.withOpacity(0.6);
                              }),
                              cells: [
                                DataCell(Text(l10n.total)),
                                DataCell(Text(totalLiterate.toString())),
                                DataCell(Text(totalPrePrimary.toString())),
                                DataCell(Text(totalPrimary.toString())),
                                DataCell(Text(totalSecondary.toString())),
                                DataCell(Text(totalTechnical.toString())),
                                DataCell(Text(totalBachelor.toString())),
                                DataCell(Text(totalMaster.toString())),
                                DataCell(Text(totalMphil.toString())),
                                DataCell(Text(totalUnderAge.toString())),
                                DataCell(Text(totalIlliterate.toString())),
                                DataCell(Text(totalNotAvailable.toString())),
                                DataCell(Text(totalVillageEduCount.toString())),
                              ]))),
                  ),
                ),
                verticalspace(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Card(
                    color: Colors.blueAccent.withOpacity(0.8),
                    child: DataTable(
                        columns: [
                          DataColumn(label: Text(l10n.wardnumber)),
                          DataColumn(
                              label: Text('${l10n.male}\n${l10n.literate}')),
                          DataColumn(
                              label:
                                  Text('   ${l10n.male}\n${l10n.preprimary}')),
                          DataColumn(
                              label: Text('  ${l10n.male}\n${l10n.primary}')),
                          DataColumn(
                              label: Text('  ${l10n.male}\n${l10n.secondary}')),
                          DataColumn(
                              label: Text('  ${l10n.male}\n${l10n.technical}')),
                          DataColumn(
                              label: Text('  ${l10n.male}\n${l10n.bachelor}')),
                          DataColumn(
                              label: Text('   ${l10n.male}\n${l10n.master}')),
                          DataColumn(
                              label: Text(' ${l10n.male}\n${l10n.mphil}')),
                          DataColumn(
                              label: Text('  ${l10n.male}\n${l10n.underage}')),
                          DataColumn(
                              label: Text(' ${l10n.male}\n${l10n.illiterate}')),
                          DataColumn(
                              label: Text(
                                  '    ${l10n.male}\n${l10n.notavailable}')),
                          // DataColumn(label: Text(l10n.total))
                        ],
                        rows: fetchedLiteracyModel.asMap().entries.map((e) {
                          return DataRow(
                              color: WidgetStateProperty.resolveWith(
                                  (Set<WidgetState> state) {
                                if (e.key % 2 == 0) {
                                  return Colors.grey.withOpacity(0.3);
                                } else {
                                  return null;
                                }
                              }),
                              cells: [
                                DataCell(Text(e.value.wardNumber.toString())),
                                DataCell(Text(
                                    e.value.maleLiterate?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.malePrePrimary?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.malePrimary?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.maleSecondary?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.maleTechnical?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.maleBachelor?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.maleMasters?.toString() ?? '-')),
                                DataCell(
                                    Text(e.value.maleMphil?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.maleUnderAge?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.maleIlitrate?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.maleNotAvailable?.toString() ??
                                        '-')),
                              ]);
                        }).toList()
                          ..add(DataRow(
                              color: WidgetStateProperty.resolveWith<Color>(
                                  (Set<WidgetState> states) {
                                return Colors.grey.withOpacity(0.6);
                              }),
                              cells: [
                                DataCell(Text(l10n.total)),
                                DataCell(Text(totalMaleLiterate.toString())),
                                DataCell(Text(totalMalePrePrimary.toString())),
                                DataCell(Text(totalMalePrimary.toString())),
                                DataCell(Text(totalMaleSecondary.toString())),
                                DataCell(Text(totalMaleTechnical.toString())),
                                DataCell(Text(totalMaleBachelor.toString())),
                                DataCell(Text(totalMaleMaster.toString())),
                                DataCell(Text(totalMaleMphil.toString())),
                                DataCell(Text(totalMaleUnderAge.toString())),
                                DataCell(Text(totalMaleIlliterate.toString())),
                                DataCell(
                                    Text(totalMaleNotAvailable.toString())),

                                // DataCell(Text(totalVillageEduCount.toString())),
                              ]))),
                  ),
                ),
                verticalspace(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Card(
                    child: DataTable(
                        columns: [
                          DataColumn(label: Text(l10n.wardnumber)),
                          DataColumn(
                              label: Text('${l10n.female}\n${l10n.literate}')),
                          DataColumn(
                              label: Text(
                                  '   ${l10n.female}\n${l10n.preprimary}')),
                          DataColumn(
                              label: Text('  ${l10n.female}\n${l10n.primary}')),
                          DataColumn(
                              label:
                                  Text('  ${l10n.female}\n${l10n.secondary}')),
                          DataColumn(
                              label:
                                  Text('  ${l10n.female}\n${l10n.technical}')),
                          DataColumn(
                              label:
                                  Text('  ${l10n.female}\n${l10n.bachelor}')),
                          DataColumn(
                              label: Text('   ${l10n.female}\n${l10n.master}')),
                          DataColumn(
                              label: Text(' ${l10n.female}\n${l10n.mphil}')),
                          DataColumn(
                              label:
                                  Text('  ${l10n.female}\n${l10n.underage}')),
                          DataColumn(
                              label:
                                  Text(' ${l10n.female}\n${l10n.illiterate}')),
                          DataColumn(
                              label: Text(
                                  '    ${l10n.female}\n${l10n.notavailable}')),
                        ],
                        rows: fetchedLiteracyModel.asMap().entries.map((e) {
                          return DataRow(
                              color: WidgetStateProperty.resolveWith(
                                  (Set<WidgetState> state) {
                                if (e.key % 2 == 0) {
                                  return Colors.grey.withOpacity(0.3);
                                } else {
                                  return null;
                                }
                              }),
                              cells: [
                                DataCell(Text(e.value.wardNumber.toString())),
                                DataCell(Text(
                                    e.value.femaleLiterate?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.femalePrePrimary?.toString() ??
                                        '-')),
                                DataCell(Text(
                                    e.value.femalePrimary?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.femaleSecondary?.toString() ??
                                        '-')),
                                DataCell(Text(
                                    e.value.femaleTechincal?.toString() ??
                                        '-')),
                                DataCell(Text(
                                    e.value.femaleBachelor?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.femaleMasters?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.femaleMphil?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.femaleUnderAge?.toString() ?? '-')),
                                DataCell(Text(
                                    e.value.femaleIliterate?.toString() ??
                                        '-')),
                                DataCell(Text(
                                    e.value.femaleNotAvailable?.toString() ??
                                        '-')),
                              ]);
                        }).toList()
                          ..add(DataRow(
                              color: WidgetStateProperty.resolveWith<Color>(
                                  (Set<WidgetState> states) {
                                return Colors.grey.withOpacity(0.6);
                              }),
                              cells: [
                                DataCell(Text(l10n.total)),
                                DataCell(Text(totalFemaleLiterate.toString())),
                                DataCell(
                                    Text(totalFemalePrePrimary.toString())),
                                DataCell(Text(totalFemalePrimary.toString())),
                                DataCell(Text(totalFemaleSecondary.toString())),
                                DataCell(Text(totalFemaleTechnical.toString())),
                                DataCell(Text(totalFemaleBachelor.toString())),
                                DataCell(Text(totalFemaleMaster.toString())),
                                DataCell(Text(totalFemaleMphil.toString())),
                                DataCell(Text(totalFemaleUnderAge.toString())),
                                DataCell(
                                    Text(totalFemaleIlliterate.toString())),
                                DataCell(
                                    Text(totalFemaleNotAvailable.toString())),
                              ]))),
                  ),
                ),
              ],
            );
          }
          if (state is LiteracyFailureState) {
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
