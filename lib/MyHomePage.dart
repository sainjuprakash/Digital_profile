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
import 'package:digital_profile/src/features/house_roof_condition/presentation/pages/house_roof_page.dart';
import 'package:digital_profile/src/features/insurance/presentation/pages/insurance_page.dart';
import 'package:digital_profile/src/features/language/presentation/pages/language_details_page.dart';
import 'package:digital_profile/src/features/literacy_status/presentation/pages/literacy_page.dart';
import 'package:digital_profile/src/features/login/data/repository/login_repository_impl.dart';
import 'package:digital_profile/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:digital_profile/src/features/login/presentation/page/login_signup_page.dart';
import 'package:digital_profile/src/features/marriage/presentation/pages/marriage_status_page.dart';
import 'package:digital_profile/src/features/pages/all_household_data.dart';
import 'package:digital_profile/src/features/pages/report_page.dart';
import 'package:digital_profile/src/features/population/presentation/pages/population_details_page.dart';
import 'package:digital_profile/src/features/religion/presentation/page/religion_page.dart';
import 'package:digital_profile/src/features/residence/presentation/pages/residence_page.dart';
import 'package:digital_profile/src/features/table_%20no_30/presentation/pages/house_ownership_page.dart';
import 'package:digital_profile/src/features/table_no_100/presentation/pages/child_worker_page.dart';
import 'package:digital_profile/src/features/table_no_105/presentation/pages/bank_account_page.dart';
import 'package:digital_profile/src/features/table_no_109/presentation/pages/loan_page.dart';
import 'package:digital_profile/src/features/table_no_112/presentation/pages/earthquake_page.dart';
import 'package:digital_profile/src/features/table_no_113/presentation/pages/earthquake_grant_page.dart';
import 'package:digital_profile/src/features/table_no_114/presentation/pages/grant_stage_page.dart';
import 'package:digital_profile/src/features/table_no_115/presentation/pages/grant_house_page.dart';
import 'package:digital_profile/src/features/table_no_33/presentation/pages/earthquake_resistance_page.dart';
import 'package:digital_profile/src/features/table_no_34/presentation/pages/occupation_page.dart';
import 'package:digital_profile/src/features/table_no_37/presentation/pages/bank_page.dart';
import 'package:digital_profile/src/features/table_no_45/presentation/pages/meat_page.dart';
import 'package:digital_profile/src/features/table_no_64/presentation/pages/expenses_page.dart';
import 'package:digital_profile/src/features/table_no_65/presentation/pages/income_page.dart';
import 'package:digital_profile/src/features/table_no_74/presentation/pages/settlement_page.dart';
import 'package:digital_profile/src/features/table_no_95/presentation/pages/allowance_page.dart';
import 'package:digital_profile/src/features/table_no_97/presentation/pages/road_distance_page.dart';
import 'package:digital_profile/src/features/toilet/presentation/pages/toilet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/endpoints.dart';

class MyHomePage extends StatefulWidget {
  String baseUrl, endPoint;
  MyHomePage(this.baseUrl, this.endPoint, {super.key});
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
    'Table 30 - 5.3 बसोबास गरेको घरको स्वामित्व सम्बन्धी विवरण',
    'Table 31 - 5.4 बसोबास गरेको घरको छाना सम्बन्धी विवरण',
    'Table 33 - 5.5 भवन मापण्ड तथा भूकम्प प्रतिरोधी घरको विवरण',
    'Table 34 - 1.12 प्रमुख पेशा अनुसार जनसंख्या',
    'Table 37 - 2.4 बैंङ्क तथा वित्तिय संस्थामा खाता हुने घरपरिवार सम्बन्धी विवरण',
    'Table 45 - 10.2  मासु तथा अन्य प्रयाेजनकाे लागि पालिने चाैपायकाे बिवरण',
    'Table 64 - 4.2 परिवारको सरदर वार्षिक खर्च',
    'Table 65 - 4.1 परिवारको सरदर वार्षिक आम्दानी',
    'Table 74 - 5.0  बसोबासको प्रकृति अनुसार घरपरिवार विवरण',
    'Table 95 - 2.6 सामाजिक सुरक्षा भत्ताको विवरण',
    'Table 97 - 3.1 घरबाट हिडेर नजिकको बजार पुग्न लाग्ने समय (घरधुरी संख्या)',
    'Table 100 - 7.2 घरमा १६ बर्ष मुनिको (बालबालिका) काम गर्न राख्ने घरधुरी संख्या',
    'Table 105 - 2.5 परिवारको सदस्यकाे बैंक तथा वित्तीय संस्थामा खाताको बिवरण',
    'Table 109 - 2.5 ऋणको उद्देश्य अनुसार घरपरिवार विवरण',
    'Table 112 - 6.0  २०७२ को भुकम्पबाट घर क्षति भएको नभएको विवरण',
    'Table 113 - 6.1 भूकम्पबाट क्षति भएको हो भने अनुदान पाए नपाएको विवरण',
    'Table 114 - 6.2 अनुदान पाएको भए कति पाएको विवरण',
    'Table 115 - 6.3 अनुदानले घर बने नबनेको विवरण',
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
                                      child: LoginPage(
                                          widget.baseUrl, widget.endPoint),
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
                                  builder: (context) => MyHomePage(
                                      widget.baseUrl, widget.endPoint)),
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
              // Text(widget.baseUrl),
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
      return PopulationDetailsPage(widget.baseUrl);
    }
    if (selectedItem == "Table 2 - 1.2 उमेर वर्गीकरण अनुसार जनसंख्या") {
      return AgePopulationPage(widget.baseUrl);
    } else if (selectedItem == "Table 3 - 1.3 जातजाती अनुसार घरपरिवार संख्या") {
      return EthnicityPage(widget.baseUrl);
    } else if (selectedItem == "Table 4 - 1.4 जातजाती अनुसार जनसंख्या") {
      return EthnicityPopulationPage(widget.baseUrl);
    } else if (selectedItem == "Table 5 - 1.5 मातृभाषाको आधारमा जनसंख्या") {
      return LanguageDetails(widget.baseUrl);
    } else if (selectedItem == "Table 6 - 1.6 धर्मको आधारमा जनसंख्या") {
      return ReligionPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem == "Table 7 - 1.7 साक्षरताको स्थिति") {
      return LiteracyPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem == "Table 8 - 1.8 बसोबासको अवस्था") {
      return ResidencePage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem == "Table 9 - 1.9 अपाङ्गताको स्थिति") {
      return DisabilityPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem == "Table 10 - 1.10 वैवाहिक स्थिति") {
      return MarriageStatusPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        "Table 11 - 1.11 परिवारका सदस्यहरुको स्वास्थ्य अवस्था") {
      return HealthConditionPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem == "Table 13 - 2.2 बिमा गरेका घरपरिवार विवरण") {
      return InsurancePage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem == "Table 16 - 3.6 वत्तीको प्रमुख स्रोत") {
      return ElectricityPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        "Table 17 - 3.7 शौचालयको प्रकार अनुसार घरपरिवार संख्या") {
      return ToiletPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem == "Table 18 - 3.8 घरपरिवारमा उपलब्ध सुविधाहरु") {
      return HomeFacilitiesPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        'Table 23 - 4.4 चौपाया तथा पशुपन्छी पाल्ने घरपरिवार विवरण') {
      return AnimalsPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        'Table 30 - 5.3 बसोबास गरेको घरको स्वामित्व सम्बन्धी विवरण') {
      return HouseOwnershipPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        'Table 31 - 5.4 बसोबास गरेको घरको छाना सम्बन्धी विवरण') {
      return HousePage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        'Table 33 - 5.5 भवन मापण्ड तथा भूकम्प प्रतिरोधी घरको विवरण') {
      return EarthquakeResistancePage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem == 'Table 34 - 1.12 प्रमुख पेशा अनुसार जनसंख्या') {
      return OccupationPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        'Table 37 - 2.4 बैंङ्क तथा वित्तिय संस्थामा खाता हुने घरपरिवार सम्बन्धी विवरण') {
      return BankPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        'Table 45 - 10.2  मासु तथा अन्य प्रयाेजनकाे लागि पालिने चाैपायकाे बिवरण') {
      return MeatPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem == 'Table 64 - 4.2 परिवारको सरदर वार्षिक खर्च') {
      return ExpensesPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem == 'Table 65 - 4.1 परिवारको सरदर वार्षिक आम्दानी') {
      return IncomePage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        'Table 74 - 5.0  बसोबासको प्रकृति अनुसार घरपरिवार विवरण') {
      return SettlementPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem == 'Table 95 - 2.6 सामाजिक सुरक्षा भत्ताको विवरण') {
      return AllowancePage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        'Table 97 - 3.1 घरबाट हिडेर नजिकको बजार पुग्न लाग्ने समय (घरधुरी संख्या)') {
      return RoadDistancePage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        'Table 100 - 7.2 घरमा १६ बर्ष मुनिको (बालबालिका) काम गर्न राख्ने घरधुरी संख्या') {
      return ChildWorkerPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        'Table 105 - 2.5 परिवारको सदस्यकाे बैंक तथा वित्तीय संस्थामा खाताको बिवरण') {
      return BankAccountPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        'Table 109 - 2.5 ऋणको उद्देश्य अनुसार घरपरिवार विवरण') {
      return LoanPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        'Table 112 - 6.0  २०७२ को भुकम्पबाट घर क्षति भएको नभएको विवरण') {
      return EarthquakePage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        'Table 113 - 6.1 भूकम्पबाट क्षति भएको हो भने अनुदान पाए नपाएको विवरण') {
      return EarthquakeGrantPage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem ==
        'Table 114 - 6.2 अनुदान पाएको भए कति पाएको विवरण') {
      return GrantStagePage(widget.baseUrl, widget.endPoint);
    } else if (selectedItem == 'Table 115 - 6.3 अनुदानले घर बने नबनेको विवरण') {
      return GrantHousePage(widget.baseUrl, widget.endPoint);
    } else {
      return const Center(child: Text('Select an option'));
    }
  }
}
