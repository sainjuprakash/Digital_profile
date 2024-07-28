import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/loan_model.dart';
import '../bloc/loan_bloc.dart';

class LoanDataTable extends StatelessWidget {
  int totalAgriculture,
      totalBusiness,
      totalHouseExp,
      totalForeignEmp,
      totalEducation,
      totalMedical,
      totalOthers,
      totalNotAvailable,
      totalWardHouses,
      totalLoan;

  LoanDataTable(
      this.totalAgriculture,
      this.totalBusiness,
      this.totalHouseExp,
      this.totalForeignEmp,
      this.totalEducation,
      this.totalMedical,
      this.totalOthers,
      this.totalNotAvailable,
      this.totalWardHouses,
      this.totalLoan,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<LoanBloc, LoanState>(
        builder: (context, state) {
          if (state is LoanLoadingState) {
            return const SizedBox(
              height: 60,
              width: double.maxFinite,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          if (state is LoanSuccessState) {
            List<LoanModel> fetchedData = state.fetchedModel;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  columns: [
                    DataColumn(label: Text(l10n.wardnumber.toString())),
                    DataColumn(label: Text(l10n.agricultureLoan)),
                    DataColumn(label: Text(l10n.businessLoan)),
                    DataColumn(label: Text(l10n.houseExpLoan)),
                    DataColumn(label: Text(l10n.educationLoan)),
                    DataColumn(label: Text(l10n.medicalLoan)),
                    DataColumn(label: Text(l10n.others)),
                    DataColumn(label: Text(l10n.Undisclosed)),
                    DataColumn(label: Text(l10n.total)),
                  ],
                  rows: fetchedData.asMap().entries.map((e) {
                    int notAvailable =
                        (e.value.wardHouses ?? 0) - (e.value.totalLoan ?? 0);
                    return DataRow(
                        color: WidgetStateProperty.resolveWith(
                            (Set<WidgetState> states) {
                          if (e.key % 2 == 0) {
                            return Colors.grey.withOpacity(0.3);
                          } else {
                            return null;
                          }
                        }),
                        cells: [
                          DataCell(Text(e.value.wardNumber.toString() ?? '0')),
                          DataCell(
                              Text(e.value.agricultureLoan?.toString() ?? '0')),
                          DataCell(
                              Text(e.value.businessLoan?.toString() ?? '0')),
                          DataCell(
                              Text(e.value.houseExpLoan?.toString() ?? '0')),
                          DataCell(
                              Text(e.value.educationLoan?.toString() ?? '0')),
                          DataCell(
                              Text(e.value.medicalLoan?.toString() ?? '0')),
                          DataCell(Text(e.value.othersLoan?.toString() ?? '0')),
                          DataCell(Text(notAvailable.toString())),
                          DataCell(Text(e.value.wardHouses?.toString() ?? '0')),
                        ]);
                  }).toList()
                    ..add(DataRow(
                        color: WidgetStateProperty.resolveWith<Color>(
                            (states) => Colors.grey.withOpacity(0.6)),
                        cells: [
                          DataCell(Text(l10n.total.toString())),
                          DataCell(Text(totalAgriculture.toString())),
                          DataCell(Text(totalBusiness.toString())),
                          DataCell(Text(totalHouseExp.toString())),
                          DataCell(Text(totalEducation.toString())),
                          DataCell(Text(totalMedical.toString())),
                          DataCell(Text(totalOthers.toString())),
                          DataCell(Text(totalNotAvailable.toString())),
                          DataCell(Text(totalWardHouses.toString())),
                        ]))),
            );
          }
          if (state is LoanFailureState) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(l10n.loadDataFail),
              ),
            );
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(l10n.unknownError),
            ),
          );
        },
      ),
    );
  }
}
