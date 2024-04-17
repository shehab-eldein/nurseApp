import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/extensions/snackBar.dart';
import 'package:nurse_space/feature/places/data/data_sources/placesRemoteDataSource.dart';
import 'package:nurse_space/feature/places/data/repositories/placesRepo.dart';
import 'package:nurse_space/feature/places/presentation/manager/placesCubit.dart';
import 'package:nurse_space/feature/profile/data/data_sources/profile_remote_dataSource.dart';
import 'package:nurse_space/feature/profile/data/repositories/profile_repo.dart';
import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/imagesManager.dart';
import '../../../../core/handlers/ValidatorHandler.dart';
import '../../../../core/model/name_id_model/nameIdModel.dart';
import '../../../../core/model/user_model/user.dart';
import '../../../../core/widgets/actionButton.dart';
import '../../../../core/widgets/errorWidget.dart';
import '../../../../core/widgets/loader.dart';
import '../../../auth/presentation/widgets/authTextField.dart';
import '../../../auth/presentation/widgets/passTextField.dart';
import '../../../auth/presentation/widgets/phoneTextField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../places/presentation/widgets/placesBottomSheet.dart';
import '../manager/profile_cubit.dart';

class ProfileUpdateDataColumn extends StatefulWidget {
  final Function(User) onSubmit;

  final User user;

  ProfileUpdateDataColumn(
      {super.key, required this.onSubmit, required this.user});

  @override
  State<ProfileUpdateDataColumn> createState() =>
      _ProfileUpdateDataColumnState();
}

class _ProfileUpdateDataColumnState extends State<ProfileUpdateDataColumn> {
  late TextEditingController nameTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController passTextEditingController;
  late TextEditingController phoneTextEditingController;
  late ValidatorHandler validatorHandler;
  late AppLocalizations appLocalizations;
  late TextEditingController regionEditTextController;
  late TextEditingController universityEditTextController;
  int cityId = 0;
  int univeristyId = 0;
  @override
  void initState() {
    super.initState();

    nameTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    passTextEditingController = TextEditingController();
    phoneTextEditingController = TextEditingController();
    regionEditTextController = TextEditingController();
    universityEditTextController = TextEditingController();

    validatorHandler = ValidatorHandler(context);
    assignOldUser();
  }

  @override
  void dispose() {
    super.dispose();

    nameTextEditingController.dispose();
    emailTextEditingController.dispose();
    passTextEditingController.dispose();
    phoneTextEditingController.dispose();
    regionEditTextController.dispose();
    universityEditTextController.dispose();
  }

  void assignOldUser() {
    nameTextEditingController.text = widget.user.name;
    emailTextEditingController.text = widget.user.email;
    //todo get pass from backend
    passTextEditingController.text = widget.user.password ?? "no pass";
    phoneTextEditingController.text = widget.user.phone ?? "No phone";
    universityEditTextController.text = widget.user.university ?? "No univ";
    regionEditTextController.text = widget.user.city ?? "No city";
  }

  void showCustomBottomSheet<T>(
      BuildContext context, List<NameId> data, bool isCity) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return AuthBottomSheet(
          title: isCity ? appLocalizations.region : appLocalizations.university,
          dataList: data,
          onOptionSelected: (nameId) {
            if (isCity) {
              regionEditTextController.text = nameId.name;
              cityId = nameId.id;
            } else {
              universityEditTextController.text = nameId.name;
              univeristyId = nameId.id;
            }

            print("The Choice is ${nameId.name}");
          },
          selectedOption: isCity
              ? regionEditTextController.text
              : universityEditTextController.text,
        );
      },
    );
  }

  void validateInput(BuildContext buildContext) {
    final validateName =
        validatorHandler.validateName(nameTextEditingController.text.trim());
    final validatePass = validatorHandler
        .validatePassword(passTextEditingController.text.trim());
    final validateEmail =
        validatorHandler.validateEmail(emailTextEditingController.text.trim());
    final validatePhone =
        validatorHandler.validateNumber(phoneTextEditingController.text.trim());

    if (validateName != null) {
      buildContext.showCustomSnackBar(
        text: validateName,
      );
      return;
    }
    if (validateEmail != null) {
      buildContext.showCustomSnackBar(
        text: validateEmail,
      );
      return;
    }

    if (validatePass != null) {
      buildContext.showCustomSnackBar(
        text: validatePass,
      );
      return;
    }
    if (validatePhone != null) {
      buildContext.showCustomSnackBar(
        text: validatePhone,
      );
      return;
    }

    widget.onSubmit(User(
        id: 27,
        name: nameTextEditingController.text,
        email: emailTextEditingController.text,
        password: passTextEditingController.text,
        phone: phoneTextEditingController.text,
        universityId: univeristyId,
        cityId: cityId));
  }

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ProfileRepo>(
            create: (context) =>
                ProfileRepo(profileRemoteDataSource: ProfileRemoteDataSource()),
          ),
          RepositoryProvider<PlacesRepo>(
            create: (context) =>
                PlacesRepo(placesRemoteDataSource: PlacesRemoteDataSource()),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ProfileCubit>(
                create: (context) =>
                    ProfileCubit(profileRepo: context.read<ProfileRepo>())),
            BlocProvider<PlacesCubit>(
                create: (context) =>
                    PlacesCubit(placesRepo: context.read<PlacesRepo>())),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AuthTextField(
                labelText: "الاسم",
                obscureText: false,
                hintText: "من فضلك ادخل الاسم هنا",
                controller: nameTextEditingController,
              ),
              const SizedBox(
                height: 16,
              ),
              AuthTextField(
                labelText: "البريد الإلكتروني",
                obscureText: false,
                hintText: "من فضلك ادخل البريد الإلكتروني هنا",
                controller: emailTextEditingController,
              ),
              const SizedBox(
                height: 16,
              ),
              PassTextField(
                labelText: "كلمة المرور",
                controller: passTextEditingController,
              ),
              const SizedBox(
                height: 16,
              ),
              PhoneTextField(
                labelText: "رقم الجوال",
                controller: phoneTextEditingController,
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<PlacesCubit, PlacesState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      AuthTextField(
                        labelText: appLocalizations.region,
                        readOnly: true,
                        controller: regionEditTextController,
                        obscureText: false,
                        hintText: "من فضلك اختر المدينة التي تدرس بها",
                        onTape: () {
                          context.read<PlacesCubit>().getCityList();
                          print("Tapped");

                          if (state is LoadedCity) {
                            print("enter Succcccccccc");
                            showCustomBottomSheet(
                                context,
                                state.cities.map((city) {
                                  return NameId(
                                      id: city.id ?? 0,
                                      name: city.city ?? "No city name");
                                }).toList(),
                                true);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AuthTextField(
                        labelText: appLocalizations.university,
                        obscureText: false,
                        hintText: "من فضلك اختر الجامعة التي تدرس بها",
                        controller: universityEditTextController,
                        readOnly: true,
                        onTape: () {
                          context.read<PlacesCubit>().getUniversityList();
                          if (state is LoadedUniviristies) {
                            showCustomBottomSheet(
                                context,
                                state.universities.map((university) {
                                  return NameId(
                                      id: university.id ?? 0,
                                      name: university.name ??
                                          "No university name");
                                }).toList(),
                                false);
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 70,
              ),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  state.when(
                      loading: () {
                        return Loader();
                      },
                      loadedUser: (user) {},
                      error: (e) {
                        return CustomErrorWidget(
                          errorMessage: e,
                        );
                      });

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ActionButton(
                            text: appLocalizations.save,
                            textColor: AppColors.primary,
                            buttonColor: AppColors.accent,
                            borderColor: AppColors.accent,
                            onTap: () => validateInput(context)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ActionButton(
                            text: appLocalizations.cancel,
                            textColor: AppColors.primary,
                            buttonColor: AppColors.greyBackground,
                            borderColor: AppColors.primary,
                            onTap: () => Navigator.pop(context)),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }
}
