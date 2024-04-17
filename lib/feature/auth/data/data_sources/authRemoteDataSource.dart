import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../core/constant/endPoints.dart';
import '../../../../core/handlers/apiErrorHandler.dart';
import '../../../../core/managers/dio_manager.dart';
import '../../../../core/model/user_model/user.dart';
import '../../../places/data/models/city/city.dart';

void main() async{


   // AuthRemoteDataSource().postNewUser(User(
   //     name: "sss",
   //     email: "z@z.com",
   //     password: "2321321",
   //     phone: "1111111"));


  //AuthRemoteDataSource().getAllCities();


}


class AuthRemoteDataSource {

  Future<List<User>> getAllUsers ()async{
    final response = await DioManager.dio.get(EndPoints.users);
    final jsonEncoded = json.encode(response.data);

    final jsonData = json.decode(jsonEncoded);
    final List<dynamic> dataObject = jsonData['data'];
    final List<User> users = dataObject.map((json) => User.fromJson(json)).toList();

    return users;
  }


  Future<void> postNewUser(User user) async{


    try{
     final response = await DioManager.dio.post(
          EndPoints.register,
          data: {
            "name": user.name,
            "email": user.email,
            "password": user.password,
            "phone": user.phone,
            "roles": [
              3
            ],
            "user_type": "shehab"
          }

      );

     print(response.statusCode);





    } on DioException catch(e) {

      ApiErrorHandler.validateErrors(e.response);
      print(e.message);
      rethrow;

    }

  }

  Future<String> login(String email, String password) async{
    try {
      final response = await DioManager.dio.post(
          EndPoints.login,
          data: {
            "email": email,
            "password": password
          }

      );
      print(response.statusMessage);
      final jsonEncoded = json.encode(response.data);


      Map<String, dynamic> jsonMap = json.decode(jsonEncoded);

      String accessToken = jsonMap['access_token'];

      ApiErrorHandler.validateErrors(response);

      return accessToken;
    }on DioException catch(e) {
      ApiErrorHandler.validateErrors(e.response);
      rethrow;

    }



  }












}