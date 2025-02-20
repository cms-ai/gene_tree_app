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

class MainLocalizations {
  MainLocalizations();

  static MainLocalizations? _current;

  static MainLocalizations get current {
    assert(
      _current != null,
      'No instance of MainLocalizations was loaded. Try to initialize the MainLocalizations delegate before accessing MainLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<MainLocalizations> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = MainLocalizations();
      MainLocalizations._current = instance;

      return instance;
    });
  }

  static MainLocalizations of(BuildContext context) {
    final instance = MainLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of MainLocalizations present in the widget tree. Did you add MainLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static MainLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<MainLocalizations>(context, MainLocalizations);
  }

  /// `Enter email`
  String get enterEmailHint {
    return Intl.message(
      'Enter email',
      name: 'enterEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enterPassHint {
    return Intl.message(
      'Enter password',
      name: 'enterPassHint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPass {
    return Intl.message(
      'Forgot password',
      name: 'forgotPass',
      desc: '',
      args: [],
    );
  }

  /// `You don’t have an account`
  String get noAccountBefore {
    return Intl.message(
      'You don’t have an account',
      name: 'noAccountBefore',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message('Sign in', name: 'signIn', desc: '', args: []);
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `You already have an account`
  String get haveAcountBefore {
    return Intl.message(
      'You already have an account',
      name: 'haveAcountBefore',
      desc: '',
      args: [],
    );
  }

  /// `Clan: {name}`
  String clanName(Object name) {
    return Intl.message(
      'Clan: $name',
      name: 'clanName',
      desc: '',
      args: [name],
    );
  }

  /// `Detail`
  String get detail {
    return Intl.message('Detail', name: 'detail', desc: '', args: []);
  }

  /// `Hello!`
  String get hello {
    return Intl.message('Hello!', name: 'hello', desc: '', args: []);
  }

  /// `Event`
  String get event {
    return Intl.message('Event', name: 'event', desc: '', args: []);
  }

  /// `Members`
  String get member {
    return Intl.message('Members', name: 'member', desc: '', args: []);
  }

  /// `View all`
  String get viewAll {
    return Intl.message('View all', name: 'viewAll', desc: '', args: []);
  }

  /// `You don't have any clan events`
  String get noClanDes {
    return Intl.message(
      'You don\'t have any clan events',
      name: 'noClanDes',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<MainLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<MainLocalizations> load(Locale locale) =>
      MainLocalizations.load(locale);
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
