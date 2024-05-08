import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_your_dollar/core/widgets/loader_dialog.dart';
import 'package:track_your_dollar/core/widgets/toaster.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:track_your_dollar/generated/l10n.dart';
import 'package:track_your_dollar/injection/injection_container.dart';
import 'package:track_your_dollar/resources/keys/margin_keys.dart';

class ResetPasswordModal extends StatefulWidget {
  const ResetPasswordModal({super.key});

  @override
  State<ResetPasswordModal> createState() => _ResetPasswordModalState();
}

class _ResetPasswordModalState extends State<ResetPasswordModal> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  late final AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = di<AuthenticationBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _authenticationBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      bloc: _authenticationBloc,
      listener: _authStateListener,
      builder: (context, state) {
        return Stack(
          children: [
            FractionallySizedBox(
              heightFactor: 0.9,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  title: Text(S.of(context).reset_password),
                  automaticallyImplyLeading: false,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                body: Padding(
                  padding:
                      const EdgeInsets.all(MarginKeys.commonHorizontalPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _emailController,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return S.of(context).email_cannot_be_empty;
                            } else if (!EmailValidator.validate(email)) {
                              return S.of(context).wrong_email_format;
                            }
                            return null;
                          },
                          decoration:
                              InputDecoration(labelText: S.of(context).email),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(height: MarginKeys.bigVerticalPadding),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text(S.of(context).reset_password),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildLoader(state),
          ],
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _authenticationBloc.add(ResetPasswordEvent(email: _emailController.text));
    }
  }

  void _authStateListener(BuildContext context, AuthenticationState state) {
    if (state is ResetPasswordSuccessState) {
      Navigator.of(context).pop();
      Toaster.showToast(S.of(context).password_reset_successfully);
    } else if (state is ResetPasswordFailedState) {
      Toaster.showToast(
          state.message ?? S.of(context).error_resetting_password);
    }
  }

  Widget _buildLoader(AuthenticationState state) {
    if (state is ResetPasswordLoadingState) {
      return LoaderDialog(content: S.of(context).sending_reset_password_email);
    } else {
      return const SizedBox();
    }
  }
}
