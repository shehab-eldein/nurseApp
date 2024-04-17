import 'package:either_dart/either.dart';
import 'package:nurse_space/feature/profile/data/data_sources/profile_remote_dataSource.dart';
import '../../../../core/handlers/failure.dart';
import '../../../../core/model/user_model/user.dart';

class ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepo({required this.profileRemoteDataSource});



  Future<Either<Failure, User>> getUser({required int id}) async {
    try {
      final user = await profileRemoteDataSource.getUser(id: id);
      return Right(user);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, User>> updateUser({required User user}) async {
    try {
      final userObj = await profileRemoteDataSource.updateUser(user: user);
      return Right(userObj);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

}