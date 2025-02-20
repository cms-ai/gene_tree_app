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

class CommonLocalizations {
  CommonLocalizations();

  static CommonLocalizations? _current;

  static CommonLocalizations get current {
    assert(
      _current != null,
      'No instance of CommonLocalizations was loaded. Try to initialize the CommonLocalizations delegate before accessing CommonLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<CommonLocalizations> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = CommonLocalizations();
      CommonLocalizations._current = instance;

      return instance;
    });
  }

  static CommonLocalizations of(BuildContext context) {
    final instance = CommonLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of CommonLocalizations present in the widget tree. Did you add CommonLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static CommonLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<CommonLocalizations>(context, CommonLocalizations);
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

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<CommonLocalizations> {
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
  Future<CommonLocalizations> load(Locale locale) =>
      CommonLocalizations.load(locale);
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
