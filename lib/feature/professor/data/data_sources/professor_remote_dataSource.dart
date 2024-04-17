

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nurse_space/core/handlers/apiErrorHandler.dart';

import '../../../../core/constant/endPoints.dart';
import '../../../../core/managers/dio_manager.dart';
import '../models/professor/professor.dart';

class ProfessorRemoteDataSource  {

  Future<List<Professor>> getAllProfessors() async {

    try {

      final response = await DioManager.dio.get(EndPoints.professors);
      final jsonEncoded = json.encode(response.data);

      final jsonData = json.decode(jsonEncoded);
      final List<dynamic> dataObject = jsonData['data'];
      final List<Professor> professors = dataObject.map((json) => Professor.fromJson(json))
          .toList();
      print( professors[0].user?.name);

      return professors;

    }on DioException catch(e){
      ApiErrorHandler.validateErrors(e.response);
      rethrow;
    }

  }


}