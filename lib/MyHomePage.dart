import 'package:digital_profile/src/features/bar_graph/bar_data.dart';
import 'package:digital_profile/src/features/pages/all_household_data.dart';
import 'package:digital_profile/src/features/pages/household_data.dart';
import 'package:digital_profile/src/features/pages/report_page.dart';
import 'package:digital_profile/src/features/pop_page/data/repository/population_repository_impl.dart';
import 'package:digital_profile/src/features/pop_page/presentation/bloc/population_bloc.dart';
import 'package:digital_profile/src/features/resources/male_female_count.dart';
import 'package:digital_profile/src/features/resources/repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final FlutterLocalization localization = FlutterLocalization.instance;

  List<double> barGraphData = [42, 50, 30, 90, 60, 55, 80];
  final Future<List<PopulationCount>> popData = loadPopulationData();
  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
      rai: barGraphData[0],
      pahadiAdibasi: barGraphData[1],
      brahman: barGraphData[2],
      newar: barGraphData[3],
      tamang: barGraphData[4],
      bahun: barGraphData[5],
      others: barGraphData[6],
    );
    barData.initializeBarData();
    double radius = 100;
    return BlocProvider(
      create: (context) => PopulationBloc(
        RepositoryProvider.of<GetPopulationRepository>(context),
      )..add(LoadPopulationEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Digital Profile'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.person_3_rounded)),
            ),
          ],
          // foregroundColor: Colors.blue,
          backgroundColor: Colors.blueAccent,
        ),
        drawer: Drawer(
          backgroundColor: Colors.blueAccent,
          width: MediaQuery.of(context).size.width / 1.4,
          child: SafeArea(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.other_houses),
                  title: const Text('घरदुरी ताथ्याङ्का'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DropDown()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.data_exploration_outlined),
                  title: const Text('Institutional Data'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.warehouse),
                  title: const Text('All Household Data'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllHouseholdData()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.report),
                  title: const Text('Report'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReportPage()));
                  },
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              BlocBuilder<PopulationBloc, PopulationState>(
                  builder: (context, state) {
                if (state is PopulationSuccessState) {
                  return const Text('data fetched');
                } else if (state is PopulationLoadingState) {
                  return const CircularProgressIndicator();
                }
                return const Text("hello");
              }),
              Card(
                elevation: 2,
                child: Column(
                  children: [
                    const Text(
                      'जातजाती अनुसार घरपरिवार संख्या',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 300,
                      width: double.maxFinite,
                      child: PieChart(
                          swapAnimationDuration:
                              const Duration(milliseconds: 300),
                          PieChartData(
                            centerSpaceRadius: 80,
                            sections: [
                              PieChartSectionData(
                                  color: Colors.blue,
                                  value: 120,
                                  badgeWidget: const Text('राई'),
                                  badgePositionPercentageOffset: 1.3),
                              PieChartSectionData(
                                  color: Colors.red,
                                  value: 60,
                                  badgeWidget: const Text('पहाडी दलित'),
                                  badgePositionPercentageOffset: 1.7),
                              PieChartSectionData(
                                  color: Colors.yellow,
                                  value: 40,
                                  badgeWidget: const Text('ब्राह्मण'),
                                  badgePositionPercentageOffset: 1.3),
                              PieChartSectionData(
                                  color: Colors.green,
                                  value: 20,
                                  badgeWidget: const Text('पहाडी आदिवासी'),
                                  badgePositionPercentageOffset: 1.3),
                              PieChartSectionData(
                                  color: Colors.pink,
                                  value: 50,
                                  badgeWidget: const Text('तराई आदिवासी'),
                                  badgePositionPercentageOffset: 1.3),
                              PieChartSectionData(
                                  color: Colors.amber,
                                  value: 10,
                                  badgeWidget: const Text('नखुलायको'),
                                  badgePositionPercentageOffset: 1.8),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 2,
                child: Column(
                  children: [
                    const Text(
                      'जातजाती अनुसार घरपरिवार संख्या',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 300,
                      width: double.maxFinite,
                      child: PieChart(
                          swapAnimationDuration:
                              const Duration(milliseconds: 600),
                          PieChartData(
                            centerSpaceRadius: 0,
                            sections: [
                              PieChartSectionData(
                                  color: Colors.blue,
                                  value: 150,
                                  radius: radius),
                              PieChartSectionData(
                                  color: Colors.red, value: 60, radius: radius),
                              PieChartSectionData(
                                  color: Colors.yellow,
                                  value: 40,
                                  radius: radius),
                              PieChartSectionData(
                                  color: Colors.green,
                                  value: 20,
                                  radius: radius)
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Text('राई')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Text('पहाडी दलित')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            color: Colors.yellow,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Text('ब्राह्मण')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            color: Colors.green,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Text('नखुलायको')
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 2,
                child: Column(
                  children: [
                    const Text(
                      'साक्षरताको स्थिति',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    FutureBuilder<List<PopulationCount>>(
                        future: loadPopulationData(),
                        builder: (context, snapshot) {
                          //print(snapshot);
                          List<PopulationCount>? loadedPopulationData =
                              snapshot.data;
                          //print(loadedPopulationData);
                          if (snapshot.hasData) {
                            // int? malehhcount =
                            //     loadedPopulationData[index].maleCount;
                            //  print(malehhcount);
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SizedBox(
                                height: 600,
                                width: 600,
                                child: BarChart(BarChartData(
                                  titlesData: const FlTitlesData(),
                                  minY: 0,
                                  maxY: 600,
                                  barGroups: loadedPopulationData
                                      ?.map((e) => BarChartGroupData(
                                              x: e.wardNum ?? 0,
                                              barRods: [
                                                BarChartRodData(
                                                  toY: e.maleCount ?? 0,
                                                  // toY: loadedPopulationData[index]
                                                  //     .maleCount,
                                                  width: 20,

                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  color: Colors.orangeAccent,
                                                  //fromY: 20,
                                                  //borderDashArray: [5, 10],
                                                ),
                                                BarChartRodData(
                                                  toY: e.femaleCount ?? 0,
                                                  // toY: loadedPopulationData[index]
                                                  //     .maleCount,
                                                  width: 20,
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  color: Colors.blueAccent,
                                                  //fromY: 20,
                                                  //borderDashArray: [5, 10],
                                                ),
                                                BarChartRodData(
                                                  toY: e.otherCount
                                                          ?.toDouble() ??
                                                      0,
                                                  // toY: loadedPopulationData[index]
                                                  //     .maleCount,
                                                  width: 20,
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  color: Colors.pinkAccent,
                                                  //fromY: 20,
                                                  //borderDashArray: [5, 10],
                                                ),
                                              ]))
                                      .toList(),
                                )),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return const Text('error has occured');
                          }
                          return const CircularProgressIndicator();
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
