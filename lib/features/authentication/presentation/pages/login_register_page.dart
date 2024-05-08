import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_your_dollar/core/widgets/loader_dialog.dart';
import 'package:track_your_dollar/core/widgets/toaster.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:track_your_dollar/features/authentication/presentation/widgets/authentication_form.dart';
import 'package:track_your_dollar/features/home/presentation/pages/home_page.dart';
import 'package:track_your_dollar/generated/l10n.dart';
import 'package:track_your_dollar/injection/injection_container.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  LoginRegisterPageState createState() => LoginRegisterPageState();
}

class LoginRegisterPageState extends State<LoginRegisterPage> {
  late final AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = di<AuthenticationBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).login),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        bloc: _authenticationBloc,
        listener: _authStateListener,
        builder: (context, state) => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AuthenticationForm(
                authenticationBloc: _authenticationBloc,
              ),
            ),
            _buildLoader(state),
          ],
        ),
      ),
    );
  }

  void _authStateListener(BuildContext context, AuthenticationState state) {
    if (state is AuthenticationSuccessState) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    } else if (state is AuthenticationFailedState) {
      Toaster.showToast(state.message ?? S.of(context).authentication_failed);
    }
  }

  Widget _buildLoader(AuthenticationState state) {
    if (state is AuthenticationLoadingState) {
      return LoaderDialog(content: S.of(context).signing_in);
    } else {
      return const SizedBox();
    }
  }
}
