import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_your_dollar/core/error/failure.dart';
import 'package:track_your_dollar/features/categories/domain/usecase/category_params.dart';
import 'package:track_your_dollar/features/categories/domain/usecase/create_category_usecase.dart';
import 'package:track_your_dollar/features/categories/presentation/bloc/categories_event.dart';
import 'package:track_your_dollar/features/categories/presentation/bloc/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CreateCategoryUseCase createCategoryUseCase;

  CategoriesBloc({required this.createCategoryUseCase})
      : super(CategoriesInitialState()) {
    on<CreateCategoryEvent>(createCategory);
  }

  void createCategory(
    CreateCategoryEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CreateCategoryLoadingState());

    CategoryParams categoryParams = CategoryParams(
      name: event.name,
      amount: event.amount,
      categoryType: event.type,
    );

    final response = await createCategoryUseCase(categoryParams);

    emit(response.fold((failure) {
      return CreateCategoryFailedState(failure is UnexpectedFailure
          ? failure.unexpectedExceptionText
          : null);
    }, (result) {
      return CreateCategorySuccessState();
    }));
  }
}
