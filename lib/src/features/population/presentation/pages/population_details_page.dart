import 'package:digital_profile/src/features/population/data/repository/population_repository_impl.dart';
import 'package:digital_profile/src/features/population/presentation/widgets/population_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/population_bloc.dart';
import '../widgets/househead_details_bar_graph.dart';
import '../widgets/population_details_bar_graph.dart';

class PopulationDetailsPage extends StatefulWidget {
  const PopulationDetailsPage({super.key});

  @override
  State<PopulationDetailsPage> createState() => _PopulationDetailsPageState();
}

final List<Color> _colorsMaleFemale = [
  const Color(0xFF1976D2),
  const Color(0xFF64B5F6),
  const Color(0xFF2196F3)
];
final List<Color> _colorsMaleFemaleHh = [
  const Color(0xFF1976D2),
  const Color(0xFF64B5F6),
];
final List<String> _representations = ['पुरुष', 'महिला', 'तेस्रो लिङ्गी'];
final List<String> _representationsMfHh = [
  'पुरुष घरमुली',
  'महिला घरमुली',
];

class _PopulationDetailsPageState extends State<PopulationDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final List<Padding> containeers = List.generate(3, (index) {
      return Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: Row(
          children: [
            Container(
              height: 14,
              width: 14,
              color: _colorsMaleFemale[index],
              margin: const EdgeInsets.all(5),
            ),
            Text(_representations[index]),
          ],
        ),
      );
    });
    final List<Padding> containeersMfHh = List.generate(2, (index) {
      return Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: Row(
          children: [
            Container(
              height: 14,
              width: 14,
              color: _colorsMaleFemaleHh[index],
              margin: const EdgeInsets.all(5),
            ),
            Text(_representationsMfHh[index]),
          ],
        ),
      );
    });
    return BlocProvider(
      create: (context) => PopulationBloc(
          RepositoryProvider.of<GetPopulationRepository>(context))
        ..add(LoadPopulationEvent()),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      "लिङ्ग अनुसार जनसंख्य बिवरण",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const PopulationBarGraph(),
                  Padding(
                    padding: const EdgeInsets.only(left: 38.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: containeers,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "लिङ्ग अनुसार घरमुली बिवरण",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const HouseHeadBarGraph(),
                  Padding(
                    padding: const EdgeInsets.only(left: 38.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: containeersMfHh,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            PopulationDatatable(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
