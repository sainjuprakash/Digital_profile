import 'package:digital_profile/src/features/table_%20no_30/data/model/house_ownership_model.dart';
import 'package:digital_profile/src/features/table_%20no_30/data/repository/house_ownership_repository_impl.dart';
import 'package:digital_profile/src/features/table_%20no_30/presentation/widgets/house_ownership_bar_chart.dart';
import 'package:digital_profile/src/features/table_%20no_30/presentation/widgets/house_ownership_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/house_ownership_bloc.dart';

class HouseOwnershipPage extends StatefulWidget {
  String baseUrl, endPoint;

  HouseOwnershipPage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<HouseOwnershipPage> createState() => _HouseOwnershipPageState();
}

class _HouseOwnershipPageState extends State<HouseOwnershipPage> {
  int totalPersonal = 0;
  int totalRental = 0;
  int totalOrganizational = 0;
  int totalSukumbasi = 0;
  int totalOthers = 0;
  int totalNotAvailable = 0;
  int totalOwnerShip = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HouseOwnershipBloc(
          RepositoryProvider.of<ImplHouseOwnershipRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetHouseOwnershipEvent()),
      child: BlocBuilder<HouseOwnershipBloc, HouseOwnershipState>(
        builder: (context, state) {
          if (state is HouseOwnershipSuccessState) {
            List<HouseOwnershipModel> fetcheData = state.ownershipModel;
            fetcheData.asMap().forEach((key, value) {
              totalPersonal += fetcheData[key].personal ?? 0;
              totalRental += fetcheData[key].rental ?? 0;
              totalOrganizational += fetcheData[key].organizational ?? 0;
              totalSukumbasi += fetcheData[key].sukumbasi ?? 0;
              totalOthers += fetcheData[key].others ?? 0;
              totalNotAvailable += fetcheData[key].notAvailable ?? 0;
              totalOwnerShip += fetcheData[key].total ?? 0;
            });
          }
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                HouseOwnershipBarChart(
                    totalPersonal,
                    totalRental,
                    totalOrganizational,
                    totalSukumbasi,
                    totalOthers,
                    totalNotAvailable,
                    totalOwnerShip),
                HouseOwnershipDataTable(
                    totalPersonal,
                    totalRental,
                    totalOrganizational,
                    totalSukumbasi,
                    totalOthers,
                    totalNotAvailable,
                    totalOwnerShip),
              ],
            ),
          );
        },
      ),
    );
  }
}
