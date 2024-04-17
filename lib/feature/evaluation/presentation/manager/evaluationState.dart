part of 'evaluationCubit.dart';





@freezed
class EvaluationState with _$EvaluationState {


  const factory EvaluationState.loading() = Loading;
  const factory EvaluationState.success(Evaluation evaluation ) = Success;
  const factory EvaluationState.error(String errorMessage) = Error;

}