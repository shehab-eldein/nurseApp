import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/feature/places/data/models/city/city.dart';
import 'package:nurse_space/feature/places/data/models/univeristy/univeristy.dart';
import 'package:nurse_space/feature/places/data/repositories/placesRepo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'placesState.dart';
part 'placesCubit.freezed.dart';

class PlacesCubit extends Cubit<PlacesState> {

  final PlacesRepo placesRepo;

  PlacesCubit({required this.placesRepo}) : super(PlacesState.loading());



  void getUniversityList()async {
    PlacesState.loading();
    final either = await placesRepo.getUniversityList();

    either.fold(
            (failure) => (){
          emit(PlacesState.error(failure.message));

        },
            (universityList) => {
              print("emitttt Univiresty"),
          emit( PlacesState.LoadedUniviristies(universityList))
        });
    //emit(AuthState.initial());

  }

  Future<void> getCityList()async {

    PlacesState.loading();


    final either = await placesRepo.getCityList();

    either.fold(
            (failure) => (){
          emit(PlacesState.error(failure.message));
          print(failure.message);
          print("Enter Failed in Cubit");

        },
            (cities) => {
          print("Enter Succ in Cubit"),
          emit( PlacesState.LoadedCity(cities))
        });
    // emit(const AuthState.initial());

  }
}