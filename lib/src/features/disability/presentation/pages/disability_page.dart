import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/disability/data/model/disability_model.dart';
import 'package:digital_profile/src/features/disability/data/repository/disability_repository_impl.dart';
import 'package:digital_profile/src/features/disability/presentation/widgets/disability_bar_chart.dart';
import 'package:digital_profile/src/features/disability/presentation/widgets/disability_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant/appBar/custom_app_bar.dart';
import '../bloc/disability_bloc.dart';

class DisabilityPage extends StatefulWidget {
  DisabilityPage({super.key});

  @override
  State<DisabilityPage> createState() => _DisabilityPageState();
}

class _DisabilityPageState extends State<DisabilityPage> {
  int totalAble = 0;
  int totalDisable = 0;
  int totalDeaf = 0;
  int totalBlind = 0;
  int totalHearingLoss = 0;
  int totalSlammer = 0;
  int totalCeleberal = 0;
  int totalRetarded = 0;
  int totalMental = 0;
  int totalMultiDisable = 0;
  int totalNotAvailable = 0;
  int totalWardDis = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backGroundColor: Colors.blueAccent,

      ),
      body: BlocProvider(
        create: (context) => DisabilityBloc(
            RepositoryProvider.of<ImplDisabilityRepository>(context))
          ..add(GetDisabilityEvent()),
        child: BlocBuilder<DisabilityBloc, DisabilityState>(
          builder: (context, state) {
            if (state is DisabilitySuccessState) {
              List<DisabilityModel> fetchedDisabilityModel =
                  state.disabilityModel;
              fetchedDisabilityModel.asMap().forEach((key, value) {
                totalAble += fetchedDisabilityModel[key].able ?? 0;
                totalDisable += fetchedDisabilityModel[key].disable ?? 0;
                totalDeaf += fetchedDisabilityModel[key].deaf ?? 0;
                totalBlind += fetchedDisabilityModel[key].blind ?? 0;
                totalHearingLoss +=
                    fetchedDisabilityModel[key].hearingLoss ?? 0;
                totalSlammer += fetchedDisabilityModel[key].slammer ?? 0;
                totalCeleberal += fetchedDisabilityModel[key].celeberal ?? 0;
                totalRetarded += fetchedDisabilityModel[key].redarded ?? 0;
                totalMental += fetchedDisabilityModel[key].mental ?? 0;

                totalMultiDisable +=
                    fetchedDisabilityModel[key].multiDisable ?? 0;
                totalNotAvailable +=
                    fetchedDisabilityModel[key].notAvailable ?? 0;
                totalWardDis +=
                    fetchedDisabilityModel[key].totalDisabilityStatus ?? 0;
              });
            }
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  verticalspace(),
                  DisabilityBarChart(
                      totalAble: totalAble,
                      totalDisable: totalDisable,
                      totalDeaf: totalDeaf,
                      totalBlind: totalBlind,
                      totalHearingLoss: totalHearingLoss,
                      totalSlammer: totalSlammer,
                      totalCeleberal: totalCeleberal,
                      totalRetarded: totalRetarded,
                      totalMental: totalMental,
                      totalMultiDisable: totalMultiDisable,
                      totalNotAvailable: totalNotAvailable,
                      totalWardDis: totalWardDis),
                  verticalspace(),
                  DisabilityDataTable(
                      totalAble: totalAble,
                      totalDisable: totalDisable,
                      totalDeaf: totalDeaf,
                      totalBlind: totalBlind,
                      totalHearingLoss: totalHearingLoss,
                      totalSlammer: totalSlammer,
                      totalCeleberal: totalCeleberal,
                      totalRetarded: totalRetarded,
                      totalMental: totalMental,
                      totalMultiDisable: totalMultiDisable,
                      totalNotAvailable: totalNotAvailable,
                      totalWardDis: totalWardDis),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
