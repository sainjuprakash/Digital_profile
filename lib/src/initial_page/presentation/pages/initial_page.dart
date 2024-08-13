import 'dart:ui';

import 'package:digital_profile/MyHomePage.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/pages/report_page.dart';
import 'package:digital_profile/src/initial_page/presentation/pages/help_centre_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../../../core/services/shared_preferences_service.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  List<String> baseUrls = [
    'https://rubivalleymun.digitalprofile.com.np',
    'https://airawatimun.digitalprofile.com.np',
    'https://conjusum.git.com.np'
  ];
  List<String> endPoints = [
    'api/household/reports?table_no=table',
    'api/v1/household/reports?table_no=table'
  ];
  final List<String> _options = [
    'रुबी भ्याली',
    'ऐरावती',
    'कोन्ज्योसोम',
  ];
  List<String> householdUrls = [
    'http://rubytest.git.com.np/api/household/reports/all',
    'http://rubytest.git.com.np/api/househots/',
    'http://rubytest.git.com.np/api/all'
  ];

  String? _selectedOption;
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    // final database = VillageDatabase();
    // final dao = VillageDao(database);
    // clearVillageData();
    // for (var data in _options) {
    //   dao.insertVillage(data);
    //   // print(data);
    // }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_selectedOption != null && _selectedOption == 'रुबी भ्याली') {
        getEndPoints(context);
      }
      if (_selectedOption != null && _selectedOption == 'ऐरावती') {
        getEndPoints(context);
      }
      if (_selectedOption != null && _selectedOption == 'कोन्ज्योसोम') {
        getEndPoints(context);
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(0, 2.5),
            child: Transform.rotate(
              angle: 60 * 3.1415927 / 180, // Convert 45 degrees to radians
              child: Container(
                height: 600,
                width: 500,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, -6.9),
            child: Transform.rotate(
              angle: 60 * 3.1415927 / 180, // Convert 45 degrees to radians
              child: Container(
                height: 700,
                width: 500,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(),
          ),
          Align(
            alignment: const Alignment(0, -0.3),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/nepal_sarkar.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Align(
            child: Container(
              height: 52,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DropdownButton<String>(
                    underline: Container(),
                    elevation: 50,
                    hint: const Text('गाउँपालिका छनोट गर्नुहोस'),
                    value: _selectedOption,
                    onChanged: (String? newValue) async {
                      final prefs = await PrefsService.getInstance();
                      await prefs.setString(
                          PrefsServiceKeys.villageName, newValue!);
                      setState(() {
                        _selectedOption = newValue;
                      });
                    },
                    items:
                        _options.map<DropdownMenuItem<String>>((String value) {
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
          Align(
            alignment: const Alignment(0, 0.88),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportPage()));
              },
              child: const Text(
                'About Us',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.95),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Terms & Policies',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                horizontalspace(
                  width: 4,
                ),
                const Text('|'),
                horizontalspace(
                  width: 4,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HelpCentrePage()));
                  },
                  child: const Text(
                    'Help Centre',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getEndPoints(BuildContext context) async {
    final prefs = await PrefsService.getInstance();
    if (_selectedOption == 'रुबी भ्याली') {
      await prefs.setString(PrefsServiceKeys.baseUrl, baseUrls[0]);
      await prefs.setString(PrefsServiceKeys.endPoint, endPoints[0]);
      await prefs.setString(PrefsServiceKeys.villageName, _options[0]);
      await prefs.setString(PrefsServiceKeys.houseHoldUrl, householdUrls[0]);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                  baseUrls[0], endPoints[0], _options[0], householdUrls[0])));
    }
    if (_selectedOption == 'ऐरावती') {
      await prefs.setString(PrefsServiceKeys.baseUrl, baseUrls[1]);
      await prefs.setString(PrefsServiceKeys.endPoint, endPoints[1]);
      await prefs.setString(PrefsServiceKeys.houseHoldUrl, householdUrls[1]);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                  baseUrls[1], endPoints[1], _options[1], householdUrls[1])));
    }
    if (_selectedOption == 'कोन्ज्योसोम') {
      await prefs.setString(
          PrefsServiceKeys.baseUrl, 'https://aialprofile.com.np');
      await prefs.setString(
          PrefsServiceKeys.endPoint, 'api/v1/hos?table_no=table');
      await prefs.setString(PrefsServiceKeys.houseHoldUrl, '');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                  baseUrls[2], endPoints[0], _options[2], householdUrls[2])));
    }
  }
}
