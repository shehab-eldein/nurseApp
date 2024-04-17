import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nurse_space/core/handlers/apiErrorHandler.dart';
import 'package:nurse_space/feature/search/data/models/search_result_model.dart';
import 'package:nurse_space/feature/courses/data/models/course/course.dart';
import 'package:nurse_space/feature/courses/data/models/lesson/lesson.dart';

import '../../../../core/constant/endPoints.dart';
import '../../../../core/managers/dio_manager.dart';
import '../../../categories/data/models/category/category.dart';

void main() async {
  SearchRemoteDataSource().search("s");
}

class SearchRemoteDataSource {
  Future<SearchResult> search(String searchText) async {
    try {
      final endPoint = EndPoints.search;
      final response = await DioManager.dio
          .get(endPoint, queryParameters: {"q": searchText});
      final jsonEncoded = json.encode(response.data);
      final jsonData = json.decode(jsonEncoded);

      final SearchResult searchResult = SearchResult.fromJson(jsonData);

      return searchResult;
    } on DioException catch (e) {
      ApiErrorHandler.validateErrors(e.response);
      rethrow;
    }
  }
}
