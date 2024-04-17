import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/extensions/snackBar.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/widgets/loader.dart';
import 'package:nurse_space/feature/categories/presentation/manager/categoriesCubit.dart';
import 'package:nurse_space/feature/courses/presentation/manager/courseCubit.dart';

import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/imagesManager.dart';
import '../../../../core/constant/textStyles.dart';
import '../../../../core/language/presentation/manager/languageBloc.dart';
import '../../../../core/widgets/errorWidget.dart';
import '../../../../core/widgets/typeCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../search/presentation/widgets/searchBar.dart';

class CategoriesView extends StatelessWidget {


  CategoriesView({Key? key}) : super(key: key);

  late LayoutHandler layoutHandler;
  late AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    layoutHandler = LayoutHandler(context);
    appLocalizations = AppLocalizations.of(context)!;
    context.read<CategoriesCubit>().getAllCategories();
    print("SEction Enter the treeee");
     final langBloc = context.read<LanguageBloc>().state.languageCode;
     print("----------");
     print(langBloc);


    return Scaffold(
      backgroundColor: AppColors.greyBackground,

      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSearchBar(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: layoutHandler.mainHorizontalPadding()
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(appLocalizations.sections,
                  style: TextStyles.font18TxtBlack500,

                ),
                SizedBox(height: 16,),
                Container(
                  height: layoutHandler.valuesHandler(
                      context.screenHeight * 0.6,
                      context.screenHeight * 0.5,
                      context.screenHeight * 0.7,
                      context.screenHeight * 0.3),
                  child: BlocBuilder<CategoriesCubit, CategoriesState>(
                    builder: (context, state) {

                      return state.when(
                          loading: () {
                            return const Loader();

                          },
                          success: (categories) {
                            return GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // Number of columns
                                crossAxisSpacing: 16.0, // Spacing between columns
                                mainAxisSpacing: 16.0, // Spacing between rows
                              ),
                              itemCount: categories.length, // Total number of items
                              itemBuilder: (context, index) {
                                // Your item widget goes here
                                return TypeCard(
                                  image:  Image(
                                    image:  CachedNetworkImageProvider(categories[index].media[0].preview ?? ""),
                                    height: 80,
                                    width: double.infinity,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  title:  langBloc == "ar" ?categories[index].name['ar']?? "" :
                                  categories[index].name['en']  ?? "",
                                  width: 115,
                                  height: 115,
                                  radius: 10,
                                  onTap: (){

                                  },
                                );
                              },
                            );
                          },
                          error: (e){

                            return CustomErrorWidget(errorMessage: e);

                          });


                    },
                  ),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}
