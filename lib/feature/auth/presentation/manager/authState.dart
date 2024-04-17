

part of 'authCubit.dart';

@freezed
class AuthState<T> with _$AuthState {

  const factory AuthState.initial() = initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.success(T? data ) = Success;
  const factory AuthState.error(String errorMessage) = Error;

}