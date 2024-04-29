import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  // String defaultDropDown = 'one';
  // List<String> list=['one','two','three'];
  List<int> wardNumber = [1, 2, 3, 4, 5, 6, 7, 8, 9];
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
  String selectedItem = 'Table 1 - 1.1 पारिवारिक तथा जनसंख्या विवरण';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('घरदुरी ताथ्याङ्का'),
        // foregroundColor: Colors.blue,
        backgroundColor: Colors.blueAccent,
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            // child: DropdownButton<String>(
            //   underline: Container(
            //     height: 1.2,
            //     color: Colors.black,
            //   ),
            //   value: selectedItem,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       selectedItem = newValue!;
            //     });
            //   },
            //   items:
            //       dropDownOptions.map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //       onTap: () {},
            //     );
            //   }).toList(),
            // ),
          ),
        ],
      ),
    );
  }
}
