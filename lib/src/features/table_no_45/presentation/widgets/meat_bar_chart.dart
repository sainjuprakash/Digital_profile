import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/meat_model.dart';
import '../bloc/meat_bloc.dart';

class MeatDataTable extends StatelessWidget {
  int totalAnimalsQuantity, totalMeatKg, totalEarning, totalHouseCount;

  MeatDataTable(this.totalAnimalsQuantity, this.totalMeatKg, this.totalEarning,
      this.totalHouseCount,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.meatTitle),
          BlocBuilder<MeatBloc, MeatState>(
            builder: (context, state) {
              if (state is MeatLoadingState) {
                const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ));
              }
              if (state is MeatSuccessState) {
                List<MeatModel> fetchedData = state.fetchedModel;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columns: [
                        DataColumn(label: Text(l10n.wardnumber)),
                        DataColumn(label: Text(l10n.meatHouseCount)),
                        DataColumn(label: Text(l10n.animalsQnty)),
                        DataColumn(label: Text(l10n.meatKg)),
                        DataColumn(label: Text(l10n.meatEarning)),
                      ],
                      rows: fetchedData.asMap().entries.map((e) {
                        return DataRow(
                            color: WidgetStateProperty.resolveWith((states) {
                              if (e.key % 2 == 0) {
                                return Colors.grey.withOpacity(0.3);
                              } else {
                                return null;
                              }
                            }),
                            cells: [
                              DataCell(Text(e.value.wardNumber.toString())),
                              DataCell(
                                  Text(e.value.houseCount?.toString() ?? '0')),
                              DataCell(Text(
                                  e.value.animalsQuantity?.toString() ?? '0')),
                              DataCell(Text(e.value.meatKg?.toString() ?? '0')),
                              DataCell(
                                  Text(e.value.meatEarning?.toString() ?? '0')),
                            ]);
                      }).toList()
                        ..add(DataRow(
                            color: WidgetStateProperty.resolveWith<Color>(
                                (states) {
                              return Colors.grey.withOpacity(0.6);
                            }),
                            cells: [
                              DataCell(Text(l10n.total)),
                              DataCell(Text(totalHouseCount.toString())),
                              DataCell(Text(totalAnimalsQuantity.toString())),
                              DataCell(Text(totalMeatKg.toString())),
                              DataCell(Text(totalEarning.toString()))
                            ]))),
                );
              }
              if (state is MeatFailureState) {
                return const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(child: Text('Unable to load data')),
                );
              }
              return const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(child: Text('Something went wrong')));
            },
          ),
        ],
      ),
    );
  }
}
