import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/src/features/ethenicity_household/presentation/pages/ethnicity_details_page.dart';
import 'package:digital_profile/src/features/ethnicity_population/presentation/widget/ethnicity_population_bar_graph.dart';
import 'package:digital_profile/src/features/language/presentation/pages/language_details_page.dart';
import 'package:digital_profile/src/features/login/data/repository/login_repository_impl.dart';
import 'package:digital_profile/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:digital_profile/src/features/login/presentation/page/login_signup_page.dart';
import 'package:digital_profile/src/features/pages/all_household_data.dart';
import 'package:digital_profile/src/features/pages/household_data.dart';
import 'package:digital_profile/src/features/pages/report_page.dart';
import 'package:digital_profile/src/features/population/data/repository/population_repository_impl.dart';
import 'package:digital_profile/src/features/population/presentation/bloc/population_bloc.dart';
import 'package:digital_profile/src/features/population/presentation/pages/population_details_page.dart';
import 'package:flutter/material.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PopulationBloc(
            RepositoryProvider.of<GetPopulationRepository>(context),
          )..add(LoadPopulationEvent()),
        ),
        // BlocProvider(
        //   create: (context) => LanguageBloc(
        //       RepositoryProvider.of<GetLanguageRepository>(context))
        //     ..add(LoadLanguageEvent()),
        // ),
        // BlocProvider(
        //   create: (context) => EthnicityBloc(
        //     RepositoryProvider.of<GetEthenicityRepository>(context),
        //   )..add(LoadEthnicityEvent()),
        // ),
        // BlocProvider(
        //     create: (context) => LoginBloc(
        //         loginRepository:
        //             RepositoryProvider.of<ImplLoginRepository>(context)))
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 50,
          title: Text(l10n.rubyvalley),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) => LoginBloc(
                                      loginRepository: RepositoryProvider.of<
                                          ImplLoginRepository>(context)),
                                  child: const LoginPage(),
                                )));
                  },
                  icon: const Icon(Icons.person_3_rounded)),
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
                    Navigator.pop(context);
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
                ListTile(
                  leading: Icon(Icons.login),
                  title: Text('Log Out'),
                  onTap: () {},
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

                          if (newValue ==
                              "Table 3 - 1.3 जातजाती अनुसार घरपरिवार संख्या") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EthnicityPage()));
                          }
                          if (newValue ==
                              "Table 4 - 1.4 जातजाती अनुसार जनसंख्या") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EthnicityPopulationBarChart()));
                          }
                          if (newValue ==
                              "Table 5 - 1.5 मातृभाषाको आधारमा जनसंख्या") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LanguageDetails()));
                          }
                          // if (newValue ==
                          //     "Table 1 - 1.1 पारिवारिक तथा जनसंख्या विवरण") {
                          //   PopulationDetailsPage();
                          // }
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
              const PopulationDetailsPage()
            ],
          ),
        ),
      ),
    );
  }
}
