import 'dart:math';

import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/src/features/language/data/models/language_model.dart';
import 'package:digital_profile/src/features/language/data/repository/language_repository_impl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/language_bloc.dart';

class LanguageDetails extends StatefulWidget {
  const LanguageDetails({super.key});

  @override
  State<LanguageDetails> createState() => _LanguageDetailsState();
}

class _LanguageDetailsState extends State<LanguageDetails> {
  int totalNepali = 0;
  // int totalNepali = 0;
  // int totalNepali = 0;
  // int totalNepali = 0;
  // int totalNepali = 0;
  // int totalNepali = 0;

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
        body: (Column(
          children: [
            Card(
              child: Column(
                children: [
                  const Text(
                    'मातृभाषाको आधारमा जनसंख्या',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  BlocBuilder<LanguageBloc, LanguageState>(
                    builder: (context, state) {
                      if (state is LanguageLoadedState) {
                        List<LanguageModel> fetchedLanguageData =
                            state.fetchedLanguageModel;
                        fetchedLanguageData.asMap().forEach((index, element) {
                          totalNepali +=
                              (fetchedLanguageData[index].nepali ?? 0);
                          print(fetchedLanguageData[index].nepali);
                          print(totalNepali);
                        });
                        return Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text(totalNepali.toString()),
                            SizedBox(
                              height: 300,
                              width: double.maxFinite,
                              child: PieChart(
                                  swapAnimationDuration:
                                      const Duration(milliseconds: 300),
                                  PieChartData(
                                      centerSpaceRadius: 80,
                                      sections: fetchedLanguageData.map((e) {
                                        //  double nepaliCount = (e.nepali + nepali) as double;
                                        return PieChartSectionData(
                                            color: Colors.blue,
                                            value: 25,
                                            badgeWidget: const Text('राई'),
                                            badgePositionPercentageOffset: 1.3);
                                      }).toList()

                                      /*[
                                      PieChartSectionData(
                                          color: Colors.blue,
                                          value: 120,
                                          badgeWidget: const Text('राई'),
                                          badgePositionPercentageOffset: 1.3),
                                      PieChartSectionData(
                                          color: Colors.red,
                                          value: 60,
                                          badgeWidget: const Text('पहाडी दलित'),
                                          badgePositionPercentageOffset: 1.7),
                                      PieChartSectionData(
                                          color: Colors.yellow,
                                          value: 40,
                                          badgeWidget: const Text('ब्राह्मण'),
                                          badgePositionPercentageOffset: 1.3),
                                      PieChartSectionData(
                                          color: Colors.green,
                                          value: 20,
                                          badgeWidget: const Text('पहाडी आदिवासी'),
                                          badgePositionPercentageOffset: 1.3),
                                      PieChartSectionData(
                                          color: Colors.pink,
                                          value: 50,
                                          badgeWidget: const Text('तराई आदिवासी'),
                                          badgePositionPercentageOffset: 1.3),
                                      PieChartSectionData(
                                          color: Colors.amber,
                                          value: 10,
                                          badgeWidget: const Text('नखुलायको'),
                                          badgePositionPercentageOffset: 1.8),
                                    ],*/
                                      )),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        );
                      } else if (state is LanguageLoadingState) {
                        return const Center(
                            child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(),
                        ));
                      } else if (state is LanguageFailureState) {
                        return const Center(
                            child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text('Unable to load language data'),
                        ));
                      }
                      return const Text("Something went wrong");
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(columns:  [
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
                ], rows: [


                ]),
              ),
            )
          ],
        )),
      ),
    );
  }
}
