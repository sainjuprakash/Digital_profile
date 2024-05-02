import 'package:digital_profile/src/features/ethenicity/data/models/ethnicity_model.dart';
import 'package:digital_profile/src/features/ethenicity/presentation/bloc/ethnicity_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_localization/l10n.dart';

class EthnicityPieChart extends StatelessWidget {
  int totalMuslim;
  int totalHillBrahman;
  int totalTeraiBrahman;
  int totalHillJanajati;
  int totalTeraiJanajati;
  int totalHillDalit;
  int totalNotAvailable;
  int totalTotalEthnicity;
  EthnicityPieChart(
      {super.key,
      required this.totalMuslim,
      required this.totalHillBrahman,
      required this.totalTeraiBrahman,
      required this.totalHillJanajati,
      required this.totalTeraiJanajati,
      required this.totalHillDalit,
      required this.totalNotAvailable,
      required this.totalTotalEthnicity});

  @override
  Widget build(BuildContext context) {
    return Card(child:
        BlocBuilder<EthnicityBloc, EthnicityState>(builder: (context, state) {
      if (state is EthnicityLoadingState) {
        return const Center(
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator()));
      }
      if (state is EthnicitySuccessState) {
      //  List<EthnicityModel> fetchedEthnicityData = state.fetchedEthnicityModel;
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'मातृभाषाको आधारमा जनसंख्या',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 300,
              width: double.maxFinite,
              child: PieChart(
                  swapAnimationDuration: const Duration(milliseconds: 300),
                  PieChartData(centerSpaceRadius: 80, sections: [
                    PieChartSectionData(
                        color: const Color(0xFF009688),
                        value: totalMuslim.toDouble(),
                       // badgeWidget: Text(l10n.muslim),
                        badgePositionPercentageOffset: 1.5),
                    PieChartSectionData(
                        color: const Color(0xFF1976D2),
                        value: totalNotAvailable.toDouble(),
                       // badgeWidget: Text(l10n.notavailable),
                        badgePositionPercentageOffset: 1.5),
                    PieChartSectionData(
                        color: const Color(0xFFFFC107),
                        value: totalHillDalit.toDouble(),
                        //badgeWidget: Text(l10n.hillDalit),
                        badgePositionPercentageOffset: 1.5),
                    PieChartSectionData(
                        color: const Color(0xFF3F51B5),
                        value: totalTeraiJanajati.toDouble(),
                        //badgeWidget: Text(l10n.teraiJanajati),
                        badgePositionPercentageOffset: 1.5),
                    PieChartSectionData(
                        color: const Color(0xFFCDDC39),
                        value: totalHillJanajati.toDouble(),
                        //badgeWidget: Text(l10n.hillJanajati),
                        badgePositionPercentageOffset: 1.5),
                    PieChartSectionData(
                        color: const Color(0xFFFF5722),
                        value: totalTeraiBrahman.toDouble(),
                        //badgeWidget: Text(l10n.teraiBrahman),
                        badgePositionPercentageOffset: 1.5),
                    PieChartSectionData(
                        color: const Color(0xFF9C27B0),
                        value: totalHillBrahman.toDouble(),
                       // badgeWidget: Text(l10n.hillbrahmen),
                        badgePositionPercentageOffset: 1.5),
                  ])),
            ),
          ],
        );
      }
      if (state is EthnicityFailureState) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: Text('Unable to load ethnicity data')),
        );
      }
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: Text('Something went wrong')),
      );
    }));
  }
}
