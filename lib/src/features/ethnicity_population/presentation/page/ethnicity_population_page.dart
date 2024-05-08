import 'package:digital_profile/src/features/ethnicity_population/data/model/ethnicity_population.dart';
import 'package:digital_profile/src/features/ethnicity_population/data/repository/ethnicity_population_repository_impl.dart';
import 'package:digital_profile/src/features/ethnicity_population/presentation/widget/ethnicity_population_bar_graph.dart';
import 'package:digital_profile/src/features/ethnicity_population/presentation/widget/ethnicity_population_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/ethnicity_population_bloc.dart';

class EthnicityPopulationPage extends StatefulWidget {
  const EthnicityPopulationPage({super.key});

  @override
  State<EthnicityPopulationPage> createState() =>
      _EthnicityPopulationPageState();
}

class _EthnicityPopulationPageState extends State<EthnicityPopulationPage> {
  int totalMuslim = 0;
  int totalHillBrahman = 0;
  int totalTeraiBrahman = 0;
  int totalHillJanajati = 0;
  int totalTeraiJanajati = 0;
  int totalHillDalit = 0;
  int totalOthersCount = 0;
  int totalNotAvailable = 0;
  int totalWardEthnicity = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EthnicityPopulationBloc(
          RepositoryProvider.of<ImplEthnicityPopulationRepository>(context))
        ..add(GetEthnicityPopulationEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 50,
        ),
        body: BlocBuilder<EthnicityPopulationBloc, EthnicityPopulationState>(
          builder: (context, state) {
            if (state is EthnicityPopulationLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is EthnicityPopulationSuccessState) {
              List<EthnicityPopulationModel> fetchedEthPopData =
                  state.ethnicityPopulationModel;
              fetchedEthPopData.asMap().forEach((key, value) {
                totalMuslim += fetchedEthPopData[key].muslim ?? 0;
                totalHillBrahman += fetchedEthPopData[key].hillBrahman ?? 0;
                totalTeraiBrahman += fetchedEthPopData[key].teraiBrahman ?? 0;
                totalHillJanajati += fetchedEthPopData[key].hillJanajati ?? 0;
                totalTeraiJanajati += fetchedEthPopData[key].teraiJanajati ?? 0;
                totalHillDalit += fetchedEthPopData[key].hillDalit ?? 0;
                totalNotAvailable += fetchedEthPopData[key].notAvailable ?? 0;
                totalWardEthnicity +=
                    fetchedEthPopData[key].totalWardEthnicity ?? 0;
                totalOthersCount += fetchedEthPopData[key].others ?? 0;
              });
            }
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  EthnicityPopulationBarChart(
                      totalMuslim: totalMuslim,
                      totalHillBrahman: totalHillBrahman,
                      totalTeraiBrahman: totalTeraiBrahman,
                      totalHillJanajati: totalHillJanajati,
                      totalTeraiJanajati: totalTeraiJanajati,
                      totalHillDalit: totalHillDalit,
                      totalOthersCount: totalOthersCount,
                      totalNotAvailable: totalNotAvailable,
                      totalWardEthnicity: totalWardEthnicity),
                  const SizedBox(
                    height: 10,
                  ),
                  EthnicityPopulationDataTable(
                      totalMuslim: totalMuslim,
                      totalHillBrahman: totalHillBrahman,
                      totalTeraiBrahman: totalTeraiBrahman,
                      totalHillJanajati: totalHillJanajati,
                      totalTeraiJanajati: totalTeraiJanajati,
                      totalHillDalit: totalHillDalit,
                      totalOthersCount: totalOthersCount,
                      totalNotAvailable: totalNotAvailable,
                      totalWardEthnicity: totalWardEthnicity)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
