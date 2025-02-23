import 'package:flutter/material.dart';
import 'package:gene_tree_app/modules/common/l10n/generated/l10n.dart';
import 'package:gene_tree_app/modules/main/l10n/generated/l10n.dart';
import 'package:gene_tree_app/modules/onboard/l10n/generated/l10n.dart';

// Iterable<LocalizationsDelegate<dynamic>> appLocalizations = [
//   OnboardLocalizations.delegate,
//   CommonLocalizations.delegate
// ];

class AppLocalizations {
  AppLocalizations._();
  static Iterable<LocalizationsDelegate<dynamic>> get appLocalizations => [
        OnboardLocalizations.delegate,
        MainLocalizations.delegate,
        CommonLocalizations.delegate,
      ];
}
