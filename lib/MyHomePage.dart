import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/core/services/shared_preferences_service.dart';
import 'package:digital_profile/src/features/age_table2_2/presentation/page/age_population_page.dart';
import 'package:digital_profile/src/features/animal_husbandry/presentation/pages/animals_page.dart';
import 'package:digital_profile/src/features/disability/presentation/pages/disability_page.dart';
import 'package:digital_profile/src/features/electricity/presentation/pages/electricity_page.dart';
import 'package:digital_profile/src/features/ethenicity_household/presentation/pages/ethnicity_details_page.dart';
import 'package:digital_profile/src/features/ethnicity_population/presentation/page/ethnicity_population_page.dart';
import 'package:digital_profile/src/features/health_condition/presentation/pages/health_condition_page.dart';
import 'package:digital_profile/src/features/home_facilities/presentation/pages/home_facilities_page.dart';
import 'package:digital_profile/src/features/house_condition/presentation/pages/house_page.dart';
import 'package:digital_profile/src/features/insurance/presentation/pages/insurance_page.dart';
import 'package:digital_profile/src/features/language/presentation/pages/language_details_page.dart';
import 'package:digital_profile/src/features/literacy_status/presentation/pages/literacy_page.dart';
import 'package:digital_profile/src/features/login/data/repository/login_repository_impl.dart';
import 'package:digital_profile/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:digital_profile/src/features/login/presentation/page/login_signup_page.dart';
import 'package:digital_profile/src/features/marriage/presentation/pages/marriage_status_page.dart';
import 'package:digital_profile/src/features/pages/all_household_data.dart';
import 'package:digital_profile/src/features/pages/report_page.dart';
import 'package:digital_profile/src/features/population/data/repository/population_repository_impl.dart';
import 'package:digital_profile/src/features/population/presentation/bloc/population_bloc.dart';
import 'package:digital_profile/src/features/population/presentation/pages/population_details_page.dart';
import 'package:digital_profile/src/features/religion/presentation/page/religion_page.dart';
import 'package:digital_profile/src/features/residence/presentation/pages/residence_page.dart';
import 'package:digital_profile/src/features/toilet/presentation/pages/toilet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/endpoints.dart';

class MyHomePage extends StatefulWidget {
  final ImplLoginRepository _loginRepository = ImplLoginRepository();
  MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedItem = 'Table 1 - 1.1 पारिवारिक तथा जनसंख्या विवरण';
  List<String> dropDownOptions = [
    'Table 1 - 1.1 पारिवारिक तथा जनसंख्या विवरण',
    'Table 2 - 1.2 उमेर वर्गीकरण अनुसार जनसंख्या',
    'Table 3 - 1.3 जातजाती अनुसार घरपरिवार संख्या',
    'Table 4 - 1.4 जातजाती अनुसार जनसंख्या',
    'Table 5 - 1.5 मातृभाषाको आधारमा जनसंख्या',
    'Table 6 - 1.6 धर्मको आधारमा जनसंख्या',
    'Table 7 - 1.7 साक्षरताको स्थिति',
    'Table 8 - 1.8 बसोबासको अवस्था',
    'Table 9 - 1.9 अपाङ्गताको स्थिति',
    'Table 10 - 1.10 वैवाहिक स्थिति',
    'Table 11 - 1.11 परिवारका सदस्यहरुको स्वास्थ्य अवस्था',
    'Table 13 - 2.2 बिमा गरेका घरपरिवार विवरण',
    'Table 16 - 3.6 वत्तीको प्रमुख स्रोत',
    'Table 17 - 3.7 शौचालयको प्रकार अनुसार घरपरिवार संख्या',
    'Table 18 - 3.8 घरपरिवारमा उपलब्ध सुविधाहरु',
    'Table 23 - 4.4 चौपाया तथा पशुपन्छी पाल्ने घरपरिवार विवरण',
    'Table 31 - 5.4 बसोबास गरेको घरको छाना सम्बन्धी विवरण'
  ];
  bool isUserLoggedIn = false;

  void checkUser() async {
    final prefs = await PrefsService.getInstance();
    final aToken = prefs.getString(PrefsServiceKeys.accessTokem);

    setState(() {
      if (aToken != null) {
        isUserLoggedIn = aToken.isEmpty ? false : true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void logout() async {
    final prefs = await PrefsService.getInstance();
    await prefs.remove(PrefsServiceKeys.accessTokem);
    Endpoints.api_token = '';
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PopulationBloc(
            RepositoryProvider.of<GetPopulationRepository>(context),
          )..add(LoadPopulationEvent()),
        ),
        BlocProvider(
            create: (context) =>
                LoginBloc(loginRepository: RepositoryProvider.of(context))),
      ],
      child: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          elevation: 50,
          title: Text(l10n.digitalprofile),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: isUserLoggedIn
                  ? null
                  : IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                      create: (context) => LoginBloc(
                                          loginRepository: RepositoryProvider
                                              .of<ImplLoginRepository>(
                                                  context)),
                                      child: const LoginPage(),
                                    )));
                      },
                      icon: const Icon(Icons.person_3_rounded)),
            ),
          ],
          backgroundColor: Colors.blueAccent,
        ),
        drawer: !isUserLoggedIn
            ? null
            : Drawer(
                backgroundColor: Colors.blueAccent,
                width: MediaQuery.of(context).size.width / 1.4,
                child: SafeArea(
                  child: ListView(
                    children: [
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
                                  builder: (context) =>
                                      const AllHouseholdData()));
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
                        leading: const Icon(Icons.login),
                        title: const Text('Log Out'),
                        onTap: () async {
                          Navigator.pop(context);
                          logout();
                          checkUser();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                              (route) => false);
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
              // Text(isUserLoggedIn.toString()),
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
              getPage(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget getPage(BuildContext context) {
    if (selectedItem == "Table 1 - 1.1 पारिवारिक तथा जनसंख्या विवरण") {
      return const PopulationDetailsPage();
    }
    if (selectedItem == "Table 2 - 1.2 उमेर वर्गीकरण अनुसार जनसंख्या") {
      return const AgePopulationPage();
    } else if (selectedItem == "Table 3 - 1.3 जातजाती अनुसार घरपरिवार संख्या") {
      return const EthnicityPage();
    } else if (selectedItem == "Table 4 - 1.4 जातजाती अनुसार जनसंख्या") {
      return const EthnicityPopulationPage();
    } else if (selectedItem == "Table 5 - 1.5 मातृभाषाको आधारमा जनसंख्या") {
      return const LanguageDetails();
    } else if (selectedItem == "Table 6 - 1.6 धर्मको आधारमा जनसंख्या") {
      return const ReligionPage();
    } else if (selectedItem == "Table 7 - 1.7 साक्षरताको स्थिति") {
      return const LiteracyPage();
    } else if (selectedItem == "Table 8 - 1.8 बसोबासको अवस्था") {
      return const ResidencePage();
    } else if (selectedItem == "Table 9 - 1.9 अपाङ्गताको स्थिति") {
      return DisabilityPage();
    } else if (selectedItem == "Table 10 - 1.10 वैवाहिक स्थिति") {
      return const MarriageStatusPage();
    } else if (selectedItem ==
        "Table 11 - 1.11 परिवारका सदस्यहरुको स्वास्थ्य अवस्था") {
      return const HealthConditionPage();
    } else if (selectedItem == "Table 13 - 2.2 बिमा गरेका घरपरिवार विवरण") {
      return const InsurancePage();
    } else if (selectedItem == "Table 16 - 3.6 वत्तीको प्रमुख स्रोत") {
      return ElectricityPage();
    } else if (selectedItem ==
        "Table 17 - 3.7 शौचालयको प्रकार अनुसार घरपरिवार संख्या") {
      return ToiletPage();
    } else if (selectedItem == "Table 18 - 3.8 घरपरिवारमा उपलब्ध सुविधाहरु") {
      return HomeFacilitiesPage();
    } else if (selectedItem ==
        'Table 23 - 4.4 चौपाया तथा पशुपन्छी पाल्ने घरपरिवार विवरण') {
      return AnimalsPage();
    } else if (selectedItem ==
        'Table 31 - 5.4 बसोबास गरेको घरको छाना सम्बन्धी विवरण') {
      return HousePage();
    } else {
      return Container(
        child: Text('Select an option'),
      );
    }
  }
}
