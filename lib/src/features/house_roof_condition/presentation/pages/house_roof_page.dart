import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/house_roof_condition/domain/repository/house_condition_repository.dart';
import 'package:digital_profile/src/features/house_roof_condition/presentation/widgets/house_roof_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/house_condition_model.dart';
import '../../data/repository/house_roof_condition_repository_impl.dart';
import '../bloc/house_bloc.dart';
import '../widgets/house_roof_bar_chart.dart';

class HousePage extends StatefulWidget {
  String baseUrl, endPoint;
  HousePage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<HousePage> createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {
  int totalKhar = 0;
  int totalJasta = 0;
  int totalStoneTile = 0;
  int totalRcc = 0;
  int totalWood = 0;
  int totalMud = 0;
  int totalOthers = 0;
  int totalNotAvailable = 0;
  int totalWardRoof = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HouseBloc(
          RepositoryProvider.of<ImplHouseRoofRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetHouseEvent()),
      child: BlocBuilder<HouseBloc, HouseState>(
        builder: (context, state) {
          if (state is HouseSuccessState) {
            List<HouseConditionModel> fetchedData = state.houseModel;
            fetchedData.asMap().forEach((key, value) {
              totalKhar += fetchedData[key].khar ?? 0;
              totalJasta += fetchedData[key].jasta ?? 0;
              totalStoneTile += fetchedData[key].stoneTile ?? 0;
              totalRcc += fetchedData[key].rcc ?? 0;
              totalWood += fetchedData[key].wood ?? 0;
              totalMud += fetchedData[key].mud ?? 0;
              totalOthers += fetchedData[key].others ?? 0;
              totalNotAvailable += fetchedData[key].notAvailable ?? 0;
              totalWardRoof += fetchedData[key].totalRoof ?? 0;
            });
          }
          return Column(
            children: [
              HouseRoofBarChart(
                  totalKhar,
                  totalJasta,
                  totalStoneTile,
                  totalRcc,
                  totalWood,
                  totalMud,
                  totalOthers,
                  totalNotAvailable,
                  totalWardRoof),
              verticalspace(),
              HouseRoofDataTable(
                  totalKhar,
                  totalJasta,
                  totalStoneTile,
                  totalRcc,
                  totalWood,
                  totalMud,
                  totalOthers,
                  totalNotAvailable,
                  totalWardRoof),
            ],
          );
        },
      ),
    );
  }
}
