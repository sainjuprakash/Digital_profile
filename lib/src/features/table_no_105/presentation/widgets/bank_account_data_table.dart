import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/bank_account_model.dart';
import '../bloc/bank_account_bloc.dart';

class BankAccountDataTable extends StatelessWidget {
  int totalDevBank,
      totalCommercialBank,
      totalSahakari,
      totalBitiyaSanstha,
      totalNotAvailable,
      totalTotal;

  BankAccountDataTable(
      this.totalDevBank,
      this.totalCommercialBank,
      this.totalSahakari,
      this.totalBitiyaSanstha,
      this.totalNotAvailable,
      this.totalTotal,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankAccountBloc, BankAccountState>(
      builder: (context, state) {
        if (state is BankAccountSuccessState) {
          List<BankAccountModel> fetchedData = state.fetchedModel;
          return Card(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text(l10n.wardnumber)),
                DataColumn(label: Text(l10n.devBank)),
                DataColumn(label: Text(l10n.commercialBank)),
                DataColumn(label: Text(l10n.bittiyaSanstha)),
                DataColumn(label: Text(l10n.sahakari)),
                DataColumn(label: Text(l10n.Undisclosed)),
                DataColumn(label: Text(l10n.total)),
              ],
              rows: fetchedData.asMap().entries.map((e) {
                int notAvailable =
                    (e.value.total ?? 0) - (e.value.totalBankCount ?? 0);
                return DataRow(
                    color: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      if (e.key % 2 == 0) {
                        return Colors.grey.withOpacity(0.3);
                      } else {
                        return null;
                      }
                    }),
                    cells: [
                      DataCell(Text(e.value.wardNumber.toString())),
                      DataCell(Text(e.value.devBank?.toString() ?? '0')),
                      DataCell(Text(e.value.commercialBank?.toString() ?? '0')),
                      DataCell(Text(e.value.bitiyaSanstha?.toString() ?? '0')),
                      DataCell(Text(e.value.sahakari?.toString() ?? '0')),
                      DataCell(Text(notAvailable.toString())),
                      DataCell(Text(e.value.total?.toString() ?? '0')),
                    ]);
              }).toList()
                ..add(
                  DataRow(
                      color: MaterialStateProperty.resolveWith<Color>(
                          (states) => Colors.grey.withOpacity(0.6)),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalDevBank.toString())),
                        DataCell(Text(totalCommercialBank.toString())),
                        DataCell(Text(totalBitiyaSanstha.toString())),
                        DataCell(Text(totalSahakari.toString())),
                        DataCell(Text(totalNotAvailable.toString())),
                        DataCell(Text(totalTotal.toString())),
                      ]),
                ),
            ),
          ));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}