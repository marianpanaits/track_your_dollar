import 'package:flutter/material.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:track_your_dollar/generated/l10n.dart';

class SideMenu extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;

  const SideMenu({super.key, required this.authenticationBloc});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(S.of(context).welcome),
          ),
          ListTile(
            title: Text(S.of(context).settings),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(S.of(context).logout),
            onTap: () {
              Navigator.pop(context);
              widget.authenticationBloc.add(LogoutUserEvent());
            },
          ),
        ],
      ),
    );
  }
}
