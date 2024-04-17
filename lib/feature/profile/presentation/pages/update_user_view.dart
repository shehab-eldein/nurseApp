import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/feature/categories/presentation/manager/categoriesCubit.dart';
import 'package:nurse_space/feature/profile/data/data_sources/profile_remote_dataSource.dart';
import 'package:nurse_space/feature/profile/data/repositories/profile_repo.dart';
import 'package:nurse_space/feature/profile/presentation/widgets/image_contanier.dart';
import 'package:nurse_space/feature/profile/presentation/widgets/profile_update_data_Column.dart';
import '../../../../core/constant/imagesManager.dart';
import '../../../../core/enums/navBarItem.dart';
import '../../../../core/handlers/layoutHandler.dart';
import '../../../../core/model/user_model/user.dart';
import '../../../../core/navigation/navigationCubit.dart';
import '../../../../core/widgets/titleBackAppBar.dart';
import '../../di/profile_service.dart';
import '../manager/profile_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateUserView extends StatelessWidget {
  const UpdateUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    String? imgBinary;

    return RepositoryProvider(
      create: (context) =>
          ProfileRepo(profileRemoteDataSource: ProfileRemoteDataSource()),
      child: BlocProvider(
        create: (context) =>
            ProfileCubit(profileRepo: context.read<ProfileRepo>()),
        child: Scaffold(
          backgroundColor: AppColors.greyBackground,
          appBar: TitleBackAppBar(
            title: appLocalizations.editInfo,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ImageContainer(onSubmit: (imgPath) {
                  imgBinary = imgPath;
                },),
                BlocListener<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                   if (state is Success){
                     BlocProvider.of<NavigationCubit>(context)
                         .getNavBarItem(
                         NavbarItem.home,null);
                   }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: LayoutHandler(context)
                            .mainHorizontalPadding()),

                    child: ProfileUpdateDataColumn(


                      user: User(
                        name: "Test update app22",
                        phone: "123456789",
                        password: "0000000",
                        city: "cit",
                        university: "uni",
                        id: 27,
                        email: "test@up.com",
                        roles: [2],


                      ),
                      onSubmit: (newUserData) {
                        print(context);

                        ProfileCubit(profileRepo: ProfileRepo(
                            profileRemoteDataSource: ProfileRemoteDataSource()))
                            .updateUser(user:
                        User(
                            id: newUserData.id,
                            name: newUserData.name,
                            email: newUserData.email,
                            password: newUserData.password,
                            phone: newUserData.phone,
                            roles: [0],
                            userType: "Type",
                            universityId: newUserData.universityId,
                            cityId: newUserData.cityId,
                            photo: imgBinary


                        ));


                        Navigator.pop(context);
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavBarItem(
                            NavbarItem.home,null);
                      },

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

