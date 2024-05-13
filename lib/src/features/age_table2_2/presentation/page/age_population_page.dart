import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/age_table2_2/data/model/population_acc_age.dart';
import 'package:digital_profile/src/features/age_table2_2/presentation/widget/age_population_bar_chart.dart';
import 'package:digital_profile/src/features/age_table2_2/presentation/widget/age_population_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/population_acc_age_repository_impl.dart';
import '../bloc/age_population_bloc.dart';

class AgePopulationPage extends StatefulWidget {
  const AgePopulationPage({super.key});

  @override
  State<AgePopulationPage> createState() => _AgePopulationPageState();
}

class _AgePopulationPageState extends State<AgePopulationPage> {
  int totalMaleLessThanSix = 0;
  int totalMaleSixToFifteen = 0;
  int totalMaleSixteenToFortyNine = 0;
  int totalMaleFiftyToSixtyNine = 0;
  int totalMaleSeventyToNinety = 0;
  int totalMaleAboveNinety = 0;
  int totalFemaleLessThanSix = 0;
  int totalFemaleSixToFifteen = 0;
  int totalFemaleSixteenToFortyNine = 0;
  int totalFemaleFiftyToSixtyNine = 0;
  int totalFemaleSeventyToNinety = 0;
  int totalFemaleNinetyAbove = 0;
  int totalOthersLessThanSix = 0;
  int totalOthersSixToFifteen = 0;
  int totalOthersSixteenToFortyNine = 0;
  int totalOthersFiftyToSixtyNine = 0;
  int totalOthersSeventyToNinety = 0;
  int totalOthersAboveNinety = 0;
  int totalWardCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 50,
      ),
      body: BlocProvider(
        create: (context) =>
            AgePopulationBloc(RepositoryProvider.of<ImplAgeRepository>(context))
              ..add(GetAgePopulationEvent()),
        child: BlocBuilder<AgePopulationBloc, AgePopulationState>(
          builder: (context, state) {
            if (state is AgePopulationLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AgePopulationSuccessState) {
              List<AgePopulationModel> fetchedAgeData =
                  state.agePopulationModel;
              fetchedAgeData.asMap().forEach((key, value) {
                totalMaleLessThanSix +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalMaleSixToFifteen +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalMaleSixteenToFortyNine +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalMaleFiftyToSixtyNine +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalMaleSeventyToNinety +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalMaleAboveNinety +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalFemaleLessThanSix +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalFemaleSixToFifteen +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalFemaleSixteenToFortyNine +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalFemaleFiftyToSixtyNine +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalFemaleSeventyToNinety +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalFemaleNinetyAbove +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalOthersLessThanSix +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalOthersSixToFifteen +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalOthersSixteenToFortyNine +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalOthersFiftyToSixtyNine +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalOthersSeventyToNinety +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalOthersAboveNinety +=
                    fetchedAgeData[key].maleLessThanSix ?? 0;
                totalWardCount += fetchedAgeData[key].maleLessThanSix ?? 0;
              });
            }
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  AgePopulationBarChart(
                      totalMaleLessThanSix: totalMaleLessThanSix,
                      totalMaleSixToFifteen: totalMaleSixToFifteen,
                      totalMaleSixteenToFortyNine: totalMaleSixteenToFortyNine,
                      totalMaleFiftyToSixtyNine: totalMaleFiftyToSixtyNine,
                      totalMaleSeventyToNinety: totalMaleSeventyToNinety,
                      totalMaleAboveNinety: totalMaleAboveNinety,
                      totalFemaleLessThanSix: totalFemaleLessThanSix,
                      totalFemaleSixToFifteen: totalFemaleSixToFifteen,
                      totalFemaleSixteenToFortyNine:
                          totalFemaleSixteenToFortyNine,
                      totalFemaleFiftyToSixtyNine: totalFemaleFiftyToSixtyNine,
                      totalFemaleSeventyToNinety: totalFemaleSeventyToNinety,
                      totalFemaleNinetyAbove: totalFemaleNinetyAbove,
                      totalOthersLessThanSix: totalOthersLessThanSix,
                      totalOthersSixToFifteen: totalOthersSixToFifteen,
                      totalOthersSixteenToFortyNine:
                          totalOthersSixteenToFortyNine,
                      totalOthersFiftyToSixtyNine: totalOthersFiftyToSixtyNine,
                      totalOthersSeventyToNinety: totalOthersSeventyToNinety,
                      totalOthersAboveNinety: totalOthersAboveNinety,
                      totalWardCount: totalWardCount),
                  verticalspace(),
                  AgePopulationDataTable(
                      totalMaleLessThanSix: totalMaleLessThanSix,
                      totalMaleSixToFifteen: totalMaleSixToFifteen,
                      totalMaleSixteenToFortyNine: totalMaleSixteenToFortyNine,
                      totalMaleFiftyToSixtyNine: totalMaleFiftyToSixtyNine,
                      totalMaleSeventyToNinety: totalMaleSeventyToNinety,
                      totalMaleAboveNinety: totalMaleAboveNinety,
                      totalFemaleLessThanSix: totalFemaleLessThanSix,
                      totalFemaleSixToFifteen: totalFemaleSixToFifteen,
                      totalFemaleSixteenToFortyNine:
                          totalFemaleSixteenToFortyNine,
                      totalFemaleFiftyToSixtyNine: totalFemaleFiftyToSixtyNine,
                      totalFemaleSeventyToNinety: totalFemaleSeventyToNinety,
                      totalFemaleNinetyAbove: totalFemaleNinetyAbove,
                      totalOthersLessThanSix: totalOthersLessThanSix,
                      totalOthersSixToFifteen: totalOthersSixToFifteen,
                      totalOthersSixteenToFortyNine:
                          totalOthersSixteenToFortyNine,
                      totalOthersFiftyToSixtyNine: totalOthersFiftyToSixtyNine,
                      totalOthersSeventyToNinety: totalOthersSeventyToNinety,
                      totalOthersAboveNinety: totalOthersAboveNinety,
                      totalWardCount: totalWardCount)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
