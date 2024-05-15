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

  /// `कुल वडा जाति`
  String get totalwardethnicity {
    return Intl.message(
      'कुल वडा जाति',
      name: 'totalwardethnicity',
      desc: '',
      args: [],
    );
  }

  /// `धर्मको आधारमा जनसंख्या`
  String get religiontitle {
    return Intl.message(
      'धर्मको आधारमा जनसंख्या',
      name: 'religiontitle',
      desc: '',
      args: [],
    );
  }

  /// `हिन्दु`
  String get hindu {
    return Intl.message(
      'हिन्दु',
      name: 'hindu',
      desc: '',
      args: [],
    );
  }

  /// `बौद्ध`
  String get boudha {
    return Intl.message(
      'बौद्ध',
      name: 'boudha',
      desc: '',
      args: [],
    );
  }

  /// ` इसार्इ(क्रिश्चियन)`
  String get christian {
    return Intl.message(
      ' इसार्इ(क्रिश्चियन)',
      name: 'christian',
      desc: '',
      args: [],
    );
  }

  /// `किरात`
  String get kirat {
    return Intl.message(
      'किरात',
      name: 'kirat',
      desc: '',
      args: [],
    );
  }

  /// `जैन`
  String get jains {
    return Intl.message(
      'जैन',
      name: 'jains',
      desc: '',
      args: [],
    );
  }

  /// `बोन`
  String get bon {
    return Intl.message(
      'बोन',
      name: 'bon',
      desc: '',
      args: [],
    );
  }

  /// `कुल धर्म`
  String get totalreligion {
    return Intl.message(
      'कुल धर्म',
      name: 'totalreligion',
      desc: '',
      args: [],
    );
  }

  /// `उमेर वर्गीकरण अनुसार जनसंख्या`
  String get populationClassificationtitle {
    return Intl.message(
      'उमेर वर्गीकरण अनुसार जनसंख्या',
      name: 'populationClassificationtitle',
      desc: '',
      args: [],
    );
  }

  /// `६ भन्दा कम`
  String get lessthan6 {
    return Intl.message(
      '६ भन्दा कम',
      name: 'lessthan6',
      desc: '',
      args: [],
    );
  }

  /// `६-१५`
  String get sixttofifteen {
    return Intl.message(
      '६-१५',
      name: 'sixttofifteen',
      desc: '',
      args: [],
    );
  }

  /// `५०-६९`
  String get fiftytosixtynine {
    return Intl.message(
      '५०-६९',
      name: 'fiftytosixtynine',
      desc: '',
      args: [],
    );
  }

  /// `७०-९०`
  String get seventytoninety {
    return Intl.message(
      '७०-९०',
      name: 'seventytoninety',
      desc: '',
      args: [],
    );
  }

  /// `९० माथि`
  String get above90 {
    return Intl.message(
      '९० माथि',
      name: 'above90',
      desc: '',
      args: [],
    );
  }

  /// `१६-४९`
  String get sixteentofourtynine {
    return Intl.message(
      '१६-४९',
      name: 'sixteentofourtynine',
      desc: '',
      args: [],
    );
  }

  /// `पुरुष(६ भन्दा कम)`
  String get malelessthan6 {
    return Intl.message(
      'पुरुष(६ भन्दा कम)',
      name: 'malelessthan6',
      desc: '',
      args: [],
    );
  }

  /// `पुरुष(६-१५)`
  String get male6to15 {
    return Intl.message(
      'पुरुष(६-१५)',
      name: 'male6to15',
      desc: '',
      args: [],
    );
  }

  /// `पुरुष(१६-४९)`
  String get male16to49 {
    return Intl.message(
      'पुरुष(१६-४९)',
      name: 'male16to49',
      desc: '',
      args: [],
    );
  }

  /// `पुरुष(५०-६९)`
  String get male50to69 {
    return Intl.message(
      'पुरुष(५०-६९)',
      name: 'male50to69',
      desc: '',
      args: [],
    );
  }

  /// `पुरुष(७०-९०)`
  String get male70to90 {
    return Intl.message(
      'पुरुष(७०-९०)',
      name: 'male70to90',
      desc: '',
      args: [],
    );
  }

  /// `पुरुष(९० माथि)`
  String get maleabove90 {
    return Intl.message(
      'पुरुष(९० माथि)',
      name: 'maleabove90',
      desc: '',
      args: [],
    );
  }

  /// `महिला(६ भन्दा कम)`
  String get femalelessthan6 {
    return Intl.message(
      'महिला(६ भन्दा कम)',
      name: 'femalelessthan6',
      desc: '',
      args: [],
    );
  }

  /// `महिला(६-१५)`
  String get female6to15 {
    return Intl.message(
      'महिला(६-१५)',
      name: 'female6to15',
      desc: '',
      args: [],
    );
  }

  /// `महिला(१६-४९)`
  String get female16to49 {
    return Intl.message(
      'महिला(१६-४९)',
      name: 'female16to49',
      desc: '',
      args: [],
    );
  }

  /// `महिला(५०-६९)`
  String get female50to69 {
    return Intl.message(
      'महिला(५०-६९)',
      name: 'female50to69',
      desc: '',
      args: [],
    );
  }

  /// `महिला(७०-९०)`
  String get female70to90 {
    return Intl.message(
      'महिला(७०-९०)',
      name: 'female70to90',
      desc: '',
      args: [],
    );
  }

  /// `महिला(९० माथि)`
  String get femaleabove90 {
    return Intl.message(
      'महिला(९० माथि)',
      name: 'femaleabove90',
      desc: '',
      args: [],
    );
  }

  /// `अन्य(६ भन्दा कम)`
  String get otherslessthan6 {
    return Intl.message(
      'अन्य(६ भन्दा कम)',
      name: 'otherslessthan6',
      desc: '',
      args: [],
    );
  }

  /// `अन्य(६-१५)`
  String get others6to15 {
    return Intl.message(
      'अन्य(६-१५)',
      name: 'others6to15',
      desc: '',
      args: [],
    );
  }

  /// `अन्य(१६-४९)`
  String get others16to49 {
    return Intl.message(
      'अन्य(१६-४९)',
      name: 'others16to49',
      desc: '',
      args: [],
    );
  }

  /// `अन्य(५०-६९)`
  String get others50to69 {
    return Intl.message(
      'अन्य(५०-६९)',
      name: 'others50to69',
      desc: '',
      args: [],
    );
  }

  /// `अन्य(७०-९०)`
  String get others70to90 {
    return Intl.message(
      'अन्य(७०-९०)',
      name: 'others70to90',
      desc: '',
      args: [],
    );
  }

  /// `अन्य(९० माथि)`
  String get othersabove90 {
    return Intl.message(
      'अन्य(९० माथि)',
      name: 'othersabove90',
      desc: '',
      args: [],
    );
  }

  /// `अपाङ्गताको स्थिति`
  String get disabilitytitle {
    return Intl.message(
      'अपाङ्गताको स्थिति',
      name: 'disabilitytitle',
      desc: '',
      args: [],
    );
  }

  /// `अपाङ्गता नभएको`
  String get able {
    return Intl.message(
      'अपाङ्गता नभएको',
      name: 'able',
      desc: '',
      args: [],
    );
  }

  /// `शारिरीक अपाङगता`
  String get disable {
    return Intl.message(
      'शारिरीक अपाङगता',
      name: 'disable',
      desc: '',
      args: [],
    );
  }

  /// `बहिरा(सुन्न र बोल्न नसक्ने)`
  String get deaf {
    return Intl.message(
      'बहिरा(सुन्न र बोल्न नसक्ने)',
      name: 'deaf',
      desc: '',
      args: [],
    );
  }

  /// `दृश्टिबिहिन(अाखा नदेख्ने)`
  String get blind {
    return Intl.message(
      'दृश्टिबिहिन(अाखा नदेख्ने)',
      name: 'blind',
      desc: '',
      args: [],
    );
  }

  /// `सुस्त श्रवण भएकाे`
  String get hearingloss {
    return Intl.message(
      'सुस्त श्रवण भएकाे',
      name: 'hearingloss',
      desc: '',
      args: [],
    );
  }

  /// `भकभके`
  String get slammer {
    return Intl.message(
      'भकभके',
      name: 'slammer',
      desc: '',
      args: [],
    );
  }

  /// `सुस्त मनस्थिती`
  String get celeberal {
    return Intl.message(
      'सुस्त मनस्थिती',
      name: 'celeberal',
      desc: '',
      args: [],
    );
  }

  /// `मनोसामाजिक अपाङगता भएको`
  String get retarded {
    return Intl.message(
      'मनोसामाजिक अपाङगता भएको',
      name: 'retarded',
      desc: '',
      args: [],
    );
  }

  /// `बहु अपाँगता`
  String get multidisable {
    return Intl.message(
      'बहु अपाँगता',
      name: 'multidisable',
      desc: '',
      args: [],
    );
  }

  /// `बौद्विक अपाङगता भएको`
  String get mental {
    return Intl.message(
      'बौद्विक अपाङगता भएको',
      name: 'mental',
      desc: '',
      args: [],
    );
  }

  /// `साक्षरताको स्थिति`
  String get literacytitle {
    return Intl.message(
      'साक्षरताको स्थिति',
      name: 'literacytitle',
      desc: '',
      args: [],
    );
  }

  /// `साक्षर`
  String get literate {
    return Intl.message(
      'साक्षर',
      name: 'literate',
      desc: '',
      args: [],
    );
  }

  /// `पूर्वप्राथमिक`
  String get preprimary {
    return Intl.message(
      'पूर्वप्राथमिक',
      name: 'preprimary',
      desc: '',
      args: [],
    );
  }

  /// `प्राथमिक`
  String get primary {
    return Intl.message(
      'प्राथमिक',
      name: 'primary',
      desc: '',
      args: [],
    );
  }

  /// `माध्यमिक`
  String get secondary {
    return Intl.message(
      'माध्यमिक',
      name: 'secondary',
      desc: '',
      args: [],
    );
  }

  /// `प्राविधिक`
  String get technical {
    return Intl.message(
      'प्राविधिक',
      name: 'technical',
      desc: '',
      args: [],
    );
  }

  /// `स्नातक तह`
  String get bachelor {
    return Intl.message(
      'स्नातक तह',
      name: 'bachelor',
      desc: '',
      args: [],
    );
  }

  /// `स्नातकोत्तर तह`
  String get master {
    return Intl.message(
      'स्नातकोत्तर तह',
      name: 'master',
      desc: '',
      args: [],
    );
  }

  /// `एमफिल`
  String get mphil {
    return Intl.message(
      'एमफिल',
      name: 'mphil',
      desc: '',
      args: [],
    );
  }

  /// `उमेर कम`
  String get underage {
    return Intl.message(
      'उमेर कम',
      name: 'underage',
      desc: '',
      args: [],
    );
  }

  /// `निरक्षर`
  String get illiterate {
    return Intl.message(
      'निरक्षर',
      name: 'illiterate',
      desc: '',
      args: [],
    );
  }

  /// `बसोबासको अवस्था`
  String get residencetitle {
    return Intl.message(
      'बसोबासको अवस्था',
      name: 'residencetitle',
      desc: '',
      args: [],
    );
  }

  /// `गणना गरेकै ठाउँमा बसेको`
  String get defaultresidence {
    return Intl.message(
      'गणना गरेकै ठाउँमा बसेको',
      name: 'defaultresidence',
      desc: '',
      args: [],
    );
  }

  /// `स्बिदेशमा बसेको`
  String get foreign {
    return Intl.message(
      'स्बिदेशमा बसेको',
      name: 'foreign',
      desc: '',
      args: [],
    );
  }

  /// `स्वदेशमा अन्यत्र बसेको`
  String get countryside {
    return Intl.message(
      'स्वदेशमा अन्यत्र बसेको',
      name: 'countryside',
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
