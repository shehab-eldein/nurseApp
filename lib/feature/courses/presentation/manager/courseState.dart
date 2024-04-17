part of 'courseCubit.dart';


@freezed
class CourseState<T> with _$CourseState {


  const factory CourseState.initial() = Initial;
  const factory CourseState.loading() = Loading;
  const factory CourseState.success(T? data ) = Success;
  const factory CourseState.error(String errorMessage) = Error;

}