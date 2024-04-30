import 'package:digital_profile/app_localization/l10n.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/language_model.dart';
import '../bloc/language_bloc.dart';

@immutable
class LanguagePieChart extends StatelessWidget {
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
  LanguagePieChart(
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
  final List<Color> _languageColorsLists = const [
    Color(0xFF009688),
    Color(0xFF1976D2),
    Color(0xFFFFC107),
    Color(0xFF3F51B5),
    Color(0xFFCDDC39),
    Color(0xFFFF5722),
    Color(0xFF9C27B0),
    Color(0xFF00BCD4),
    Color(0xFFE91E63)
  ];
  final List<String> _languageLists = [
    l10n.nepali,
    l10n.tamang,
    l10n.sherpa,
    l10n.limbu,
    l10n.rai,
    l10n.gurung,
    l10n.ghale,
    l10n.others,
    l10n.notavailable,
  ];

  @override
  Widget build(BuildContext context) {
    final List<Padding> containeers = List.generate(9, (index) {
      return Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: Row(
          children: [
            Container(
              height: 14,
              width: 14,
              color: _languageColorsLists[index],
              margin: const EdgeInsets.all(5),
            ),
            Text(_languageLists[index]),
          ],
        ),
      );
    });
    // print(totalNepali);
    return Card(
      child: Column(
        children: [
          const Text(
            'मातृभाषाको आधारमा जनसंख्या',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              if (state is LanguageLoadedState) {
                return Column(
                  children: [
                    // Text(totalNepali.toString()),
                    SizedBox(
                      height: 300,
                      width: double.maxFinite,
                      child: PieChart(
                          swapAnimationDuration:
                              const Duration(milliseconds: 300),
                          PieChartData(centerSpaceRadius: 80, sections: [
                            PieChartSectionData(
                                color: const Color(0xFF009688),
                                value: totalNepali.toDouble(),
                                badgeWidget: Text(l10n.nepali),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFF1976D2),
                                value: totalTamang.toDouble(),
                                badgeWidget: Text(l10n.tamang),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFFFFC107),
                                value: totalSherpa.toDouble(),
                                badgeWidget: Text(l10n.sherpa),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFF3F51B5),
                                value: totalLimbu.toDouble(),
                                badgeWidget: Text(l10n.limbu),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFFCDDC39),
                                value: totalRai.toDouble(),
                                badgeWidget: Text(l10n.rai),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFFFF5722),
                                value: totalGurung.toDouble(),
                                badgeWidget: Text(l10n.gurung),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFF9C27B0),
                                value: totalGhale.toDouble(),
                                badgeWidget: Text(l10n.ghale),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFF00BCD4),
                                value: totalOthers.toDouble(),
                                badgeWidget: Text(l10n.others),
                                badgePositionPercentageOffset: 1.5),
                            PieChartSectionData(
                                color: const Color(0xFFE91E63),
                                value: totalNotAvailable.toDouble(),
                                badgeWidget: Text(l10n.notavailable),
                                badgePositionPercentageOffset: 1.5),
                          ]
                              //  double nepaliCount = (e.nepali + nepali) as double;

                              )),
                    ),
                  ],
                );
              }
              if (state is LanguageLoadingState) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(),
                ));
              }
              if (state is LanguageFailureState) {
                return const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(child: Text('Unable to load language data')),
                );
              }
              return const Text("Something went wrong");
            },
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                spacing: 8.0, // Adjust the spacing between containers as needed
                runSpacing: 0,
                children: containeers,
              ),
            ),
          )
        ],
      ),
    );
  }
}
