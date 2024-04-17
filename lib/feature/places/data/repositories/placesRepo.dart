import 'package:either_dart/either.dart';
import 'package:nurse_space/feature/places/data/data_sources/placesRemoteDataSource.dart';

import '../../../../core/handlers/failure.dart';
import '../models/city/city.dart';
import '../models/univeristy/univeristy.dart';

class PlacesRepo {
  final PlacesRemoteDataSource placesRemoteDataSource;

  PlacesRepo({required this.placesRemoteDataSource});



  Future<Either<Failure, List<University>>> getUniversityList() async {
    try {
      final universityList = await placesRemoteDataSource.getAllUniversities();
      return Right(universityList);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
  Future<Either<Failure, List<City>>> getCityList() async {
    try {
      final cityList = await placesRemoteDataSource.getAllCities();
      return Right(cityList);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}