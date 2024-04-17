import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/feature/home/presentation/widget/viewAllRow.dart';

import '../../../../core/enums/navBarItem.dart';
import '../../../../core/language/presentation/manager/languageBloc.dart';
import '../../../../core/navigation/navigationCubit.dart';
import '../../../../core/widgets/typeCard.dart';
import '../../../categories/data/models/category/category.dart';
import '../../../categories/presentation/manager/categoriesCubit.dart';
import 'homeShimmer.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeCategoriesContainer extends StatelessWidget {
   HomeCategoriesContainer({super.key});

  late LayoutHandler layoutHandler;
  late AppLocalizations appLocalizations;
  late String language;

   List<CategoryOfCourse> categoriesList = [];

   @override
  Widget build(BuildContext context) {

    layoutHandler = LayoutHandler(context);
    appLocalizations = AppLocalizations.of(context)!;
 language = context.read<LanguageBloc>().state.languageCode;

    return  Container(
      height: 150,
      margin: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              return state.when(
                loading: () {
                  return HomeShimmer();
                },
                success: (cat) {
                  categoriesList = cat;
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            layoutHandler.mainHorizontalPadding()),
                        child: ViewAllRow(
                          title: appLocalizations.sections,
                          onViewAllTap: () {
                            BlocProvider.of<NavigationCubit>(context)
                                .getNavBarItem(NavbarItem.sections,
                                categoriesList);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 100,
                        child: ListView.builder(
                          itemCount: categoriesList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              child: TypeCard(
                                // Image.asset(ImagesManager.nurse)
                                image: Image(
                                  image: CachedNetworkImageProvider(
                                    categoriesList[index]
                                        .media[0]
                                        .preview ??
                                        "",
                                  ),
                                  width: 110,
                                  height: 50,
                                  fit: BoxFit.fitHeight,
                                ),
                                title: language == "ar"
                                    ? categoriesList[index]
                                    .name['ar'] ??
                                    ""
                                    : categoriesList[index]
                                    .name['en'] ??
                                    "",
                                width: 110,
                                height: 70,
                                textHeight: 20,
                                radius: 8,
                                onTap: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
                error: (e) {
                  // return CustomErrorWidget(errorMessage: e);
                  return SizedBox();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
