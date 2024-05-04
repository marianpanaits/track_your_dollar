import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_your_dollar/core/widgets/loader_dialog.dart';
import 'package:track_your_dollar/core/widgets/side_menu.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:track_your_dollar/features/authentication/presentation/pages/login_register_page.dart';
import 'package:track_your_dollar/generated/l10n.dart';
import 'package:track_your_dollar/injection/injection_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = di<AuthenticationBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _authenticationBloc,
      listener: (context, state) async {
        if (state is LogoutSuccessState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LoginRegisterPage(),
            ),
          );
        } else if (state is LogoutFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message ?? 'Logout failed'),
            ),
          );
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                title: Text(S.of(context).app_title),
              ),
              drawer: SideMenu(authenticationBloc: _authenticationBloc),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      S.of(context).track_spendings,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
            _buildLoader(state),
          ],
        );
      },
    );
  }

  _buildLoader(Object? state) {
    if (state is LogoutLoadingState) {
      return LoaderDialog(
        content: S.of(context).signing_out,
      );
    } else {
      return const SizedBox();
    }
  }
}
