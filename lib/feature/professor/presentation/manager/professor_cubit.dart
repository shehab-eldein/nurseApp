import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurse_space/core/handlers/failure.dart';
import '../../data/models/professor/professor.dart';
import '../../data/repositories/professor_repo.dart';


part 'professor_state.dart';
part 'professor_cubit.freezed.dart';




class ProfessorCubit extends Cubit<ProfessorState> {

  final ProfessorRepo professorRepo;

  ProfessorCubit({required this.professorRepo}) : super(const ProfessorState.loading());

  List<Professor> professorsList  = [];

  void getAllProfessors() async {



    if (professorsList.isEmpty) {
      print("NEW Professors DATAAA");
      final Either<Failure,List<Professor>> professors = await professorRepo.getAllProfessors();

      professors.fold(
              (failure) {
            emit(ProfessorState.error(failure.message));
          },
              (List<Professor> profs) => {
            professorsList = profs,
            print(professorsList.length),
            emit(ProfessorState.success(professorsList))
          });
    }else {
      print("Cached DATAAA");
      emit(ProfessorState.success(professorsList));
    }



  }
}