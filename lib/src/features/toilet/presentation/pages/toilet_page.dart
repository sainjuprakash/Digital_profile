import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/toilet/data/repository/toilet_repository_impl.dart';
import 'package:digital_profile/src/features/toilet/presentation/widgets/toilet_bar_chart.dart';
import 'package:digital_profile/src/features/toilet/presentation/widgets/toilet_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/toilet_model.dart';
import '../bloc/toilet_bloc.dart';

class ToiletPage extends StatefulWidget {
  const ToiletPage({super.key});

  @override
  State<ToiletPage> createState() => _ToiletPageState();
}

class _ToiletPageState extends State<ToiletPage> {
  int totalNoToilet = 0;
  int totalPublicDhal = 0;
  int totalSeftiTank = 0;
  int totalOrdinary = 0;
  int totalNotAvailable = 0;
  int totalWardToilet = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ToiletBloc(RepositoryProvider.of<ImplToiletRepository>(context))
            ..add(GetToiletEvent()),
      child: BlocBuilder<ToiletBloc, ToiletState>(
        builder: (context, state) {
          if (state is ToiletLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ToiletSuccessState) {
            List<ToiletModel> fetchedToiletData = state.toiletModel;
            fetchedToiletData.asMap().forEach((key, value) {
              totalNoToilet += fetchedToiletData[key].noToilet ?? 0;
              totalPublicDhal += fetchedToiletData[key].publicDhal ?? 0;
              totalSeftiTank += fetchedToiletData[key].seftiTank ?? 0;
              totalOrdinary += fetchedToiletData[key].ordinary ?? 0;
              totalNotAvailable += fetchedToiletData[key].notAvailable ?? 0;
              totalWardToilet += fetchedToiletData[key].totalToilet ?? 0;
            });
          }
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ToiletBarChart(totalNoToilet, totalPublicDhal, totalSeftiTank,
                    totalOrdinary, totalNotAvailable, totalWardToilet),
                verticalspace(),
                ToiletDataTable(totalNoToilet, totalPublicDhal, totalSeftiTank,
                    totalOrdinary, totalNotAvailable, totalWardToilet),
              ],
            ),
          );
        },
      ),
    );
  }
}
