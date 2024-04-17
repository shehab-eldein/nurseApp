

part of 'professor_cubit.dart';




@freezed
class ProfessorState<T> with _$ProfessorState {


  const factory ProfessorState.loading() = Loading;
  const factory ProfessorState.success( T data ) = Success;
  const factory ProfessorState.error(String errorMessage) = Error;

}