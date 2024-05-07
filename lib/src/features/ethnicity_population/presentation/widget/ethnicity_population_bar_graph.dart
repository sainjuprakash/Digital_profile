import 'package:digital_profile/src/features/ethnicity_population/data/repository/ethnicity_population_repository_impl.dart';
import 'package:digital_profile/src/features/ethnicity_population/presentation/bloc/ethnicity_population_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/ethnicity_population.dart';

class EthnicityPopulationBarChart extends StatefulWidget {
  const EthnicityPopulationBarChart({super.key});

  @override
  State<EthnicityPopulationBarChart> createState() =>
      _EthnicityPopulationBarChartState();
}

class _EthnicityPopulationBarChartState
    extends State<EthnicityPopulationBarChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => EthnicityPopulationBloc(
            RepositoryProvider.of<ImplEthnicityPopulationRepository>(context))
          ..add(GetEthnicityPopulationEvent()),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'जातजाती अनुसार जनसंख्या',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            BlocBuilder<EthnicityPopulationBloc, EthnicityPopulationState>(
                builder: (context, state) {
              if (state is EthnicityPopulationLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is EthnicityPopulationSuccessState) {
                List<EthnicityPopulationModel> fetchedEthPopData =
                    state.ethnicityPopulationModel;
                //print(fetchedEthPopData);
                Text(fetchedEthPopData.length.toString());
              }
              if (state is EthnicityPopulationFailureState) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Text('Unable to load ethnicity population data')),
                );
              }
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text('Something went wrong')),
              );
            }),
          ],
        ),
      ),
    );
  }
}
