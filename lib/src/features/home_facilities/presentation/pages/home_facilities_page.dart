import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/home_facilities/data/repository/home_facilities_repository_impl.dart';
import 'package:digital_profile/src/features/home_facilities/presentation/widgets/home_facilities_bar_chart.dart';
import 'package:digital_profile/src/features/home_facilities/presentation/widgets/home_facilities_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/home_facilities_model.dart';
import '../bloc/home_facilities_bloc.dart';

class HomeFacilitiesPage extends StatefulWidget {
  String baseUrl, endPoint;
  HomeFacilitiesPage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<HomeFacilitiesPage> createState() => _HomeFacilitiesPageState();
}

class _HomeFacilitiesPageState extends State<HomeFacilitiesPage> {
  int totalRadio = 0;
  int totalTelevision = 0;
  int totalTelephone = 0;
  int totalComputer = 0;
  int totalInternet = 0;
  int totalMotorcycle = 0;
  int totalCar = 0;
  int totalRefrigerator = 0;
  int totalBus = 0;
  int totalNone = 0;
  int totalWardHouse = 0;
  int totalAminity = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeFacilitiesBloc(
          RepositoryProvider.of<ImplHomeFacilitiesRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetHomeFacilitiesEvent()),
      child: BlocBuilder<HomeFacilitiesBloc, HomeFacilitiesState>(
        builder: (context, state) {
          if (state is HomeFacilitiesSuccessState) {
            List<HomeFacilitiesModel> fetchedHomeFacilitiesData =
                state.homeFacilitiesModel;
            fetchedHomeFacilitiesData.asMap().forEach((key, value) {
              totalRadio += fetchedHomeFacilitiesData[key].radio ?? 0;
              totalTelevision += fetchedHomeFacilitiesData[key].television ?? 0;
              totalTelephone += fetchedHomeFacilitiesData[key].telephone ?? 0;
              totalComputer += fetchedHomeFacilitiesData[key].computer ?? 0;
              totalInternet += fetchedHomeFacilitiesData[key].internet ?? 0;
              totalMotorcycle += fetchedHomeFacilitiesData[key].motorcycle ?? 0;
              totalCar += fetchedHomeFacilitiesData[key].car ?? 0;
              totalRefrigerator +=
                  fetchedHomeFacilitiesData[key].refrigerator ?? 0;
              totalBus += fetchedHomeFacilitiesData[key].bus ?? 0;
              totalNone += fetchedHomeFacilitiesData[key].none ?? 0;
              totalWardHouse += fetchedHomeFacilitiesData[key].houseCount ?? 0;
              totalAminity +=
                  fetchedHomeFacilitiesData[key].totalWardAminity ?? 0;
            });
          }
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                HomeFacilitiesBarChart(
                    totalRadio,
                    totalTelevision,
                    totalTelephone,
                    totalComputer,
                    totalInternet,
                    totalMotorcycle,
                    totalCar,
                    totalRefrigerator,
                    totalBus,
                    totalNone,
                    totalWardHouse,
                    totalAminity),
                verticalspace(),
                HomeFacilitiesDataTable(
                    totalRadio,
                    totalTelevision,
                    totalTelephone,
                    totalComputer,
                    totalInternet,
                    totalMotorcycle,
                    totalCar,
                    totalRefrigerator,
                    totalBus,
                    totalNone,
                    totalWardHouse,
                    totalAminity),
              ],
            ),
          );
        },
      ),
    );
  }
}
