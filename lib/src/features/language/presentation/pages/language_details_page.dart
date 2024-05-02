import 'package:digital_profile/src/features/language/data/models/language_model.dart';
import 'package:digital_profile/src/features/language/data/repository/language_repository_impl.dart';
import 'package:digital_profile/src/features/language/presentation/widgets/Language_pie_chart.dart';
import 'package:digital_profile/src/features/language/presentation/widgets/language_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/language_bloc.dart';

class LanguageDetails extends StatefulWidget {
  const LanguageDetails({super.key});

  @override
  State<LanguageDetails> createState() => _LanguageDetailsState();
}

class _LanguageDetailsState extends State<LanguageDetails> {
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LanguageBloc(RepositoryProvider.of<GetLanguageRepository>(context))
            ..add(LoadLanguageEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('मातृभाषाको आधारमा जनसंख्या'),
          backgroundColor: Colors.blueAccent,
        ),
        body: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            if (state is LanguageLoadedState) {
              List<LanguageModel> fetchedLanguageData =
                  state.fetchedLanguageModel;
              fetchedLanguageData.asMap().forEach((index, element) {
                totalTamang += (fetchedLanguageData[index].tamang ?? 0);
                totalNepali += (fetchedLanguageData[index].nepali ?? 0);
                totalSherpa += (fetchedLanguageData[index].sherpa ?? 0);
                totalLimbu += (fetchedLanguageData[index].limbu ?? 0);
                totalRai += (fetchedLanguageData[index].rai ?? 0);
                totalGurung += (fetchedLanguageData[index].gurung ?? 0);
                totalGhale += (fetchedLanguageData[index].ghale ?? 0);
                totalOthers += (fetchedLanguageData[index].othersLanguage ?? 0);
                totalNotAvailable +=
                    (fetchedLanguageData[index].notAvailable ?? 0);
                totalTotal +=
                    (fetchedLanguageData[index].totalLanguageCount ?? 0);
                // print(fetchedLanguageData[index].nepali);
                // print(totalNepali);
              });
            }
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: (Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  LanguagePieChart(
                      totalNepali: totalNepali,
                      totalTamang: totalTamang,
                      totalSherpa: totalSherpa,
                      totalLimbu: totalLimbu,
                      totalRai: totalRai,
                      totalGurung: totalGurung,
                      totalGhale: totalGhale,
                      totalOthers: totalOthers,
                      totalNotAvailable: totalNotAvailable,
                      totalTotal: totalTotal),
                  const SizedBox(
                    height: 10,
                  ),
                  LanguageTable(
                      totalNepali: totalNepali,
                      totalTamang: totalTamang,
                      totalSherpa: totalSherpa,
                      totalLimbu: totalLimbu,
                      totalRai: totalRai,
                      totalGurung: totalGurung,
                      totalGhale: totalGhale,
                      totalOthers: totalOthers,
                      totalNotAvailable: totalNotAvailable,
                      totalTotal: totalTotal),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
            );
          },
        ),
      ),
    );
  }
}
