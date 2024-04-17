part of 'search_cubit.dart';



@freezed
class SearchState<T> with _$SearchState {


  const factory SearchState.initial() = Initial;
  const factory SearchState.loading() = Loading;
  const factory SearchState.success(SearchResult searchResult ) = Success;
  const factory SearchState.error(String errorMessage) = Error;

}