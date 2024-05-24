import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/residence/data/repository/residence_repository_impl.dart';
import 'package:digital_profile/src/features/residence/presentation/widgets/residence_bar_chart.dart';
import 'package:digital_profile/src/features/residence/presentation/widgets/residence_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/residence_model.dart';
import '../bloc/residence_bloc.dart';

class ResidencePage extends StatefulWidget {
  const ResidencePage({super.key});

  @override
  State<ResidencePage> createState() => _ResidencePageState();
}

class _ResidencePageState extends State<ResidencePage> {
  int totalDefault = 0;
  int totalForeign = 0;
  int totalCountrySide = 0;
  int totalNotAvailable = 0;
  int totalLivingStatus = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ResidenceBloc(RepositoryProvider.of<ImplResidenceRepository>(context))
            ..add(GetResidenceEvent()),
      child: BlocBuilder<ResidenceBloc, ResidenceState>(
        builder: (context, state) {
          if (state is ResidenceSuccessState) {
            List<ResidenceModel> fetchedResidenceData =
                state.fetchedResidenceModel;
            fetchedResidenceData.asMap().forEach((key, value) {
              totalDefault += fetchedResidenceData[key].lsDefault ?? 0;
              totalForeign += fetchedResidenceData[key].lsForeign ?? 0;
              totalCountrySide += fetchedResidenceData[key].lsCountrySide ?? 0;
              totalNotAvailable +=
                  fetchedResidenceData[key].lsNotAvailable ?? 0;
              totalLivingStatus +=
                  fetchedResidenceData[key].lsTotalLivingStatus ?? 0;
            });
          }
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ResidenceBarChart(
                    totalDefault: totalDefault,
                    totalForeign: totalForeign,
                    totalCountrySide: totalCountrySide,
                    totalNotAvailable: totalNotAvailable,
                    totalLivingStatus: totalLivingStatus),
                verticalspace(),
                ResidenceDataTable(
                    totalDefault: totalDefault,
                    totalForeign: totalForeign,
                    totalCountrySide: totalCountrySide,
                    totalNotAvailable: totalNotAvailable,
                    totalLivingStatus: totalLivingStatus),
              ],
            ),
          );
        },
      ),
    );
  }
}
