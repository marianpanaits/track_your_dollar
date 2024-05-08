import 'package:get_it/get_it.dart';
import 'package:track_your_dollar/core/mixin/repository_mixin.dart';
import 'package:track_your_dollar/core/network/connection_manager.dart';
import 'package:track_your_dollar/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:track_your_dollar/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:track_your_dollar/features/authentication/domain/repository/authentication_repository.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/check_user_authenticated_usecase.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/logout_user_usecase.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/reset_password_usecase.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/sign_in_with_email_and_password_usecase.dart';
import 'package:track_your_dollar/features/authentication/domain/usecase/sign_up_with_email_and_password_usecase.dart';
import 'package:track_your_dollar/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:track_your_dollar/features/categories/data/datasource/categories_datasource.dart';
import 'package:track_your_dollar/features/categories/data/repository/categories_repository_impl.dart';
import 'package:track_your_dollar/features/categories/domain/repository/categories_repository.dart';
import 'package:track_your_dollar/features/categories/domain/usecase/create_category_usecase.dart';
import 'package:track_your_dollar/features/categories/presentation/bloc/categories_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerFactory<ConnectionManager>(() => ConnectionManager());
  di.registerFactory<RepositoryMixin>(
      () => RepositoryMixin(connectionManager: di()));
  //authentication
  di.registerFactory<AuthenticationDatasource>(
      () => AuthenticationDatasource());
  di.registerFactory<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(
          repositoryMixin: di(), authenticationDatasource: di()));

  di.registerFactory<SignInWithEmailAndPasswordUseCase>(
      () => SignInWithEmailAndPasswordUseCase(di()));
  di.registerFactory<SignUpWithEmailAndPasswordUseCase>(
      () => SignUpWithEmailAndPasswordUseCase(di()));
  di.registerFactory<CheckUserAuthenticatedUseCase>(
      () => CheckUserAuthenticatedUseCase(di()));
  di.registerFactory<ResetPasswordUseCase>(() => ResetPasswordUseCase(di()));
  di.registerFactory<LogoutUserUseCase>(() => LogoutUserUseCase(di()));
  di.registerFactory<AuthenticationBloc>(() => AuthenticationBloc(
      signInWithEmailAndPasswordUseCase: di(),
      signUpWithEmailAndPasswordUseCase: di(),
      logoutUserUseCase: di(),
      resetPasswordUseCase: di(),
      checkUserAuthenticatedUseCase: di()));

  //categories
  di.registerFactory<CategoriesDatasource>(() => CategoriesDatasource());
  di.registerFactory<CategoriesRepository>(() => CategoriesRepositoryImpl(
      repositoryMixin: di(), categoriesDatasource: di()));
  di.registerFactory<CreateCategoryUseCase>(() => CreateCategoryUseCase(di()));
  di.registerFactory<CategoriesBloc>(
      () => CategoriesBloc(createCategoryUseCase: di()));
}
