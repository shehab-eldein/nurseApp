import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurse_space/feature/profile/data/repositories/profile_repo.dart';

import '../../../../core/model/user_model/user.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo})
      : super(const ProfileState.loading());

  void getUser({required int id}) async {
    final either = await profileRepo.getUser(id: id);

    either.fold(
        (failure) => () {
              print("emitttt Errooor");
              emit(ProfileState.error(failure.message));
            },
        (user) =>
            {print("emitttt Useer"), emit(ProfileState.loadedUser(user))});
  }

  void updateUser({required User user}) async {
    final either = await profileRepo.updateUser(user: user);

    either.fold((failure) => emit(ProfileState.error(failure.message)),
        (user) => emit(ProfileState.loadedUser(user)));
  }
}
