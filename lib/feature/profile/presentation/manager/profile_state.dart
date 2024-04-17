part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.loadedUser(User user) = LoadedUser;
  const factory ProfileState.error(String errorMessage) = Error;
}
