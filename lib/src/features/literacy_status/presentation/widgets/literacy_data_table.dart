import 'package:digital_profile/app_localization/l10n.dart';
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
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BlocBuilder<LiteracyBloc, LiteracyState>(
          builder: (context, state) {
            if (state is LiteracySuccessState) {
              List<LiteracyModel> fetchedLiteracyModel = state.literacyModel;
              return Card(
                child: Column(
                  children: [
                    DataTable(
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

                          return DataRow(cells: [
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
                            DataCell(
                                Text(e.value.totalWardEdu?.toString() ?? ''))
                          ]);
                        }).toList()
                          ..add(DataRow(cells: [
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
                          ])))
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ));
  }
}
