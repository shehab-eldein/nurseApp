import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurse_space/feature/evaluation/data/repositories/evaluationRepo.dart';
import '../../../../core/handlers/failure.dart';
import '../../data/models/evaluation.dart';


part 'evaluationState.dart';
part 'evaluationCubit.freezed.dart';




class EvaluationCubit extends Cubit<EvaluationState> {

  final EvaluationRepo evaluationRepo;

  EvaluationCubit({required this.evaluationRepo}) : super(const EvaluationState.loading());



  void getEvaluation({required int userId}) async {

    final Either<Failure,Evaluation> evaluation = await evaluationRepo.getEvaluation(userId: userId);


    evaluation.fold(
            (failure) {
          emit(EvaluationState.error(failure.message));
        },(evaluationResponse){

              emit(EvaluationState.success(evaluationResponse));
    });


  }
}