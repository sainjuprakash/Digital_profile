import 'package:digital_profile/bar_graph/bar_data.dart';
import 'package:digital_profile/pages/household_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<double> barGraphData = [42, 50, 30, 90, 60, 55, 80];
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
    return Scaffold(
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
                leading: const Icon(Icons.report),
                title: const Text('Report'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Column(
                children: [
                  const Text(
                    'जातजाती अनुसार घरपरिवार संख्या',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                                color: Colors.blue, value: 150, radius: radius),
                            PieChartSectionData(
                                color: Colors.red, value: 60, radius: radius),
                            PieChartSectionData(
                                color: Colors.yellow,
                                value: 40,
                                radius: radius),
                            PieChartSectionData(
                                color: Colors.green, value: 20, radius: radius)
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: 500,
                      width: 600,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: BarChart(BarChartData(
                          // barTouchData: BarTouchData(longPressDuration: Duration(milliseconds: 600)),
                            minY: 0,
                            maxY: 100,
                            barGroups: barData.barData
                                .map((e) => BarChartGroupData(
                                      x: e.x,
                                      barRods: [
                                        BarChartRodData(
                                            toY: e.y,
                                            width: 20,
                                            borderRadius:
                                            BorderRadius.circular(2),
                                            color: Colors.blueAccent,
                                            //fromY: 20,
                                            //borderDashArray: [5, 10],
                                        )
                                      ],
                                    ))
                                .toList())),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// List<Widget> representation() {
//   List<Color> colors = [Colors.red, Colors.yellow, Colors.green, Colors.blue];
//   List<String> casts = ['Rai', 'limbu', 'Newar', 'Tamang'];
//   return List.generate(4, (index) {
//     return Card(
//       child: Row(
//         children: [
//           Container(
//             height: 10,
//             width: 10,
//             color: colors[index],
//           ),
//           Text(casts[index])
//         ],
//       ),
//     );
//   });
// }
