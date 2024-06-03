import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/table_no_37/data/repository/bank_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_37/presentation/widgets/bank_bar_chart.dart';
import 'package:digital_profile/src/features/table_no_37/presentation/widgets/bank_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/bank_model.dart';
import '../bloc/bank_bloc.dart';

class BankPage extends StatefulWidget {
  String baseUrl, endPoint;
  BankPage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  int totalHasBankAccount = 0;
  int totalHasNotBankAccount = 0;
  int totalHouses = 0;
  int totalBankAcc = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BankBloc(
          RepositoryProvider.of<ImplBankRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetBankEvent()),
      child: BlocBuilder<BankBloc, BankState>(
        builder: (context, state) {
          if (state is BankSuccessState) {
            List<BankModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalHasBankAccount += fetchedData[key].bankAccount ?? 0;
              totalHasNotBankAccount += fetchedData[key].noBankAccount ?? 0;
              totalHouses += fetchedData[key].wardHouses ?? 0;
              totalBankAcc += fetchedData[key].totalBankAccount ?? 0;
            });
          }
          return Column(
            children: [
              BankBarChart(totalHasBankAccount, totalHasNotBankAccount,
                  totalHouses, totalBankAcc),
              verticalspace(),
              BankDataTable(totalHasBankAccount, totalHasNotBankAccount,
                  totalHouses, totalBankAcc),
            ],
          );
        },
      ),
    );
  }
}
