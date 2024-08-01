import 'dart:io';

import 'package:digital_profile/MyHomePage.dart';
import 'package:digital_profile/app_localization/generated/l10n.dart';
import 'package:digital_profile/src/initial_page/presentation/pages/initial_page.dart';
import 'package:digital_profile/src/features/age_table2_2/data/repository/population_acc_age_repository_impl.dart';
import 'package:digital_profile/src/features/animal_husbandry/data/repository/animals_repository_impl.dart';
import 'package:digital_profile/src/features/disability/data/repository/disability_repository_impl.dart';
import 'package:digital_profile/src/features/electricity/data/repository/electricity_repository_impl.dart';
import 'package:digital_profile/src/features/ethnicity_population/data/repository/ethnicity_population_repository_impl.dart';
import 'package:digital_profile/src/features/health_condition/data/repository/health_condition_repository_impl.dart';
import 'package:digital_profile/src/features/home_facilities/data/repository/home_facilities_repository_impl.dart';
import 'package:digital_profile/src/features/house_roof_condition/data/repository/house_roof_condition_repository_impl.dart';
import 'package:digital_profile/src/features/household/data/repository/household_repository_impl.dart';
import 'package:digital_profile/src/features/insurance/data/repository/insurance_repository_impl.dart';
import 'package:digital_profile/src/features/language/data/repository/language_repository_impl.dart';
import 'package:digital_profile/src/features/literacy_status/data/repository/literacy_repository_impl.dart';
import 'package:digital_profile/src/features/login/data/repository/login_repository_impl.dart';
import 'package:digital_profile/src/features/marriage/data/repository/marriage_status_repository_impl.dart';
import 'package:digital_profile/src/features/population/data/repository/population_repository_impl.dart';
import 'package:digital_profile/src/features/religion/data/repository/religion_repository_impl.dart';
import 'package:digital_profile/src/features/residence/data/repository/residence_repository_impl.dart';
import 'package:digital_profile/src/features/table_%20no_30/data/repository/house_ownership_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_100/data/repository/child_worker_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_105/data/repository/bank_account_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_109/data/repository/loan_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_112/data/repository/earthquake_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_113/data/repository/earthquake_grant_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_114/data/repository/grant_stage_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_115/data/repository/grant_houses_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_33/data/repository/earthquake_resistance_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_34/data/repository/occupation_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_37/data/repository/bank_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_45/data/repository/meat_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_64/data/repository/expenses_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_65/data/repository/income_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_74/data/repository/settlement_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_95/data/repository/allowance_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_97/data/repository/road_distance_repository_impl.dart';
import 'package:digital_profile/src/features/toilet/data/repository/toilet_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/services/shared_preferences_service.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  await Future.delayed(const Duration(milliseconds: 300));
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String baseUrl = 'https://rubivalleymun.digitalprofile.com.np';
  String endPoint = 'api/household/reports?table_no=table';
  String houseHoldUrl = 'http://rubytest.git.com.np/api/household/reports/all';
  String villageName = 'रुबी भ्याली';
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
    updateVillageData();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ImplHouseholdRepository()),
        RepositoryProvider(create: (context) => ImplAgeRepository()),
        RepositoryProvider(
          create: (context) => GetPopulationRepository(),
        ),
        RepositoryProvider(
          create: (context) => GetLanguageRepository(),
        ),
        // RepositoryProvider(
        //   create: (context) => GetEthnicityRepository(),
        // ),
        RepositoryProvider(create: (context) => ImplLoginRepository()),
        RepositoryProvider(
            create: (context) => ImplEthnicityPopulationRepository()),
        RepositoryProvider(create: (context) => ImplReligionRepository()),
        RepositoryProvider(create: (context) => ImplDisabilityRepository()),
        RepositoryProvider(create: (context) => ImplLiteracyRepository()),
        RepositoryProvider(create: (context) => ImplResidenceRepository()),
        RepositoryProvider(create: (context) => ImplMarriageRepository()),
        RepositoryProvider(
            create: (context) => ImplHealthConditionRepository()),
        RepositoryProvider(create: (context) => ImplInsuranceRepository()),
        RepositoryProvider(create: (context) => ImplElectricityRepository()),
        RepositoryProvider(create: (context) => ImplToiletRepository()),
        RepositoryProvider(create: (context) => ImplHomeFacilitiesRepository()),
        RepositoryProvider(create: (context) => ImplAnimalRepository()),
        RepositoryProvider(create: (context) => ImplHouseOwnershipRepository()),
        RepositoryProvider(create: (context) => ImplHouseRoofRepository()),
        RepositoryProvider(
            create: (context) => ImplEarthquakeResistanceRepository()),
        RepositoryProvider(create: (context) => ImplOccupationRepository()),
        RepositoryProvider(create: (context) => ImplBankRepository()),
        RepositoryProvider(create: (context) => ImplMeatRepository()),
        RepositoryProvider(create: (context) => ImplExpensesRepository()),
        RepositoryProvider(create: (context) => ImplIncomeRepository()),
        RepositoryProvider(create: (context) => ImplSettlementRepository()),
        RepositoryProvider(create: (context) => ImplAllowanceRepository()),
        RepositoryProvider(create: (context) => ImplRoadDistanceRepository()),
        RepositoryProvider(create: (context) => ImplChildWorkerRepository()),
        RepositoryProvider(create: (context) => ImplBankAccountRepository()),
        RepositoryProvider(create: (context) => ImplLoanRepository()),
        RepositoryProvider(create: (context) => ImplEarthquakeRepository()),
        RepositoryProvider(
            create: (context) => ImplEarthquakeGrantRepository()),
        RepositoryProvider(create: (context) => ImplGrantStageRepository()),
        RepositoryProvider(create: (context) => ImplGrantHouseRepository()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'Digital Palika ',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: !isUserLoggedIn
            ? const InitialPage()
            : MyHomePage(baseUrl, endPoint, villageName, houseHoldUrl),
      ),
    );
  }

  Future<void> updateVillageData() async {
    final prefs = await PrefsService.getInstance();
    baseUrl = prefs.getString(PrefsServiceKeys.baseUrl)!;
    endPoint = prefs.getString(PrefsServiceKeys.endPoint)!;
    houseHoldUrl = prefs.getString(PrefsServiceKeys.houseHoldUrl)!;
    villageName = prefs.getString(PrefsServiceKeys.villageName)!;
  }
}
