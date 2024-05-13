import 'package:digital_profile/app_localization/generated/l10n.dart';
import 'package:digital_profile/src/features/age_table2_2/data/repository/population_acc_age_repository_impl.dart';
import 'package:digital_profile/src/features/disability/data/repository/disability_repository_impl.dart';
import 'package:digital_profile/src/features/ethenicity_household/data/repository/ethnicity_repository_impl.dart';
import 'package:digital_profile/src/features/ethnicity_population/data/repository/ethnicity_population_repository_impl.dart';
import 'package:digital_profile/src/features/language/data/repository/language_repository_impl.dart';
import 'package:digital_profile/src/features/literacy_status/data/repository/literacy_repository_impl.dart';
import 'package:digital_profile/src/features/login/data/repository/login_repository_impl.dart';
import 'package:digital_profile/src/features/population/data/repository/population_repository_impl.dart';
import 'package:digital_profile/src/features/religion/data/repository/religion_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'MyHomePage.dart';

void main() {
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
        RepositoryProvider(create: (context) => ImplLiteracyRepository())
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
        home: const MyHomePage(),
      ),
    );
  }
}
