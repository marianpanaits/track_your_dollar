import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_your_dollar/core/widgets/loader_dialog.dart';
import 'package:track_your_dollar/core/widgets/toaster.dart';
import 'package:track_your_dollar/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:track_your_dollar/features/categories/presentation/bloc/categories_event.dart';
import 'package:track_your_dollar/features/categories/presentation/bloc/categories_state.dart';
import 'package:track_your_dollar/features/categories/presentation/enums/category_enums.dart';
import 'package:track_your_dollar/features/categories/presentation/widgets/amount_field.dart';
import 'package:track_your_dollar/features/categories/presentation/widgets/category_name_field.dart';
import 'package:track_your_dollar/generated/l10n.dart';
import 'package:track_your_dollar/injection/injection_container.dart';
import 'package:track_your_dollar/resources/keys/margin_keys.dart';

class CreateCategoryPage extends StatefulWidget {
  const CreateCategoryPage({super.key});

  @override
  State<CreateCategoryPage> createState() => _CreateCategoryPageState();
}

class _CreateCategoryPageState extends State<CreateCategoryPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  late final CategoriesBloc _categoriesBloc;

  @override
  void initState() {
    super.initState();
    _categoriesBloc = di<CategoriesBloc>();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      bloc: _categoriesBloc,
      listener: _categoriesStateListener,
      builder: (context, state) => Center(
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                title: Text(S.of(context).add_category),
              ),
              body: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.all(MarginKeys.commonHorizontalPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CategoryNameField(controller: _nameController),
                            AmountField(controller: _amountController),
                          ],
                        ),
                      ),
                      const SizedBox(height: MarginKeys.commonVerticalPadding),
                      TextButton(
                        onPressed: _createCategory,
                        child: Text(S.of(context).add_category),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildLoader(state),
          ],
        ),
      ),
    );
  }

  void _categoriesStateListener(BuildContext context, CategoriesState state) {
    if (state is CreateCategorySuccessState) {
      Navigator.of(context).pop();
      Toaster.showToast(S.of(context).category_created_successfully);
    } else if (state is CreateCategoryFailedState) {
      Toaster.showToast(
          state.message ?? S.of(context).failed_to_create_category);
    }
  }

  Widget _buildLoader(CategoriesState state) {
    if (state is CreateCategoryLoadingState) {
      return LoaderDialog(content: S.of(context).creating_category);
    } else {
      return const SizedBox();
    }
  }

  void _createCategory() {
    if (_formKey.currentState!.validate()) {
      final categoryName = _nameController.text;
      final amount = int.parse(_amountController.text);
      final categoryType = CategoryType.expense.value;

      _categoriesBloc.add(CreateCategoryEvent(
          name: categoryName, amount: amount, type: categoryType));
    }
  }
}
