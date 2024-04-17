import 'package:either_dart/either.dart';
import 'package:nurse_space/core/handlers/apiErrorHandler.dart';
import 'package:nurse_space/feature/search/data/models/search_result_model.dart';
import 'package:nurse_space/feature/courses/data/data_sources/coursesRemotDataSource.dart';
import 'package:nurse_space/feature/courses/data/models/course/course.dart';
import 'package:nurse_space/feature/search/data/data_sources/search_remote_data_source.dart';

import '../../../../core/handlers/failure.dart';
import '../../../categories/data/models/category/category.dart';

class SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepo({required this.searchRemoteDataSource});



  Future<Either<Failure, SearchResult>> search(String searchText) async {
    try {
      final SearchResult searchResult =
      await searchRemoteDataSource.search(searchText);
      return Right(searchResult);
    } on CustomError catch (e) {
      return Left(Failure(e.message));
    } catch (_) {
      return Left(Failure("Cannot get data"));
    }
  }
}
