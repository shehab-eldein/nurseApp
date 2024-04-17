import 'package:either_dart/either.dart';
import 'package:nurse_space/feature/professor/data/data_sources/professor_remote_dataSource.dart';

import '../../../../core/handlers/apiErrorHandler.dart';
import '../../../../core/handlers/failure.dart';
import '../../../categories/data/models/category/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/professor/professor.dart';


class ProfessorRepo {




  final  ProfessorRemoteDataSource professorRemoteDataSource;

  ProfessorRepo({required this.professorRemoteDataSource});



  Future<Either<Failure, List<Professor>>> getAllProfessors() async {

  try{

  final List<Professor>professors = await professorRemoteDataSource.getAllProfessors();
  return Right(professors);

  }on CustomError catch (e){

  return Left(Failure(e.message));

  }catch (e){
    return Left(Failure("Error"));
  }


  }



}