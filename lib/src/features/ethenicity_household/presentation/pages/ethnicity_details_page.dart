import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/ethnicity_model.dart';
import '../../data/repository/ethnicity_repository_impl.dart';
import '../bloc/ethnicity_bloc.dart';
import '../widgets/ethnicity_bar_chart.dart';
import '../widgets/ethnicity_data_table.dart';
//Table no.3

class EthnicityPage extends StatefulWidget {
  String baseUrl;
  EthnicityPage(this.baseUrl, {super.key});

  @override
  State<EthnicityPage> createState() => _EthnicityPageState();
}

class _EthnicityPageState extends State<EthnicityPage> {
  int totalMuslim = 0;
  int totalHillBrahman = 0;
  int totalTeraiBrahman = 0;
  int totalHillJanajati = 0;
  int totalTeraiJanajati = 0;
  int totalHillDalit = 0;
  int totalNotAvailable = 0;
  int totalTotalEthnicity = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EthnicityBloc(
          RepositoryProvider.of<GetEthnicityRepository>(context),
          widget.baseUrl)
        ..add(LoadEthnicityEvent()),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: BlocBuilder<EthnicityBloc, EthnicityState>(
            builder: (context, state) {
          if (state is EthnicitySuccessState) {
            List<EthnicityModel> fetchedEthnicityData =
                state.fetchedEthnicityModel;
            fetchedEthnicityData.asMap().forEach((key, value) {
              totalMuslim += fetchedEthnicityData[key].muslim ?? 0;
              totalHillBrahman += fetchedEthnicityData[key].hillBrahman ?? 0;
              totalTeraiBrahman += fetchedEthnicityData[key].teraiBrahman ?? 0;
              totalHillJanajati += fetchedEthnicityData[key].hillJanajati ?? 0;
              totalTeraiJanajati +=
                  fetchedEthnicityData[key].teraiJanajati ?? 0;
              totalHillDalit += fetchedEthnicityData[key].hillDalit ?? 0;
              totalNotAvailable += fetchedEthnicityData[key].notAvailable ?? 0;
              totalTotalEthnicity +=
                  fetchedEthnicityData[key].totalEthnicity ?? 0;
              //print(totalMuslim);
            });
          }
          return Column(children: [
            EthnicityBarGraph(
                totalMuslim: totalMuslim,
                totalHillBrahman: totalHillBrahman,
                totalTeraiBrahman: totalTeraiBrahman,
                totalHillJanajati: totalHillJanajati,
                totalTeraiJanajati: totalTeraiJanajati,
                totalHillDalit: totalHillDalit,
                totalNotAvailable: totalNotAvailable,
                totalTotalEthnicity: totalTotalEthnicity),
            const SizedBox(
              height: 10,
            ),
            EthnicityDataTable(
                totalMuslim: totalMuslim,
                totalHillBrahman: totalHillBrahman,
                totalTeraiBrahman: totalTeraiBrahman,
                totalHillJanajati: totalHillJanajati,
                totalTeraiJanajati: totalTeraiJanajati,
                totalHillDalit: totalHillDalit,
                totalNotAvailable: totalNotAvailable,
                totalTotalEthnicity: totalTotalEthnicity),
          ]);
        }),
      ),
    );
  }
}
