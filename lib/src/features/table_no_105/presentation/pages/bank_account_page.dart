import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/table_no_105/data/repository/bank_account_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_105/presentation/widgets/bank_account_bar_chart.dart';
import 'package:digital_profile/src/features/table_no_105/presentation/widgets/bank_account_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/bank_account_model.dart';
import '../bloc/bank_account_bloc.dart';

class BankAccountPage extends StatefulWidget {
  String baseUrl, endPoint;

  BankAccountPage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<BankAccountPage> createState() => _BankAccountPageState();
}

class _BankAccountPageState extends State<BankAccountPage> {
  int totalDevBank = 0;
  int totalCommercialBank = 0;
  int totalSahakari = 0;
  int totalBitiyaSanstha = 0;
  int totalNotAvailable = 0;
  int totalTotal = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BankAccountBloc(
          RepositoryProvider.of<ImplBankAccountRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetBankAccountEvent()),
      child: BlocBuilder<BankAccountBloc, BankAccountState>(
        builder: (context, state) {
          if (state is BankAccountSuccessState) {
            List<BankAccountModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalDevBank += fetchedData[key].devBank ?? 0;
              totalCommercialBank += fetchedData[key].commercialBank ?? 0;
              totalSahakari += fetchedData[key].sahakari ?? 0;
              totalBitiyaSanstha += fetchedData[key].bitiyaSanstha ?? 0;
              totalNotAvailable += (fetchedData[key].total ?? 0) -
                  (fetchedData[key].totalBankCount ?? 0);
            });
          }
          return Column(
            children: [
              BankAccountBarChart(
                  totalDevBank,
                  totalCommercialBank,
                  totalSahakari,
                  totalBitiyaSanstha,
                  totalNotAvailable,
                  totalTotal),
              verticalspace(),
              BankAccountDataTable(
                  totalDevBank,
                  totalCommercialBank,
                  totalSahakari,
                  totalBitiyaSanstha,
                  totalNotAvailable,
                  totalTotal),
            ],
          );
        },
      ),
    );
  }
}
