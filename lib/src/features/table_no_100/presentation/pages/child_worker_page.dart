import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/table_no_100/data/repository/child_worker_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_100/presentation/widgets/child_labour_bar_graph.dart';
import 'package:digital_profile/src/features/table_no_100/presentation/widgets/child_worker_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/child_worker_model.dart';
import '../bloc/child_worker_bloc.dart';

class ChildWorkerPage extends StatefulWidget {
  String baseUrl, endPoint;
  ChildWorkerPage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<ChildWorkerPage> createState() => _ChildWorkerPageState();
}

class _ChildWorkerPageState extends State<ChildWorkerPage> {
  int totalYes = 0;
  int totalNo = 0;
  int totalNotAvailable = 0;
  int totalWardHouses = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChildWorkerBloc(
          RepositoryProvider.of<ImplChildWorkerRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetChildWorkerEvent()),
      child: BlocBuilder<ChildWorkerBloc, ChildWorkerState>(
        builder: (context, state) {
          if (state is ChildWorkerSuccessState) {
            List<ChildWorkerModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalYes += fetchedData[key].yes ?? 0;
              totalNo += fetchedData[key].no ?? 0;
              totalNotAvailable += fetchedData[key].notAvailable ?? 0;
              totalWardHouses += fetchedData[key].wardNumber ?? 0;
            });
          }
          return Column(
            children: [
              ChildWorkerBarGraph(
                  totalYes, totalNo, totalNotAvailable, totalWardHouses),
              verticalspace(),
              ChildWorkerDataTable(
                  totalYes, totalNo, totalNotAvailable, totalWardHouses),
            ],
          );
        },
      ),
    );
  }
}
