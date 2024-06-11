import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/table_no_113/data/model/earthquake_grant_model.dart';
import 'package:digital_profile/src/features/table_no_113/data/repository/earthquake_grant_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_113/presentation/widgets/earthquake_grant_bar_chart.dart';
import 'package:digital_profile/src/features/table_no_113/presentation/widgets/earthquake_grant_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/earthquake_grant_bloc.dart';

class EarthquakeGrantPage extends StatefulWidget {
  String baseUrl, endPoint;
  EarthquakeGrantPage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<EarthquakeGrantPage> createState() => _EarthquakeGrantPageState();
}

class _EarthquakeGrantPageState extends State<EarthquakeGrantPage> {
  int totalGotGrant = 0;
  int totalHasNotGotGranted = 0;
  int totalNotAvailable = 0;
  int totalTotal = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EarthquakeGrantBloc(
          RepositoryProvider.of<ImplEarthquakeGrantRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetEarthquakeGrantEvent()),
      child: BlocBuilder<EarthquakeGrantBloc, EarthquakeGrantState>(
        builder: (context, state) {
          if (state is EarthquakeGrantSuccessState) {
            List<EarthquakeGrantModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalGotGrant += fetchedData[key].gotGranted ?? 0;
              totalHasNotGotGranted += fetchedData[key].doesNotGotGranted ?? 0;
              totalNotAvailable += fetchedData[key].notAvailable ?? 0;
              totalTotal += fetchedData[key].totalGranted ?? 0;
            });
          }
          return Column(
            children: [
              EarthquakeGrantBarChart(
                  totalNotAvailable, totalHasNotGotGranted, totalGotGrant),
              verticalspace(),
              EarthquakeGrantDatatable(totalNotAvailable, totalHasNotGotGranted,
                  totalGotGrant, totalTotal),
            ],
          );
        },
      ),
    );
  }
}
