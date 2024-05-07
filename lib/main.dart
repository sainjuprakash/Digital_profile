import 'package:digital_profile/app_localization/generated/l10n.dart';
import 'package:digital_profile/src/features/ethenicity_household/data/repository/ethnicity_repository_impl.dart';
import 'package:digital_profile/src/features/ethnicity_population/data/repository/ethnicity_population_repository_impl.dart';
import 'package:digital_profile/src/features/language/data/repository/language_repository_impl.dart';
import 'package:digital_profile/src/features/login/data/repository/login_repository_impl.dart';
import 'package:digital_profile/src/features/population/data/repository/population_repository_impl.dart';
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
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
