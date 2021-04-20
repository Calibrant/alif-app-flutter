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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Список задач`
  String get app_bar_title {
    return Intl.message(
      'Список задач',
      name: 'app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Добавить новую задачу`
  String get tool_tip {
    return Intl.message(
      'Добавить новую задачу',
      name: 'tool_tip',
      desc: '',
      args: [],
    );
  }

  /// `Add New Item`
  String get button_add_new_item {
    return Intl.message(
      'Add New Item',
      name: 'button_add_new_item',
      desc: '',
      args: [],
    );
  }

  /// `Update Item`
  String get button_update_item {
    return Intl.message(
      'Update Item',
      name: 'button_update_item',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get model_status_pending {
    return Intl.message(
      'Pending',
      name: 'model_status_pending',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get model_status_completed {
    return Intl.message(
      'Completed',
      name: 'model_status_completed',
      desc: '',
      args: [],
    );
  }

  /// `Item deleted successfully`
  String get snack_bar_text {
    return Intl.message(
      'Item deleted successfully',
      name: 'snack_bar_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter Title`
  String get text_field_text {
    return Intl.message(
      'Enter Title',
      name: 'text_field_text',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get text_field_title {
    return Intl.message(
      'Title',
      name: 'text_field_title',
      desc: '',
      args: [],
    );
  }

  /// `Pick a date`
  String get button_pick_date {
    return Intl.message(
      'Pick a date',
      name: 'button_pick_date',
      desc: '',
      args: [],
    );
  }

  /// `d-MM-yyyy`
  String get date_format {
    return Intl.message(
      'd-MM-yyyy',
      name: 'date_format',
      desc: '',
      args: [],
    );
  }

  /// `Ничего не выбрано`
  String get date_nothing_selected {
    return Intl.message(
      'Ничего не выбрано',
      name: 'date_nothing_selected',
      desc: '',
      args: [],
    );
  }

  /// `Todos`
  String get bottom_navbar_title0 {
    return Intl.message(
      'Todos',
      name: 'bottom_navbar_title0',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get space {
    return Intl.message(
      '',
      name: 'space',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}