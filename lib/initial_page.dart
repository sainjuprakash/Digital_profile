import 'dart:ui';

import 'package:digital_profile/MyHomePage.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  List<String> baseUrls = [
    'https://rubytest.git.com.np',
    'https://chichila.git.com.np',
    'https://conjusum.git.com.np'
  ];
  List<String> endPoints = ['api/household/reports?table_no=table'];
  final List<String> _options = [
    'रुबी भ्याली',
    'चिचिला',
    'कोन्ज्योसोम',
  ];
  List<String> householdUrls = [
    'http://rubytest.git.com.np/api/household/reports/all',
    'http://rubytest.git.com.np/api/househots/',
    'http://rubytest.git.com.np/api/all'
  ];

  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_selectedOption != null && _selectedOption == 'रुबी भ्याली') {
        getEndPoints(context);
      }
      if (_selectedOption != null && _selectedOption == 'चिचिला') {
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
                    image: AssetImage('assets/gov_logo/nepal_sarkar.jpg'),
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
                child: DropdownButton<String>(
                  underline: Container(),
                  elevation: 50,
                  hint: const Text('गाउँपालिका छनोट गर्नुहोस'),
                  value: _selectedOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOption = newValue!;
                    });
                  },
                  items: _options.map<DropdownMenuItem<String>>((String value) {
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
        ],
      ),
    );
  }

  void getEndPoints(BuildContext context) {
    if (_selectedOption == 'रुबी भ्याली') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                  baseUrls[0], endPoints[0], _options[0], householdUrls[0])));
    }
    if (_selectedOption == 'चिचिला') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                  baseUrls[1], endPoints[0], _options[1], householdUrls[1])));
    }
    if (_selectedOption == 'कोन्ज्योसोम') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                  baseUrls[2], endPoints[0], _options[2], householdUrls[2])));
    }
  }
}
