import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_your_dollar/core/widgets/loader_dialog.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:track_your_dollar/features/home/presentation/pages/home_page.dart';
import 'package:track_your_dollar/generated/l10n.dart';
import 'package:track_your_dollar/injection/injection_container.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoginMode = true;
  late AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = di<AuthenticationBloc>();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleFormMode() {
    setState(() {
      _isLoginMode = !_isLoginMode;
    });
  }

  void _submitForm() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (_isLoginMode) {
      // Process login logic
      log('Logging in with username: $username, password: $password');
      _authenticationBloc.add(AuthenticateUserEvent(
        email: username,
        password: password,
      ));
    } else {
      // Process registration logic
      log('Registering with username: $username, password: $password');
      _authenticationBloc.add(SignUpUserEvent(
        email: username,
        password: password,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_isLoginMode ? 'Login' : 'Register'),
          automaticallyImplyLeading: false,
        ),
        body: BlocConsumer(
          bloc: _authenticationBloc,
          listener: (context, state) async {
            if (state is AuthenticationSuccessState) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            } else if (state is AuthenticationFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message ?? 'Authentication failed'),
                ),
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 8),
                      _isLoginMode
                          ? const SizedBox()
                          : TextField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text(_isLoginMode ? 'Login' : 'Register'),
                      ),
                      TextButton(
                        onPressed: _toggleFormMode,
                        child: Text(_isLoginMode
                            ? 'Need an account? Register'
                            : 'Have an account? Login'),
                      ),
                    ],
                  ),
                ),
                _buildLoader(state),
              ],
            );
          },
        ),
      ),
    );
  }

  _buildLoader(Object? state) {
    if (state is AuthenticationLoadingState) {
      return LoaderDialog(
        content: S.of(context).signing_in,
      );
    } else {
      return const SizedBox();
    }
  }
}
