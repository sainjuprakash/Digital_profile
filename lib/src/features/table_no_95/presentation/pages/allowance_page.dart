import 'package:digital_profile/src/features/table_no_95/data/model/allowance_model.dart';
import 'package:digital_profile/src/features/table_no_95/data/repository/allowance_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_95/presentation/bloc/allowance_bloc.dart';
import 'package:digital_profile/src/features/table_no_95/presentation/widgets/allowance_bar_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllowancePage extends StatefulWidget {
  String baseUrl, endPoint;

  AllowancePage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<AllowancePage> createState() => _AllowancePageState();
}

class _AllowancePageState extends State<AllowancePage> {
  int totalProcessWrong = 0;
  int totalbriddhaBhatta = 0;
  int totalWidow = 0;
  int totalWidower = 0;
  int totalDisabled = 0;
  int totalNotTaken = 0;
  int totalNotProcessed = 0;
  int totalIndigenous = 0;
  int totalNotAvailable = 0;
  int totalSocialSecurity = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllowanceBloc(
          RepositoryProvider.of<ImplAllowanceRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetAllowanceEvent()),
      child: BlocBuilder<AllowanceBloc, AllowanceState>(
        builder: (context, state) {
          if (state is AllowanceSuccessState) {
            List<AllowanceModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalProcessWrong += fetchedData[key].processWrong ?? 0;
              totalbriddhaBhatta += fetchedData[key].briddhaBhatta ?? 0;
              totalWidow += fetchedData[key].widow ?? 0;
              totalWidower += fetchedData[key].widower ?? 0;
              totalDisabled += fetchedData[key].disabled ?? 0;
              totalNotTaken += fetchedData[key].notTaken ?? 0;
              totalNotProcessed += fetchedData[key].notProcessed ?? 0;
              totalIndigenous += fetchedData[key].indigenous ?? 0;
              totalNotAvailable += fetchedData[key].notAvailable ?? 0;
              totalSocialSecurity += fetchedData[key].socialSecurity ?? 0;
            });
          }
          return Column(
            children: [
              AllowanceBarChart(
                  totalProcessWrong,
                  totalbriddhaBhatta,
                  totalWidow,
                  totalWidower,
                  totalDisabled,
                  totalNotTaken,
                  totalNotProcessed,
                  totalIndigenous,
                  totalNotAvailable,
                  totalSocialSecurity),
            ],
          );
        },
      ),
    );
  }
}
