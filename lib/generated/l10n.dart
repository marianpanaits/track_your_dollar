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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Add category`
  String get add_category {
    return Intl.message(
      'Add category',
      name: 'add_category',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Amount cannot be empty`
  String get amount_required {
    return Intl.message(
      'Amount cannot be empty',
      name: 'amount_required',
      desc: '',
      args: [],
    );
  }

  /// `Track Your Dollar`
  String get app_title {
    return Intl.message(
      'Track Your Dollar',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Authentication failed`
  String get authentication_failed {
    return Intl.message(
      'Authentication failed',
      name: 'authentication_failed',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Category created successfully`
  String get category_created_successfully {
    return Intl.message(
      'Category created successfully',
      name: 'category_created_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Creating category...`
  String get creating_category {
    return Intl.message(
      'Creating category...',
      name: 'creating_category',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot be empty`
  String get email_cannot_be_empty {
    return Intl.message(
      'Email cannot be empty',
      name: 'email_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `There was an error sending the password reset email`
  String get error_resetting_password {
    return Intl.message(
      'There was an error sending the password reset email',
      name: 'error_resetting_password',
      desc: '',
      args: [],
    );
  }

  /// `Failed to create category`
  String get failed_to_create_category {
    return Intl.message(
      'Failed to create category',
      name: 'failed_to_create_category',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get login {
    return Intl.message(
      'Log In',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Log Out failed`
  String get logout_failed {
    return Intl.message(
      'Log Out failed',
      name: 'logout_failed',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Name cannot be empty`
  String get name_cannot_be_empty {
    return Intl.message(
      'Name cannot be empty',
      name: 'name_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password must be longer than 6 characters.`
  String get password_minimum_six {
    return Intl.message(
      'Password must be longer than 6 characters.',
      name: 'password_minimum_six',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get password_not_empty {
    return Intl.message(
      'Password cannot be empty',
      name: 'password_not_empty',
      desc: '',
      args: [],
    );
  }

  /// `Password Confirmation`
  String get password_confirmation {
    return Intl.message(
      'Password Confirmation',
      name: 'password_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one digit.`
  String get password_digit_missing {
    return Intl.message(
      'Password must contain at least one digit.',
      name: 'password_digit_missing',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one lowercase letter.`
  String get password_lowercase_missing {
    return Intl.message(
      'Password must contain at least one lowercase letter.',
      name: 'password_lowercase_missing',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get password_mismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'password_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `Password reset email sent successfully`
  String get password_reset_successfully {
    return Intl.message(
      'Password reset email sent successfully',
      name: 'password_reset_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one special character.`
  String get password_special_character_missing {
    return Intl.message(
      'Password must contain at least one special character.',
      name: 'password_special_character_missing',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter.`
  String get password_uppercase_missing {
    return Intl.message(
      'Password must contain at least one uppercase letter.',
      name: 'password_uppercase_missing',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Sending password reset email...`
  String get sending_reset_password_email {
    return Intl.message(
      'Sending password reset email...',
      name: 'sending_reset_password_email',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Signing out...`
  String get signing_out {
    return Intl.message(
      'Signing out...',
      name: 'signing_out',
      desc: '',
      args: [],
    );
  }

  /// `Signing in...`
  String get signing_in {
    return Intl.message(
      'Signing in...',
      name: 'signing_in',
      desc: '',
      args: [],
    );
  }

  /// `Creating account...`
  String get signing_up {
    return Intl.message(
      'Creating account...',
      name: 'signing_up',
      desc: '',
      args: [],
    );
  }

  /// `Need an account? Register`
  String get switch_to_register {
    return Intl.message(
      'Need an account? Register',
      name: 'switch_to_register',
      desc: '',
      args: [],
    );
  }

  /// `Have an account? Login`
  String get switch_to_login {
    return Intl.message(
      'Have an account? Login',
      name: 'switch_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Track spendings here`
  String get track_spendings {
    return Intl.message(
      'Track spendings here',
      name: 'track_spendings',
      desc: '',
      args: [],
    );
  }

  /// `Welcome!`
  String get welcome {
    return Intl.message(
      'Welcome!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Email is not in the correct format`
  String get wrong_email_format {
    return Intl.message(
      'Email is not in the correct format',
      name: 'wrong_email_format',
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
      Locale.fromSubtags(languageCode: 'ro'),
    ];
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
