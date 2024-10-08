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

class OnboardLocalizations {
  OnboardLocalizations();

  static OnboardLocalizations? _current;

  static OnboardLocalizations get current {
    assert(_current != null,
        'No instance of OnboardLocalizations was loaded. Try to initialize the OnboardLocalizations delegate before accessing OnboardLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<OnboardLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = OnboardLocalizations();
      OnboardLocalizations._current = instance;

      return instance;
    });
  }

  static OnboardLocalizations of(BuildContext context) {
    final instance = OnboardLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of OnboardLocalizations present in the widget tree. Did you add OnboardLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static OnboardLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<OnboardLocalizations>(
        context, OnboardLocalizations);
  }

  /// `This is test onboard string for the project`
  String get test {
    return Intl.message(
      'This is test onboard string for the project',
      name: 'test',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<OnboardLocalizations> {
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
  Future<OnboardLocalizations> load(Locale locale) =>
      OnboardLocalizations.load(locale);
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
