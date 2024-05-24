import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/insurance/data/model/insurance_model.dart';
import 'package:digital_profile/src/features/insurance/data/repository/insurance_repository_impl.dart';
import 'package:digital_profile/src/features/insurance/presentation/widgets/insurance_bar_chart.dart';
import 'package:digital_profile/src/features/insurance/presentation/widgets/insurance_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/insurance_bloc.dart';

class InsurancePage extends StatefulWidget {
  const InsurancePage({super.key});

  @override
  State<InsurancePage> createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {
  int totalLifeInsurance = 0;
  int totalHealthInsurance = 0;
  int totalLiveStockInsurance = 0;
  int totalOthersInsurance = 0;
  int totalNotAvailable = 0;
  int totalInsurance = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InsuranceBloc(RepositoryProvider.of<ImplInsuranceRepository>(context))
            ..add(GetInsuranceEvent()),
      child: BlocBuilder<InsuranceBloc, InsuranceState>(
        builder: (context, state) {
          if (state is InsuranceSuccessState) {
            List<InsuranceModel> fetchedInsuranceData = state.insuranceModel;
            fetchedInsuranceData.asMap().forEach((key, value) {
              totalLifeInsurance +=
                  fetchedInsuranceData[key].lifeInsurance ?? 0;
              totalHealthInsurance +=
                  fetchedInsuranceData[key].healthInsurance ?? 0;
              totalLiveStockInsurance +=
                  fetchedInsuranceData[key].liveStockInsurance ?? 0;
              totalOthersInsurance +=
                  fetchedInsuranceData[key].othersInsurance ?? 0;
              totalNotAvailable += fetchedInsuranceData[key].notAvailable ?? 0;
              totalInsurance += fetchedInsuranceData[key].totalInsurance ?? 0;
            });
          }
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                InsuranceBarChart(
                    totalLifeInsurance: totalLifeInsurance,
                    totalHealthInsurance: totalHealthInsurance,
                    totalLiveStockInsurance: totalLiveStockInsurance,
                    totalOthersInsurance: totalOthersInsurance,
                    totalNotAvailable: totalNotAvailable,
                    totalInsurance: totalInsurance),
                verticalspace(),
                InsuranceDataTable(
                    totalLifeInsurance: totalLifeInsurance,
                    totalHealthInsurance: totalHealthInsurance,
                    totalLiveStockInsurance: totalLiveStockInsurance,
                    totalOthersInsurance: totalOthersInsurance,
                    totalNotAvailable: totalNotAvailable,
                    totalInsurance: totalInsurance),
              ],
            ),
          );
        },
      ),
    );
  }
}
