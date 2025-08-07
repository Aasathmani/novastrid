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

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `en`
  String get _locale {
    return Intl.message('en', name: '_locale', desc: '', args: []);
  }

  /// `Ok`
  String get btnOk {
    return Intl.message('Ok', name: 'btnOk', desc: '', args: []);
  }

  /// `Categories`
  String get labelCategories {
    return Intl.message(
      'Categories',
      name: 'labelCategories',
      desc: '',
      args: [],
    );
  }

  /// `Cooking Up!`
  String get labelCookingUp {
    return Intl.message(
      'Cooking Up!',
      name: 'labelCookingUp',
      desc: '',
      args: [],
    );
  }

  /// `Meals`
  String get labelMeals {
    return Intl.message('Meals', name: 'labelMeals', desc: '', args: []);
  }

  /// `Filter`
  String get labelFilter {
    return Intl.message('Filter', name: 'labelFilter', desc: '', args: []);
  }

  /// `No meals found.`
  String get labelNoMealsFound {
    return Intl.message(
      'No meals found.',
      name: 'labelNoMealsFound',
      desc: '',
      args: [],
    );
  }

  /// `Lactose-free`
  String get labelLactoseFree {
    return Intl.message(
      'Lactose-free',
      name: 'labelLactoseFree',
      desc: '',
      args: [],
    );
  }

  /// `Gluten-free`
  String get labelGlutenFree {
    return Intl.message(
      'Gluten-free',
      name: 'labelGlutenFree',
      desc: '',
      args: [],
    );
  }

  /// `Veg-free`
  String get labelVegFree {
    return Intl.message('Veg-free', name: 'labelVegFree', desc: '', args: []);
  }

  /// `Vegan-free`
  String get labelVeganFree {
    return Intl.message(
      'Vegan-free',
      name: 'labelVeganFree',
      desc: '',
      args: [],
    );
  }

  /// `Only include Gluten-free meals`
  String get labelOnlyIncludeGlutenFreeMeals {
    return Intl.message(
      'Only include Gluten-free meals',
      name: 'labelOnlyIncludeGlutenFreeMeals',
      desc: '',
      args: [],
    );
  }

  /// `Only include Lactose-free meals`
  String get labelOnlyIncludeLactoseFreeMeals {
    return Intl.message(
      'Only include Lactose-free meals',
      name: 'labelOnlyIncludeLactoseFreeMeals',
      desc: '',
      args: [],
    );
  }

  /// `Only include Vegan meals`
  String get labelOnlyIncludeVeganMeals {
    return Intl.message(
      'Only include Vegan meals',
      name: 'labelOnlyIncludeVeganMeals',
      desc: '',
      args: [],
    );
  }

  /// `Only include Vegetarian meals`
  String get labelOnlyIncludeVegetarianMeals {
    return Intl.message(
      'Only include Vegetarian meals',
      name: 'labelOnlyIncludeVegetarianMeals',
      desc: '',
      args: [],
    );
  }

  /// `Your Filter`
  String get labelYourFilter {
    return Intl.message(
      'Your Filter',
      name: 'labelYourFilter',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients`
  String get labelIngredients {
    return Intl.message(
      'Ingredients',
      name: 'labelIngredients',
      desc: '',
      args: [],
    );
  }

  /// `Steps`
  String get labelSteps {
    return Intl.message('Steps', name: 'labelSteps', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
