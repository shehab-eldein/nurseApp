

part of 'placesCubit.dart';


@freezed
class PlacesState<T> with _$PlacesState {


  const factory PlacesState.loading() = Loading;
  const factory PlacesState.LoadedCity(List<City> cities ) = LoadedCity;
  const factory PlacesState.LoadedUniviristies(List<University> universities ) = LoadedUniviristies;
  const factory PlacesState.error(String errorMessage) = Error;

}