import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/home_facilities_model.dart';
import '../bloc/home_facilities_bloc.dart';

class HomeFacilitiesDataTable extends StatelessWidget {
  int totalRadio;
  int totalTelevision;
  int totalTelephone;
  int totalComputer;
  int totalInternet;
  int totalMotorcycle;
  int totalCar;
  int totalRefrigerator;
  int totalBus;
  int totalNone;
  int totalWardHouse;
  int totalAminity;

  HomeFacilitiesDataTable(
      this.totalRadio,
      this.totalTelevision,
      this.totalTelephone,
      this.totalComputer,
      this.totalInternet,
      this.totalMotorcycle,
      this.totalCar,
      this.totalRefrigerator,
      this.totalBus,
      this.totalNone,
      this.totalWardHouse,
      this.totalAminity,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<HomeFacilitiesBloc, HomeFacilitiesState>(
        builder: (context, state) {
          if (state is HomeFacilitiesSuccessState) {
            List<HomeFacilitiesModel> fetchedHomeFacilitiesData =
                state.homeFacilitiesModel;
            return Card(
              child: DataTable(
                columns: [
                  DataColumn(label: Text(l10n.wardnumber)),
                  DataColumn(label: Text(l10n.radio)),
                  DataColumn(label: Text(l10n.television)),
                  DataColumn(label: Text(l10n.telephone)),
                  DataColumn(label: Text(l10n.computer)),
                  DataColumn(label: Text(l10n.internet)),
                  DataColumn(label: Text(l10n.motorcycle)),
                  DataColumn(label: Text(l10n.car)),
                  DataColumn(label: Text(l10n.refrigerator)),
                  DataColumn(label: Text(l10n.bus)),
                  DataColumn(label: Text(l10n.none)),
                  DataColumn(label: Text(l10n.householdCount)),
                  DataColumn(label: Text(l10n.total)),
                ],
                rows: fetchedHomeFacilitiesData.asMap().entries.map((e) {
                  return DataRow(
                      color: MaterialStateProperty.resolveWith((states) {
                        if (e.key % 2 == 0) {
                          return Colors.grey.withOpacity(0.3);
                        }
                        return null;
                      }),
                      cells: [
                        DataCell(Text(e.value.wardNumber.toString())),
                        DataCell(Text(e.value.radio?.toString() ?? '-')),
                        DataCell(Text(e.value.television?.toString() ?? '-')),
                        DataCell(Text(e.value.telephone?.toString() ?? '-')),
                        DataCell(Text(e.value.computer?.toString() ?? '-')),
                        DataCell(Text(e.value.internet?.toString() ?? '-')),
                        DataCell(Text(e.value.motorcycle?.toString() ?? '-')),
                        DataCell(Text(e.value.car?.toString() ?? '-')),
                        DataCell(Text(e.value.refrigerator?.toString() ?? '-')),
                        DataCell(Text(e.value.bus?.toString() ?? '-')),
                        DataCell(Text(e.value.none?.toString() ?? '-')),
                        DataCell(Text(e.value.houseCount?.toString() ?? '-')),
                        DataCell(
                            Text(e.value.totalWardAminity?.toString() ?? '-')),
                      ]);
                }).toList()
                  ..add(DataRow(
                      color: MaterialStateProperty.resolveWith<Color>(
                          (states) => Colors.grey.withOpacity(0.6)),
                      cells: [
                        DataCell(Text(l10n.total)),
                        DataCell(Text(totalRadio.toString())),
                        DataCell(Text(totalTelevision.toString())),
                        DataCell(Text(totalTelephone.toString())),
                        DataCell(Text(totalComputer.toString())),
                        DataCell(Text(totalInternet.toString())),
                        DataCell(Text(totalMotorcycle.toString())),
                        DataCell(Text(totalCar.toString())),
                        DataCell(Text(totalRefrigerator.toString())),
                        DataCell(Text(totalBus.toString())),
                        DataCell(Text(totalNone.toString())),
                        DataCell(Text(totalWardHouse.toString())),
                        DataCell(Text(totalAminity.toString())),
                      ])),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
