import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/enums/app_enums.dart';
import '../../../data/request_retry_helper/request_retry_helper.dart';
import '../../../domain/interface_repos/main_repo.dart';
import 'main_state.dart';

@Singleton()
class MainVm extends Cubit<MainState> {
  final MainRepo mainRepo;
  late RetryRequestHelper retryHelper;
  MainVm(this.mainRepo) : super(MainState()) {
    retryHelper = RetryRequestHelper(function: getCategoriesAndProducts);
  }

  void setSelectedTab(int index) =>
      emit(state.copyWith(currentSelectedTab: index));

  void getCategoriesAndProducts() {
    _handleData(
      fetchFunction: mainRepo.getHomeCategories,
      onSuccess: (data) => emit(state.copyWith(
        categoriesState: BaseApiState.success,
        categories: data.categoryData,
        categoriesTitlesAndImages: {
          for (var cat in data.categoryData!)
            if (cat.name != null && cat.image != null) cat.name!: cat.image!
        },
      )),
      onError: (error) => emit(state.copyWith(
          categoriesState: BaseApiState.failure, errorMessage: error)),
    );

    _handleData(
      fetchFunction: mainRepo.getProducts,
      onSuccess: (data) {
        emit(state.copyWith(
          productState: BaseApiState.success,
          products: data.productDmList,
        ));
      },
      onError: (error) => emit(state.copyWith(
          productState: BaseApiState.failure, errorMessage: error)),
    );
  }

  Future<void> _handleData<T>({
    required Future<Either<String, T>> Function() fetchFunction,
    required Function(T) onSuccess,
    required Function(String) onError,
  }) async {
    emit(state.copyWith(categoriesState: BaseApiState.loading));
    final result = await fetchFunction();
    result.fold(
      (error) => onError(error),
      (data) => onSuccess(data),
    );
  }

  @override
  Future<void> close() {
    retryHelper.closeSubscription();
    return super.close();
  }
}
