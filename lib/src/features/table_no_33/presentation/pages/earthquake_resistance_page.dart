import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/table_no_33/data/repository/earthquake_resistance_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_33/presentation/widgets/earthquake_resistance_bar_chart.dart';
import 'package:digital_profile/src/features/table_no_33/presentation/widgets/earthquake_resistance_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/earthquake_resistance_model.dart';
import '../bloc/earthquake_resistance_bloc.dart';

class EarthquakeResistancePage extends StatefulWidget {
  String baseUrl, endPoint;

  EarthquakeResistancePage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<EarthquakeResistancePage> createState() =>
      _EarthquakeResistancePageState();
}

class _EarthquakeResistancePageState extends State<EarthquakeResistancePage> {
  int totalResistance = 0;
  int totalNotResistance = 0;
  int totalResistanceData = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EarthquakeResistanceBloc(
          RepositoryProvider.of<ImplEarthquakeResistanceRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetEarthquakeResistanceEvent()),
      child: BlocBuilder<EarthquakeResistanceBloc, EarthquakeResistanceState>(
        builder: (context, state) {
          if (state is EarthquakeResistanceSuccessState) {
            List<EarthquakeResistanceModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalResistance += fetchedData[key].earthquakeResistance ?? 0;
              totalNotResistance +=
                  fetchedData[key].notEarthquakeResistance ?? 0;
              totalResistanceData += fetchedData[key].total ?? 0;
            });
          }
          return Column(
            children: [
              EarthquakeResistanceBarChart(
                  totalResistance, totalNotResistance, totalResistanceData),
              verticalspace(),
              EarthquakeResistanceDataTable(
                  totalResistance, totalNotResistance, totalResistanceData),
            ],
          );
        },
      ),
    );
  }
}
