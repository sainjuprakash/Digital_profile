import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/table_no_74/data/repository/settlement_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_74/presentation/widgets/settlement_bar_graph.dart';
import 'package:digital_profile/src/features/table_no_74/presentation/widgets/settlement_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/settlement_model.dart';
import '../bloc/settlement_bloc.dart';

class SettlementPage extends StatefulWidget {
  String baseUrl, endPoint;

  SettlementPage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<SettlementPage> createState() => _SettlementPageState();
}

class _SettlementPageState extends State<SettlementPage> {
  int totalPermanent = 0;
  int totalTemporary = 0;
  int totalOthers = 0;
  int totalResidence = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettlementBloc(
          RepositoryProvider.of<ImplSettlementRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetSettlementEvent()),
      child: BlocBuilder<SettlementBloc, SettlementState>(
        builder: (context, state) {
          if (state is SettlementSuccessState) {
            List<SettlementModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalPermanent += fetchedData[key].permanent ?? 0;
              totalTemporary += fetchedData[key].temporary ?? 0;
              totalOthers += fetchedData[key].others ?? 0;
              totalResidence += fetchedData[key].total ?? 0;
            });
          }
          return Column(
            children: [
              SettlementBarChart(
                  totalPermanent, totalTemporary, totalOthers, totalResidence),
              verticalspace(),
              SettlementDataTable(
                  totalPermanent, totalTemporary, totalOthers, totalResidence),
            ],
          );
        },
      ),
    );
  }
}
