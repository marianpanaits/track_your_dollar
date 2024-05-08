import 'package:flutter/material.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:track_your_dollar/features/authentication/presentation/widgets/email_field.dart';
import 'package:track_your_dollar/features/authentication/presentation/widgets/password_confirmation_field.dart';
import 'package:track_your_dollar/features/authentication/presentation/widgets/password_field.dart';
import 'package:track_your_dollar/features/authentication/presentation/widgets/reset_password_modal.dart';
import 'package:track_your_dollar/generated/l10n.dart';

class AuthenticationForm extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;

  const AuthenticationForm({super.key, required this.authenticationBloc});

  @override
  AuthenticationFormState createState() => AuthenticationFormState();
}

class AuthenticationFormState extends State<AuthenticationForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  bool _isLoginMode = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              EmailField(controller: _emailController),
              const SizedBox(height: 8),
              PasswordField(controller: _passwordController),
              const SizedBox(height: 8),
              if (!_isLoginMode)
                PasswordConfirmationField(
                    controller: _passwordConfirmationController,
                    passwordController: _passwordController),
              const SizedBox(height: 20),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          child:
              Text(_isLoginMode ? S.of(context).login : S.of(context).register),
        ),
        TextButton(
          onPressed: _toggleFormMode,
          child: Text(_isLoginMode
              ? S.of(context).switch_to_register
              : S.of(context).switch_to_login),
        ),
        if (_isLoginMode)
          TextButton(
            onPressed: _openResetPasswordBottomSheet,
            child: Text(S.of(context).forgot_password),
          ),
      ],
    );
  }

  void _toggleFormMode() {
    setState(() {
      _isLoginMode = !_isLoginMode;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final username = _emailController.text;
      final password = _passwordController.text;

      if (_isLoginMode) {
        widget.authenticationBloc
            .add(AuthenticateUserEvent(email: username, password: password));
      } else {
        widget.authenticationBloc
            .add(SignUpUserEvent(email: username, password: password));
      }
    }
  }

  void _openResetPasswordBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const ResetPasswordModal();
      },
    );
  }
}
