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
    assert(
      _current != null,
      'No instance of OnboardLocalizations was loaded. Try to initialize the OnboardLocalizations delegate before accessing OnboardLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<OnboardLocalizations> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of OnboardLocalizations present in the widget tree. Did you add OnboardLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static OnboardLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<OnboardLocalizations>(
      context,
      OnboardLocalizations,
    );
  }

  /// `Màn hình onboard`
  String get onboard {
    return Intl.message(
      'Màn hình onboard',
      name: 'onboard',
      desc: '',
      args: [],
    );
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

  /// `Re-enter password`
  String get reEnterPassHint {
    return Intl.message(
      'Re-enter password',
      name: 'reEnterPassHint',
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

  /// `You don't have an account`
  String get noAccountBefore1 {
    return Intl.message(
      'You don\'t have an account',
      name: 'noAccountBefore1',
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

  /// `Gia tộc - Cội nguồn của mọi gia đình`
  String get familyOriginTitle {
    return Intl.message(
      'Gia tộc - Cội nguồn của mọi gia đình',
      name: 'familyOriginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Gia tộc không chỉ là sự gắn bó của những người có cùng dòng máu, mà còn là nền tảng của sự yêu thương và bảo vệ. Đó là cội nguồn, nơi khởi đầu và sự nối tiếp qua bao thế hệ.`
  String get familyOriginContent {
    return Intl.message(
      'Gia tộc không chỉ là sự gắn bó của những người có cùng dòng máu, mà còn là nền tảng của sự yêu thương và bảo vệ. Đó là cội nguồn, nơi khởi đầu và sự nối tiếp qua bao thế hệ.',
      name: 'familyOriginContent',
      desc: '',
      args: [],
    );
  }

  /// `Truyền thống - Giá trị gia tộc trường tồn`
  String get familyTraditionTitle {
    return Intl.message(
      'Truyền thống - Giá trị gia tộc trường tồn',
      name: 'familyTraditionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Truyền thống không chỉ là những giá trị văn hóa, mà còn là bài học quý báu được truyền từ đời này sang đời khác. Đó là bản sắc, là niềm tự hào và trách nhiệm của từng thành viên trong gia đình.`
  String get familyTraditionContent {
    return Intl.message(
      'Truyền thống không chỉ là những giá trị văn hóa, mà còn là bài học quý báu được truyền từ đời này sang đời khác. Đó là bản sắc, là niềm tự hào và trách nhiệm của từng thành viên trong gia đình.',
      name: 'familyTraditionContent',
      desc: '',
      args: [],
    );
  }

  /// `Tương lai - Nơi gắn kết các thế hệ`
  String get familyFutureTitle {
    return Intl.message(
      'Tương lai - Nơi gắn kết các thế hệ',
      name: 'familyFutureTitle',
      desc: '',
      args: [],
    );
  }

  /// `Gia tộc là nền tảng cho sự phát triển của từng cá nhân, là nơi mỗi thế hệ tiếp nối, xây dựng và vun đắp. Hãy để những giá trị tốt đẹp của gia đình tiếp tục lan tỏa đến tương lai, gắn kết thêm nhiều thế hệ nữa.`
  String get familyFutureContent {
    return Intl.message(
      'Gia tộc là nền tảng cho sự phát triển của từng cá nhân, là nơi mỗi thế hệ tiếp nối, xây dựng và vun đắp. Hãy để những giá trị tốt đẹp của gia đình tiếp tục lan tỏa đến tương lai, gắn kết thêm nhiều thế hệ nữa.',
      name: 'familyFutureContent',
      desc: '',
      args: [],
    );
  }

  /// `Let's start`
  String get letStart {
    return Intl.message('Let\'s start', name: 'letStart', desc: '', args: []);
  }

  /// `Welcome to`
  String get welcomeTo {
    return Intl.message('Welcome to', name: 'welcomeTo', desc: '', args: []);
  }

  /// `By signing in, I agree with `
  String get policy1 {
    return Intl.message(
      'By signing in, I agree with ',
      name: 'policy1',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get policy2 {
    return Intl.message('Terms of Use', name: 'policy2', desc: '', args: []);
  }

  /// ` and `
  String get policy3 {
    return Intl.message(' and ', name: 'policy3', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get policy4 {
    return Intl.message('Privacy Policy', name: 'policy4', desc: '', args: []);
  }

  /// `Profile setup`
  String get profileSetup {
    return Intl.message(
      'Profile setup',
      name: 'profileSetup',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in your information`
  String get profileSetupDes {
    return Intl.message(
      'Please fill in your information',
      name: 'profileSetupDes',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message('Full name', name: 'fullName', desc: '', args: []);
  }

  /// `Date of birth`
  String get dob {
    return Intl.message('Date of birth', name: 'dob', desc: '', args: []);
  }

  /// `Enter your name`
  String get nameHint {
    return Intl.message(
      'Enter your name',
      name: 'nameHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your date of birth`
  String get dOBHint {
    return Intl.message(
      'Enter your date of birth',
      name: 'dOBHint',
      desc: '',
      args: [],
    );
  }

  /// `Name & Age *`
  String get nameAndAge {
    return Intl.message('Name & Age *', name: 'nameAndAge', desc: '', args: []);
  }

  /// `Clan`
  String get clan {
    return Intl.message('Clan', name: 'clan', desc: '', args: []);
  }

  /// `Clan name`
  String get clanName {
    return Intl.message('Clan name', name: 'clanName', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Enter your clan name`
  String get clanNameHint {
    return Intl.message(
      'Enter your clan name',
      name: 'clanNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your description`
  String get descriptionHint {
    return Intl.message(
      'Enter your description',
      name: 'descriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Login failed`
  String get loginFailed {
    return Intl.message(
      'Login failed',
      name: 'loginFailed',
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
