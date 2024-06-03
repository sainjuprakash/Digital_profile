import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/bank_model.dart';
import '../bloc/bank_bloc.dart';

class BankDataTable extends StatelessWidget {
  int totalHasBankAccount, totalHasNotBankAccount, totalHouses, totalBankAcc;
  BankDataTable(this.totalHasBankAccount, this.totalHasNotBankAccount,
      this.totalHouses, this.totalBankAcc,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankBloc, BankState>(
      builder: (context, state) {
        if (state is BankSuccessState) {
          List<BankModel> fetchedData = state.fetchedModel;
          return Card(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columns: [
                        DataColumn(label: Text(l10n.wardnumber)),
                        DataColumn(label: Text(l10n.hasbankAc)),
                        DataColumn(label: Text(l10n.noBankAc)),
                        DataColumn(label: Text(l10n.notavailable)),
                        DataColumn(label: Text(l10n.total))
                      ],
                      rows: fetchedData.asMap().entries.map((e) {
                        int totalNotAvailable = (e.value.wardHouses ?? 0) -
                            (e.value.totalBankAccount ?? 0);
                        return DataRow(
                            color: MaterialStateProperty.resolveWith(
                                (Set<MaterialState> state) {
                              if (e.key % 2 == 0) {
                                return Colors.grey.withOpacity(0.3);
                              } else {
                                return null;
                              }
                            }),
                            cells: [
                              DataCell(Text(e.value.wardHouses.toString())),
                              DataCell(
                                  Text(e.value.bankAccount?.toString() ?? '-')),
                              DataCell(Text(
                                  e.value.noBankAccount?.toString() ?? '-')),
                              DataCell(Text(totalNotAvailable.toString())),
                              DataCell(
                                  Text(e.value.wardHouses?.toString() ?? '-'))
                            ]);
                      }).toList()
                        ..add(DataRow(
                            color: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              return Colors.grey.withOpacity(0.6);
                            }),
                            cells: [
                              DataCell(Text(l10n.total)),
                              DataCell(Text(totalHasBankAccount.toString())),
                              DataCell(Text(totalHasNotBankAccount.toString())),
                              DataCell(Text(
                                  (totalHouses - totalBankAcc).toString())),
                              DataCell(Text(totalHouses.toString())),
                            ])))));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
