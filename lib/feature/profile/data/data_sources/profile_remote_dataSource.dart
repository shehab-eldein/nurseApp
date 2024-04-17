import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nurse_space/core/handlers/apiErrorHandler.dart';

import '../../../../core/constant/endPoints.dart';
import '../../../../core/managers/dio_manager.dart';
import '../../../../core/model/user_model/user.dart';

main() {
  ProfileRemoteDataSource().updateUser(
      user: User(
    name: "Test update app22",
    id: 27,
    email: "test@up.com",
    roles: [2],
  ));
}

class ProfileRemoteDataSource {
  Future<User> getUser({required int id}) async {
    try {
      final response = await DioManager.dio.get("${EndPoints.users}/$id");
      final jsonEncoded = json.encode(response.data);

      final jsonData = json.decode(jsonEncoded);
      final dynamic dataObject = jsonData['data'];
      final User user = User.fromJson(dataObject);

      return user;
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      print("Enteeeeeer Catccccchhh");

      rethrow;
    }
  }

  Future<User> updateUser({required User user}) async {
    try {
      final response =
          await DioManager.dio.put("${EndPoints.users}/${user.id}", data: {
        "name": user.name,
        "email": user.email,
        "password": user.password,
        "phone": user.phone,
        "roles": user.roles,
        "user_type": "test update",
        "universityId": user.universityId,
        "cityId": user.cityId,
        "photo": user.photo,
      });

      final jsonEncoded = json.encode(response.data);

      final jsonData = json.decode(jsonEncoded);
      final dynamic dataObject = jsonData['data'];
      final User userObj = User.fromJson(dataObject);

      return userObj;
    } on DioException catch (e) {
      //ApiErrorHandler.validateErrors(e.response);
      //print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
