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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_title": MessageLookupByLibrary.simpleMessage("Track Your Dollar"),
        "authentication_failed":
            MessageLookupByLibrary.simpleMessage("Authentication failed"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "email_cannot_be_empty":
            MessageLookupByLibrary.simpleMessage("Email cannot be empty"),
        "error_resetting_password": MessageLookupByLibrary.simpleMessage(
            "There was an error sending the password reset email"),
        "forgot_password":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "login": MessageLookupByLibrary.simpleMessage("Log In"),
        "logout": MessageLookupByLibrary.simpleMessage("Log Out"),
        "logout_failed": MessageLookupByLibrary.simpleMessage("Log Out failed"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "password_confirmation":
            MessageLookupByLibrary.simpleMessage("Password Confirmation"),
        "password_digit_missing": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least one digit."),
        "password_lowercase_missing": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least one lowercase letter."),
        "password_minimum_six": MessageLookupByLibrary.simpleMessage(
            "Password must be longer than 6 characters."),
        "password_mismatch":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "password_not_empty":
            MessageLookupByLibrary.simpleMessage("Password cannot be empty"),
        "password_reset_successfully": MessageLookupByLibrary.simpleMessage(
            "Password reset email sent successfully"),
        "password_special_character_missing":
            MessageLookupByLibrary.simpleMessage(
                "Password must contain at least one special character."),
        "password_uppercase_missing": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least one uppercase letter."),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "reset_password":
            MessageLookupByLibrary.simpleMessage("Reset Password"),
        "sending_reset_password_email": MessageLookupByLibrary.simpleMessage(
            "Sending password reset email..."),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signing_in": MessageLookupByLibrary.simpleMessage("Signing in..."),
        "signing_out": MessageLookupByLibrary.simpleMessage("Signing out..."),
        "signing_up":
            MessageLookupByLibrary.simpleMessage("Creating account..."),
        "switch_to_login":
            MessageLookupByLibrary.simpleMessage("Have an account? Login"),
        "switch_to_register":
            MessageLookupByLibrary.simpleMessage("Need an account? Register"),
        "track_spendings":
            MessageLookupByLibrary.simpleMessage("Track spendings here"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome!"),
        "wrong_email_format": MessageLookupByLibrary.simpleMessage(
            "Email is not in the correct format")
      };
}
