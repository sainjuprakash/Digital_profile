import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/table_no_115/data/model/grant_house_model.dart';
import 'package:digital_profile/src/features/table_no_115/data/repository/grant_houses_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_115/presentation/widgets/grant_house_bar_chart.dart';
import 'package:digital_profile/src/features/table_no_115/presentation/widgets/grant_house_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/grant_house_bloc.dart';

class GrantHousePage extends StatefulWidget {
  String baseUrl, endPoint;
  GrantHousePage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<GrantHousePage> createState() => _GrantHousePageState();
}

class _GrantHousePageState extends State<GrantHousePage> {
  int totalHasBuild = 0;
  int totalHasNotBuild = 0;
  int totalNotAvailable = 0;
  int totalTotal = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GrantHouseBloc(
          RepositoryProvider.of<ImplGrantHouseRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetGrantHouseEvent()),
      child: BlocBuilder<GrantHouseBloc, GrantHouseState>(
        builder: (context, state) {
          if (state is GrantHouseSuccessState) {
            List<GrantHouseModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalHasBuild += fetchedData[key].hasBuild ?? 0;
              totalHasNotBuild += fetchedData[key].hasNotBuild ?? 0;
              totalNotAvailable += fetchedData[key].notAvailable ?? 0;
              totalTotal += fetchedData[key].total ?? 0;
            });
          }
          return Column(
            children: [
              GrantHouseBarChart(totalHasBuild, totalHasNotBuild,
                  totalNotAvailable, totalTotal),
              verticalspace(),
              GrantHouseDataTable(totalHasBuild, totalHasNotBuild,
                  totalNotAvailable, totalTotal),
            ],
          );
        },
      ),
    );
  }
}
