import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/feature/courses/presentation/manager/courseCubit.dart';
import 'package:nurse_space/feature/courses/presentation/pages/allCoursesView.dart';
import 'package:nurse_space/feature/search/data/data_sources/search_remote_data_source.dart';
import 'package:nurse_space/feature/search/data/repositories/search_repo.dart';
import 'package:nurse_space/feature/search/presentation/manager/search_cubit.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/textStyles.dart';

class CustomSearchBar extends StatelessWidget {


   CustomSearchBar({Key? key}) : super(key: key);

  bool call = true;
  @override
  Widget build(BuildContext context) {


    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    final TextEditingController searchTextEditingController = TextEditingController();


    return RepositoryProvider(
      create: (context) =>
          SearchRepo(searchRemoteDataSource: SearchRemoteDataSource()),


      child: BlocProvider(
        create: (context) =>
            SearchCubit(searchRepo: context.read<SearchRepo>()),
        child: Stack(


            children: [

              Column(
                children: [
                  Container(height: 25, color: AppColors.primary,),
                  Container(height: 40, color: AppColors.greyBackground,),
                ],
              ),

              Align(
                  alignment: AlignmentDirectional.center,


                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: LayoutHandler(context)
                            .mainHorizontalPadding()
                    ),

                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Theme(
                      data: ThemeData(
                          textSelectionTheme: TextSelectionThemeData(
                              selectionColor: Colors.grey.shade300,
                              cursorColor: AppColors.primary,
                              selectionHandleColor: AppColors.primary
                          )),

                      child: BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {

                          state.whenOrNull(
                            success: (search){

                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (context != null) {
                                  Future.delayed(Duration(seconds: 1),(){
                                    context.popUpPage(AllCoursesView(courses: search.courses));

                                  });


                                }
                              });


                            }
                          );


                          return TextField(
                            controller: searchTextEditingController,
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              hintText: appLocalizations.search,
                              hintStyle: TextStyles.hintStyle,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primary, width: 2),
                                borderRadius: BorderRadius.circular(25),

                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primary, width: 2),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              prefixIcon: Icon(
                                  Icons.menu, color: AppColors.accent),
                              suffixIcon: Icon(
                                  Icons.search, color: AppColors.accent),

                            ),
                            cursorColor: AppColors.primary,

                            onEditingComplete: () {

                              call = true;
                              if(call){
                                context.read<SearchCubit>().search(searchTextEditingController.text);
                                call = false;

                              }

                              print("calledddddd");
                             // FocusScope.of(context).unfocus();
                            },
                          );
                        },
                      ),
                    ),
                  )
              ),


            ]

        ),
      ),
    );
  }
}
