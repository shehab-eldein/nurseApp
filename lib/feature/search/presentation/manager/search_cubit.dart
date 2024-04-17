import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurse_space/core/handlers/failure.dart';
import 'package:nurse_space/feature/search/data/models/search_result_model.dart';
import 'package:nurse_space/feature/auth/data/data_sources/authRemoteDataSource.dart';
import 'package:nurse_space/feature/auth/data/repositories/authRepo.dart';
import 'package:nurse_space/feature/courses/data/models/course/course.dart';
import 'package:nurse_space/feature/courses/data/repositories/courseRepo.dart';
import 'package:nurse_space/feature/search/data/repositories/search_repo.dart';

import '../../../categories/data/models/category/category.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;

  SearchCubit({required this.searchRepo}) : super(const SearchState.initial());





  void search(String searchText) async {
    emit(const SearchState.loading());

    final Either<Failure, SearchResult> categories =
    await searchRepo.search(searchText);

    categories.fold((failure) {
      emit(SearchState.error(failure.message));
    },
            (SearchResult searchResult) =>
        {emit(SearchState.success(searchResult))});
  }

}
