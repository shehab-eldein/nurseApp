import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nurse_space/feature/evaluation/data/models/evaluation.dart';

import '../../../../core/constant/endPoints.dart';
import '../../../../core/handlers/apiErrorHandler.dart';
import '../../../../core/managers/dio_manager.dart';

void main() async{


  EvaluationRemoteDataSource().getEvaluation(userId: 1);
}
class EvaluationRemoteDataSource {

  Future<Evaluation> getEvaluation({required int userId}) async {
    try{
      final response = await DioManager.dio.get("${EndPoints.users}/$userId/${EndPoints.evaluation}");
      final jsonEncoded = json.encode(response.data);

      final jsonData = json.decode(jsonEncoded);
      final dynamic dataObject = jsonData['data'];
      final Evaluation evaluation =  Evaluation.fromJson(response.data);


      return evaluation;
    } on DioException catch(e){
      ApiErrorHandler.validateErrors(e.response);
      rethrow;
    }
  }









}