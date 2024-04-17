

part of 'categoriesCubit.dart';




@freezed
class CategoriesState with _$CategoriesState {


  const factory CategoriesState.loading() = Loading;
  const factory CategoriesState.success(List<CategoryOfCourse> categoryList ) = Success;
  const factory CategoriesState.error(String errorMessage) = Error;

}