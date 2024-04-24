import 'package:digital_profile/src/features/language/data/repository/language_repository_impl.dart';
import 'package:digital_profile/src/features/language/presentation/bloc/language_bloc.dart';
import 'package:digital_profile/src/features/language/presentation/pages/language_details.dart';
import 'package:digital_profile/src/features/pages/all_household_data.dart';
import 'package:digital_profile/src/features/pages/household_data.dart';
import 'package:digital_profile/src/features/pages/report_page.dart';
import 'package:digital_profile/src/features/population/data/repository/population_repository_impl.dart';
import 'package:digital_profile/src/features/population/presentation/bloc/population_bloc.dart';
import 'package:digital_profile/src/features/population/presentation/pages/household_details.dart';
import 'package:digital_profile/src/features/population/presentation/pages/population_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedItem = 'Table 1 - 1.1 पारिवारिक तथा जनसंख्या विवरण';
  List<String> dropDownOptions = [
    'Table 1 - 1.1 पारिवारिक तथा जनसंख्या विवरण',
    'Table 2 - 1.2 उमेर अनुसार जनसंख्या',
    'Table 3 - 1.3 जातजाती अनुसार घरपरिवार संख्या',
    'Table 4 - 1.4 जातजाती अनुसार जनसंख्या',
    'Table 5 - 1.5 मातृभाषाको आधारमा जनसंख्या',
    'Table 6 - 1.6 धर्मको आधारमा जनसंख्या',
    'Table 7 - 1.7 साक्षरताको स्थिति',
    'Table 9 - 1.9 अपाङ्गताको स्थिति',
    'Table 10 - 1.10 वैवाहिक स्थिति'
  ];
  // final FlutterLocalization localization = FlutterLocalization.instance;
  //List<double> barGraphData = [42, 50, 30, 90, 60, 55, 80];
  //final Future<List<PopulationCount>> popData = loadPopulationData();
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
    /*  BarData barData = BarData(
      rai: barGraphData[0],
      pahadiAdibasi: barGraphData[1],
      brahman: barGraphData[2],
      newar: barGraphData[3],
      tamang: barGraphData[4],
      bahun: barGraphData[5],
      others: barGraphData[6],
    );
    barData.initializeBarData();
    double radius = 100;*/
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PopulationBloc(
            RepositoryProvider.of<GetPopulationRepository>(context),
          )..add(LoadPopulationEvent()),
        ),
        BlocProvider(
          create: (context) => LanguageBloc(
              RepositoryProvider.of<GetLanguageRepository>(context))
            ..add(LoadLanguageEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('डिजिटल प्रोफाइल'),
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
                            builder: (context) => const AllHouseholdData()));
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 33,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DropdownButton<String>(
                        underline: Container(),
                        value: selectedItem,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedItem = newValue!;
                          });
                          // if (newValue == "Table 1 - 1.1 पारिवारिक तथा जनसंख्या विवरण") {
                          //   Navigator.push(context,
                          //       MaterialPageRoute(builder: (context) => DropDown()));
                          // }
                          if (newValue ==
                              "Table 2 - 1.2 उमेर अनुसार जनसंख्या") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DropDown()));
                          }
                        },
                        items: dropDownOptions
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                            onTap: () {},
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    const PopulationDetails(),
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
              Card(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "लिङ्ग अनुसार घरमुली बिवरण",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const HouseHoldDetails(),
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
              SizedBox(
                child: BlocBuilder<LanguageBloc, LanguageState>(
                    builder: (context, state) {
                  if (state is LanguageLoadedState) {
                    return Text("Data fetched");
                  }
                  return Text('failure');
                }),
              )
              /*  Card(
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
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
