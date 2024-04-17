


import 'dart:ffi';

import 'package:either_dart/either.dart';
import 'package:nurse_space/core/handlers/apiErrorHandler.dart';
import 'package:nurse_space/core/handlers/failure.dart';
import 'package:nurse_space/feature/evaluation/data/data_sources/evaluationRemoteDataSource.dart';
import 'package:nurse_space/feature/evaluation/data/models/evaluation.dart';

class EvaluationRepo {

  final EvaluationRemoteDataSource evaluationRemoteDataSource;

  EvaluationRepo(this.evaluationRemoteDataSource);

  Future<Either<Failure,Evaluation>> getEvaluation({required int userId}) async{


    try{
      final evaluation = await evaluationRemoteDataSource.getEvaluation(userId: userId);

      return Right(evaluation);

    }on CustomError catch(e) {

      return Left(Failure(e.message));

    }catch(_){

      return Left(Failure("Cannot Get Evaluation"));

    }










  }

}