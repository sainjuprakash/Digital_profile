import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/religion/data/repository/religion_repository_impl.dart';
import 'package:digital_profile/src/features/religion/presentation/widget/religion_bar_chart.dart';
import 'package:digital_profile/src/features/religion/presentation/widget/religion_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/religion_model.dart';
import '../bloc/religion_bloc.dart';

class ReligionPage extends StatefulWidget {
  const ReligionPage({super.key});

  @override
  State<ReligionPage> createState() => _ReligionPageState();
}

class _ReligionPageState extends State<ReligionPage> {
  int totalHindu = 0;
  int totalBoudha = 0;
  int totalChristian = 0;
  int totalMuslim = 0;
  int totalKirat = 0;
  int totalJains = 0;
  int totalBon = 0;
  int totalOthers = 0;
  int totalNotAvailable = 0;
  int totalWardRel = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ReligionBloc(RepositoryProvider.of<ImplReligionRepository>(context))
            ..add(GetReligionEvent()),
      child: Scaffold(
        appBar: AppBar(),
        body:
            BlocBuilder<ReligionBloc, ReligionState>(builder: (context, state) {
          if (state is ReligionSuccessState) {
            List<ReligionModel> fetchedReligionData = state.religionModel;
            fetchedReligionData.asMap().forEach((key, value) {
              totalHindu += fetchedReligionData[key].hindu ?? 0;
              totalBoudha += fetchedReligionData[key].boudha ?? 0;
              totalMuslim += fetchedReligionData[key].muslim ?? 0;
              totalBon += fetchedReligionData[key].bon ?? 0;
              totalChristian += fetchedReligionData[key].christian ?? 0;
              totalJains += fetchedReligionData[key].jains ?? 0;
              totalKirat += fetchedReligionData[key].kirat ?? 0;
              totalOthers += fetchedReligionData[key].others ?? 0;
              totalNotAvailable += fetchedReligionData[key].notAvailable ?? 0;
              totalWardRel += fetchedReligionData[key].wardRelCount ?? 0;
            });
          }
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ReligionBarChart(
                    totalHindu: totalHindu,
                    totalBoudha: totalBoudha,
                    totalChristian: totalChristian,
                    totalMuslim: totalMuslim,
                    totalKirat: totalKirat,
                    totalJains: totalJains,
                    totalBon: totalBon,
                    totalOthers: totalOthers,
                    totalNotAvailable: totalNotAvailable,
                    totalWardRel: totalWardRel),
                verticalspace(),
                ReligionDataTable(
                    totalHindu: totalHindu,
                    totalBoudha: totalBoudha,
                    totalChristian: totalChristian,
                    totalMuslim: totalMuslim,
                    totalKirat: totalKirat,
                    totalJains: totalJains,
                    totalBon: totalBon,
                    totalOthers: totalOthers,
                    totalNotAvailable: totalNotAvailable,
                    totalWardRel: totalWardRel),
              ],
            ),
          );
        }),
      ),
    );
  }
}
