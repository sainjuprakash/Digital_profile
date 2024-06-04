import 'package:digital_profile/src/features/animal_husbandry/data/repository/animals_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_45/data/repository/meat_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_45/presentation/widgets/meat_bar_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/meat_model.dart';
import '../bloc/meat_bloc.dart';

class MeatPage extends StatefulWidget {
  String baseUrl, endPoint;

  MeatPage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<MeatPage> createState() => _MeatPageState();
}

class _MeatPageState extends State<MeatPage> {
  int totalAnimalsQuantity = 0;
  int totalMeatKg = 0;
  int totalEarning = 0;
  int totalHouseCount = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeatBloc(
          RepositoryProvider.of<ImplMeatRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetMeatEvent()),
      child: BlocBuilder<MeatBloc, MeatState>(
        builder: (context, state) {
          if (state is MeatSuccessState) {
            List<MeatModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalAnimalsQuantity += fetchedData[key].animalsQuantity ?? 0;
              totalMeatKg += fetchedData[key].meatKg ?? 0;
              totalEarning += fetchedData[key].meatEarning ?? 0;
              totalHouseCount += fetchedData[key].houseCount ?? 0;
            });
          }
          return Column(
            children: [
              MeatDataTable(totalAnimalsQuantity, totalMeatKg, totalEarning,
                  totalHouseCount),
            ],
          );
        },
      ),
    );
  }
}
