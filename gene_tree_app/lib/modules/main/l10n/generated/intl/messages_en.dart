// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) => "Clan: ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "detail": MessageLookupByLibrary.simpleMessage("Detail"),
    "enterEmailHint": MessageLookupByLibrary.simpleMessage("Enter email"),
    "enterPassHint": MessageLookupByLibrary.simpleMessage("Enter password"),
    "event": MessageLookupByLibrary.simpleMessage("Event"),
    "forgotPass": MessageLookupByLibrary.simpleMessage("Forgot password"),
    "haveAcountBefore": MessageLookupByLibrary.simpleMessage(
      "You already have an account",
    ),
    "hello": MessageLookupByLibrary.simpleMessage("Hello!"),
    "hello2": MessageLookupByLibrary.simpleMessage("Nhập email"),
    "member": MessageLookupByLibrary.simpleMessage("Members"),
    "nameClan": m0,
    "noAccountBefore": MessageLookupByLibrary.simpleMessage(
      "You don\'t have an account",
    ),
    "noClanDes": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any clan events",
    ),
    "noClanMember": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any clan members",
    ),
    "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
    "signInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Sign in with Google",
    ),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
    "viewAll": MessageLookupByLibrary.simpleMessage("View all"),
  };
}
