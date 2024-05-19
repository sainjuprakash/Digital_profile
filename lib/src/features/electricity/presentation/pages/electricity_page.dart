import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/electricity/data/model/electricity_model.dart';
import 'package:digital_profile/src/features/electricity/data/repository/electricity_repository_impl.dart';
import 'package:digital_profile/src/features/electricity/presentation/widgets/electricity_bar_chart.dart';
import 'package:digital_profile/src/features/electricity/presentation/widgets/electricity_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/electricity_bloc.dart';

class ElectricityPage extends StatefulWidget {
  const ElectricityPage({super.key});

  @override
  State<ElectricityPage> createState() => _ElectricityPageState();
}

class _ElectricityPageState extends State<ElectricityPage> {
  int totalKerosene = 0;
  int totalBioGas = 0;
  int totalSolar = 0;
  int totalElectricityLaghu = 0;
  int totalElectricityNational = 0;
  int totalElectricityOthers = 0;
  int totalNotAvailable = 0;
  int totalHouseCount = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElectricityBloc(
          RepositoryProvider.of<ImplElectricityRepository>(context))
        ..add(GetElectricityEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 50,
        ),
        body: BlocBuilder<ElectricityBloc, ElectricityState>(
          builder: (context, state) {
            if (state is ElectricitySuccessState) {
              List<ElectricityModel> fetchedElectricityData =
                  state.electricityModel;
              fetchedElectricityData.asMap().forEach((key, value) {
                totalKerosene += fetchedElectricityData[key].kerosene ?? 0;
                totalBioGas += fetchedElectricityData[key].bioGas ?? 0;
                totalSolar += fetchedElectricityData[key].solar ?? 0;
                totalElectricityLaghu +=
                    fetchedElectricityData[key].electricityLaghu ?? 0;
                totalElectricityNational +=
                    fetchedElectricityData[key].electricityNational ?? 0;
                totalElectricityOthers +=
                    fetchedElectricityData[key].others ?? 0;
                totalNotAvailable +=
                    fetchedElectricityData[key].notAvailable ?? 0;
                totalHouseCount +=
                    fetchedElectricityData[key].totalHouseCount ?? 0;
              });
            }

            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ElectricityBarChart(
                      totalKerosene: totalKerosene,
                      totalBioGas: totalBioGas,
                      totalSolar: totalSolar,
                      totalElectricityLaghu: totalElectricityLaghu,
                      totalElectricityNational: totalElectricityNational,
                      totalElectricityOthers: totalElectricityOthers,
                      totalNotAvailable: totalNotAvailable,
                      totalHouseCount: totalHouseCount),
                  verticalspace(),
                  ElectricityDataTable(
                      totalKerosene: totalKerosene,
                      totalBioGas: totalBioGas,
                      totalSolar: totalSolar,
                      totalElectricityLaghu: totalElectricityLaghu,
                      totalElectricityNational: totalElectricityNational,
                      totalElectricityOthers: totalElectricityOthers,
                      totalNotAvailable: totalNotAvailable,
                      totalHouseCount: totalHouseCount),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
