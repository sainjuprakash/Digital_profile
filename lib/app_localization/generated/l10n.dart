// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `डिजिटल प्रोफाइल`
  String get digitalprofile {
    return Intl.message(
      'डिजिटल प्रोफाइल',
      name: 'digitalprofile',
      desc: '',
      args: [],
    );
  }

  /// `संस्थागत डाटा`
  String get instutionaldata {
    return Intl.message(
      'संस्थागत डाटा',
      name: 'instutionaldata',
      desc: '',
      args: [],
    );
  }

  /// `रिपोर्ट`
  String get report {
    return Intl.message(
      'रिपोर्ट',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `घरपरिवार डाटा`
  String get householddata {
    return Intl.message(
      'घरपरिवार डाटा',
      name: 'householddata',
      desc: '',
      args: [],
    );
  }

  /// `पुरुष`
  String get male {
    return Intl.message(
      'पुरुष',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `महिला`
  String get female {
    return Intl.message(
      'महिला',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `वडा नम्बर`
  String get wardnumber {
    return Intl.message(
      'वडा नम्बर',
      name: 'wardnumber',
      desc: '',
      args: [],
    );
  }

  /// `नेपाली`
  String get nepali {
    return Intl.message(
      'नेपाली',
      name: 'nepali',
      desc: '',
      args: [],
    );
  }

  /// `राई`
  String get rai {
    return Intl.message(
      'राई',
      name: 'rai',
      desc: '',
      args: [],
    );
  }

  /// `तामाङ`
  String get tamang {
    return Intl.message(
      'तामाङ',
      name: 'tamang',
      desc: '',
      args: [],
    );
  }

  /// `शेर्पा`
  String get sherpa {
    return Intl.message(
      'शेर्पा',
      name: 'sherpa',
      desc: '',
      args: [],
    );
  }

  /// `लिम्बु`
  String get limbu {
    return Intl.message(
      'लिम्बु',
      name: 'limbu',
      desc: '',
      args: [],
    );
  }

  /// `घले`
  String get ghale {
    return Intl.message(
      'घले',
      name: 'ghale',
      desc: '',
      args: [],
    );
  }

  /// `गुरुङ`
  String get gurung {
    return Intl.message(
      'गुरुङ',
      name: 'gurung',
      desc: '',
      args: [],
    );
  }

  /// `अन्य भाषा`
  String get othrslanguage {
    return Intl.message(
      'अन्य भाषा',
      name: 'othrslanguage',
      desc: '',
      args: [],
    );
  }

  /// `उपलब्ध नभएको`
  String get notavailable {
    return Intl.message(
      'उपलब्ध नभएको',
      name: 'notavailable',
      desc: '',
      args: [],
    );
  }

  /// `कुल वडा जनसंख्या`
  String get totalwardpop {
    return Intl.message(
      'कुल वडा जनसंख्या',
      name: 'totalwardpop',
      desc: '',
      args: [],
    );
  }

  /// `जम्मा`
  String get total {
    return Intl.message(
      'जम्मा',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `पुरुष गणना`
  String get malecount {
    return Intl.message(
      'पुरुष गणना',
      name: 'malecount',
      desc: '',
      args: [],
    );
  }

  /// `महिला गणना`
  String get femalecount {
    return Intl.message(
      'महिला गणना',
      name: 'femalecount',
      desc: '',
      args: [],
    );
  }

  /// `अन्य गणना`
  String get otherscount {
    return Intl.message(
      'अन्य गणना',
      name: 'otherscount',
      desc: '',
      args: [],
    );
  }

  /// `कुल वडा जनसंख्या`
  String get totalwardpopulation {
    return Intl.message(
      'कुल वडा जनसंख्या',
      name: 'totalwardpopulation',
      desc: '',
      args: [],
    );
  }

  /// `पुरुष घरमुली`
  String get malehhcount {
    return Intl.message(
      'पुरुष घरमुली',
      name: 'malehhcount',
      desc: '',
      args: [],
    );
  }

  /// `महिला घरमुली`
  String get femalehhcount {
    return Intl.message(
      'महिला घरमुली',
      name: 'femalehhcount',
      desc: '',
      args: [],
    );
  }

  /// `कुल घरमुली गणना`
  String get totalhhcount {
    return Intl.message(
      'कुल घरमुली गणना',
      name: 'totalhhcount',
      desc: '',
      args: [],
    );
  }

  /// `अन्य`
  String get others {
    return Intl.message(
      'अन्य',
      name: 'others',
      desc: '',
      args: [],
    );
  }

  /// `मुस्लिम`
  String get muslim {
    return Intl.message(
      'मुस्लिम',
      name: 'muslim',
      desc: '',
      args: [],
    );
  }

  /// `पहाडी ब्राह्मण`
  String get hillbrahmen {
    return Intl.message(
      'पहाडी ब्राह्मण',
      name: 'hillbrahmen',
      desc: '',
      args: [],
    );
  }

  /// `तराई ब्राह्मण`
  String get teraiBrahman {
    return Intl.message(
      'तराई ब्राह्मण',
      name: 'teraiBrahman',
      desc: '',
      args: [],
    );
  }

  /// `पहाडी जनजाति`
  String get hillJanajati {
    return Intl.message(
      'पहाडी जनजाति',
      name: 'hillJanajati',
      desc: '',
      args: [],
    );
  }

  /// `तराई जनजाति`
  String get teraiJanajati {
    return Intl.message(
      'तराई जनजाति',
      name: 'teraiJanajati',
      desc: '',
      args: [],
    );
  }

  /// `पहाडी दलित`
  String get hillDalit {
    return Intl.message(
      'पहाडी दलित',
      name: 'hillDalit',
      desc: '',
      args: [],
    );
  }

  /// `लग-इन`
  String get login {
    return Intl.message(
      'लग-इन',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `इमेल`
  String get email {
    return Intl.message(
      'इमेल',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `पासवर्ड`
  String get password {
    return Intl.message(
      'पासवर्ड',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `कृपया इमेल प्रविष्ट गर्नुहोस्`
  String get enteremail {
    return Intl.message(
      'कृपया इमेल प्रविष्ट गर्नुहोस्',
      name: 'enteremail',
      desc: '',
      args: [],
    );
  }

  /// `कृपया मान्य इमेल प्रविष्ट गर्नुहोस्`
  String get entervalidemail {
    return Intl.message(
      'कृपया मान्य इमेल प्रविष्ट गर्नुहोस्',
      name: 'entervalidemail',
      desc: '',
      args: [],
    );
  }

  /// `कृपया मान्य पासवर्ड प्रविष्ट गर्नुहोस्`
  String get entervalidpassword {
    return Intl.message(
      'कृपया मान्य पासवर्ड प्रविष्ट गर्नुहोस्',
      name: 'entervalidpassword',
      desc: '',
      args: [],
    );
  }

  /// `कृपया पासवर्ड प्रविष्ट गर्नुहोस्`
  String get enterpassword {
    return Intl.message(
      'कृपया पासवर्ड प्रविष्ट गर्नुहोस्',
      name: 'enterpassword',
      desc: '',
      args: [],
    );
  }

  /// `रुबी भ्याली`
  String get rubyvalley {
    return Intl.message(
      'रुबी भ्याली',
      name: 'rubyvalley',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
