import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:nurse_space/core/handlers/apiErrorHandler.dart';
import 'package:nurse_space/feature/auth/data/data_sources/authRemoteDataSource.dart';


import '../../../../core/handlers/failure.dart';
import '../../../../core/model/user_model/user.dart';

class AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepo({required this.authRemoteDataSource});

  Future<List<User>> getAllUsers() {
    return authRemoteDataSource.getAllUsers();
  }

  Future<Either<Failure, String>> login(String email, String password) async {
    try {
      final token = await authRemoteDataSource.login(email, password);
      //Save Token in Device
      return Right(token!);
    } on CustomError catch (e) {
      print("enter custom errrorrrr");
      return Left(
        Failure(e.message),
      );
    } catch (_) {
      print("enter Defult errorrrr");
      return Left(
        Failure('Failed to login'),
      );
    }
  }

  Future<Either<Failure, String>> signup(User user) async {
    try {
      final token = await authRemoteDataSource.postNewUser(user);

      return Right("done");
    } on CustomError catch (e) {
      print("enterCustom errrrrrrror++++++");

      return Left(
        Failure(e.message),
      );
    } catch (e) {
      //print("enter Error $e errrrrrrror++++++");
      return Left(
        Failure('Failed to Signup please try another email'),
      );
    }
  }


}
