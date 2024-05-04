import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:track_your_dollar/features/authentication/presentation/pages/login_register_page.dart';
import 'package:track_your_dollar/features/home/presentation/pages/home_page.dart';
import 'package:track_your_dollar/injection/injection_container.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = di<AuthenticationBloc>();
    _authenticationBloc.add(CheckUserAuthenticatedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: _authenticationBloc,
        builder: (context, state) {
          if (state is AuthenticationFailedState) {
            return const LoginRegisterPage();
          } else if (state is AuthenticationSuccessState) {
            return const HomePage();
          } else {
            return const Scaffold(
              body: Center(
                child: SizedBox(),
              ),
            );
          }
        });
  }
}
