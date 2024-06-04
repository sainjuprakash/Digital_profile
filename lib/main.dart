import 'dart:io';

import 'package:digital_profile/app_localization/generated/l10n.dart';
import 'package:digital_profile/initial_page.dart';
import 'package:digital_profile/src/features/age_table2_2/data/repository/population_acc_age_repository_impl.dart';
import 'package:digital_profile/src/features/animal_husbandry/data/repository/animals_repository_impl.dart';
import 'package:digital_profile/src/features/disability/data/repository/disability_repository_impl.dart';
import 'package:digital_profile/src/features/electricity/data/repository/electricity_repository_impl.dart';
import 'package:digital_profile/src/features/ethenicity_household/data/repository/ethnicity_repository_impl.dart';
import 'package:digital_profile/src/features/ethnicity_population/data/repository/ethnicity_population_repository_impl.dart';
import 'package:digital_profile/src/features/health_condition/data/repository/health_condition_repository_impl.dart';
import 'package:digital_profile/src/features/home_facilities/data/repository/home_facilities_repository_impl.dart';
import 'package:digital_profile/src/features/house_roof_condition/data/repository/house_roof_condition_repository_impl.dart';
import 'package:digital_profile/src/features/insurance/data/repository/insurance_repository_impl.dart';
import 'package:digital_profile/src/features/language/data/repository/language_repository_impl.dart';
import 'package:digital_profile/src/features/literacy_status/data/repository/literacy_repository_impl.dart';
import 'package:digital_profile/src/features/login/data/repository/login_repository_impl.dart';
import 'package:digital_profile/src/features/marriage/data/repository/marriage_status_repository_impl.dart';
import 'package:digital_profile/src/features/population/data/repository/population_repository_impl.dart';
import 'package:digital_profile/src/features/religion/data/repository/religion_repository_impl.dart';
import 'package:digital_profile/src/features/residence/data/repository/residence_repository_impl.dart';
import 'package:digital_profile/src/features/table_%20no_30/data/repository/house_ownership_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_33/data/repository/earthquake_resistance_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_34/data/repository/occupation_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_37/data/repository/bank_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_45/data/repository/meat_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_64/data/repository/expenses_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_65/data/repository/income_repository_impl.dart';
import 'package:digital_profile/src/features/toilet/data/repository/toilet_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'MyHomePage.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ImplAgeRepository()),
        RepositoryProvider(
          create: (context) => GetPopulationRepository(),
        ),
        RepositoryProvider(
          create: (context) => GetLanguageRepository(),
        ),
        RepositoryProvider(
          create: (context) => GetEthnicityRepository(),
        ),
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
        home: InitialPage(),
      ),
    );
  }
}
