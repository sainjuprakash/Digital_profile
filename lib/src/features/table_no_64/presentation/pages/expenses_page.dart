import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/table_no_64/data/repository/expenses_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_64/presentation/widgets/expenses_data_table.dart';
import 'package:digital_profile/src/features/table_no_64/presentation/widgets/expenses_pie_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/expenses_model.dart';
import '../bloc/expenses_bloc.dart';

class ExpensesPage extends StatefulWidget {
  String baseUrl, endPoint;

  ExpensesPage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  int totalClothes = 0;
  int totalEducation = 0;
  int totalHealth = 0;
  int totalFestival = 0;
  int totalAgriculture = 0;
  int totalOthers = 0;
  int totalExpenses = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpensesBloc(
          RepositoryProvider.of<ImplExpensesRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetExpensesEvent()),
      child: BlocBuilder<ExpensesBloc, ExpensesState>(
        builder: (context, state) {
          if (state is ExpensesSuccessState) {
            List<ExpensesModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalClothes += fetchedData[key].clothes ?? 0;
              totalEducation += fetchedData[key].education ?? 0;
              totalHealth += fetchedData[key].health ?? 0;
              totalFestival += fetchedData[key].festival ?? 0;
              totalAgriculture += fetchedData[key].agriculture ?? 0;
              totalOthers += fetchedData[key].others ?? 0;
              totalExpenses += fetchedData[key].totalExpenses ?? 0;
            });
          }
          return Column(
            children: [
              ExpensesPieChart(totalClothes, totalEducation, totalHealth,
                  totalFestival, totalAgriculture, totalOthers, totalExpenses),
              verticalspace(),
              ExpensesDataTable(totalClothes, totalEducation, totalHealth,
                  totalFestival, totalAgriculture, totalOthers, totalExpenses),
            ],
          );
        },
      ),
    );
  }
}
