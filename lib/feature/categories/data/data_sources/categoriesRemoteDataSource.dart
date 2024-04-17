


import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/constant/endPoints.dart';
import '../../../../core/handlers/apiErrorHandler.dart';
import '../../../../core/managers/dio_manager.dart';
import '../models/category/category.dart';

class CategoriesRemoteDataSource {


  Future<List<CategoryOfCourse>> getAllCategories() async {
    try{

      final response = await DioManager.dio.get(EndPoints.categories);
      final jsonEncoded = json.encode(response.data);

      final jsonData = json.decode(jsonEncoded);
      final List<dynamic> dataObject = jsonData['data'];
      final List<CategoryOfCourse> categories = dataObject.map((json) => CategoryOfCourse.fromJson(json))
          .toList();
      return categories;

    } on DioException catch (e){
      ApiErrorHandler.validateErrors(e.response);
      rethrow;
    }




  }


}