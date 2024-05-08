import 'package:flutter/material.dart';
import 'package:track_your_dollar/core/widgets/side_menu.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:track_your_dollar/features/categories/presentation/pages/create_category_page.dart';
import 'package:track_your_dollar/generated/l10n.dart';

class CategoriesPage extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;

  const CategoriesPage({super.key, required this.authenticationBloc});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(S.of(context).categories),
      ),
      drawer: SideMenu(authenticationBloc: widget.authenticationBloc),
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
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CreateCategoryPage(),
        )),
        tooltip: S.of(context).add_category,
        child: const Icon(Icons.add),
      ),
    );
  }
}
