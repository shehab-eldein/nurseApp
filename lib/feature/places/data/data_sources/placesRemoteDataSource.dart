import 'dart:convert';

import '../../../../core/constant/endPoints.dart';
import '../../../../core/managers/dio_manager.dart';
import '../models/city/city.dart';
import '../models/univeristy/univeristy.dart';

class PlacesRemoteDataSource {



  Future<List<City>> getAllCities ()async{
    print("Doneeeeee in Remote");
    try{
      final response = await DioManager.dio.get(EndPoints.cities);
      final jsonEncoded = json.encode(response.data);

      final jsonData = json.decode(jsonEncoded);
      final List<dynamic> dataObject = jsonData['data'];
      final List<City> cities = dataObject.map((json) => City.fromJson(json)).toList();


      return cities;
    } catch(e){

      rethrow;
    }
  }

  Future<List<University>> getAllUniversities ()async{
    final response = await DioManager.dio.get(EndPoints.universities);
    final jsonEncoded = json.encode(response.data);

    final jsonData = json.decode(jsonEncoded);
    final List<dynamic> dataObject = jsonData['data'];
    final List<University> universities = dataObject.map((json) => University.fromJson(json)).toList();

    return universities;
  }










}