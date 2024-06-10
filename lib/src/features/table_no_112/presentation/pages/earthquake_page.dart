import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/table_no_112/presentation/widgets/earthquake_bar_chart.dart';
import 'package:digital_profile/src/features/table_no_112/presentation/widgets/earthquake_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/earthquake_model.dart';
import '../../data/repository/earthquake_repository_impl.dart';
import '../bloc/earthquake_bloc.dart';

class EarthquakePage extends StatefulWidget {
  String baseUrl, endPoint;
  EarthquakePage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<EarthquakePage> createState() => _EarthquakePageState();
}

class _EarthquakePageState extends State<EarthquakePage> {
  int totalIsDamaged = 0;
  int totalIsNotDamaged = 0;
  int totalNotAvailable = 0;
  int totalDamaged = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EarthquakeBloc(
          RepositoryProvider.of<ImplEarthquakeRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetEarthquakeEvent()),
      child: BlocBuilder<EarthquakeBloc, EarthquakeState>(
        builder: (context, state) {
          if (state is EarthquakeSuccessState) {
            List<EarthquakeModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalIsDamaged += fetchedData[key].isDamaged ?? 0;
              totalIsNotDamaged += fetchedData[key].isNotDamages ?? 0;
              totalNotAvailable += fetchedData[key].notAvailable ?? 0;
              totalDamaged += fetchedData[key].total ?? 0;
            });
          }
          return Column(
            children: [
              EarthquakeBarChart(totalIsDamaged, totalIsNotDamaged,
                  totalNotAvailable, totalDamaged),
              verticalspace(),
              EarthquakeDataTable(totalIsDamaged, totalIsNotDamaged,
                  totalNotAvailable, totalDamaged),
            ],
          );
        },
      ),
    );
  }
}
