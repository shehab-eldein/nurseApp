import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/constant/imagesManager.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/feature/home/presentation/widget/viewAllRow.dart';

import '../../../../core/handlers/layoutHandler.dart';
import '../../../../core/language/presentation/manager/languageBloc.dart';
import '../../../../core/widgets/errorWidget.dart';
import '../../../professor/data/models/professor/professor.dart';
import '../../../professor/presentation/manager/professor_cubit.dart';
import '../../../professor/presentation/pages/professorsView.dart';
import '../../../professor/presentation/widgets/professorHomeCard.dart';
import 'homeShimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeProfessorContainer extends StatelessWidget {
  late LayoutHandler layoutHandler;
  late AppLocalizations appLocalizations;
  late String language;

  List<Professor> professorsList = [];

  HomeProfessorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    layoutHandler = LayoutHandler(context);
    appLocalizations = AppLocalizations.of(context)!;
    language = context.read<LanguageBloc>().state.languageCode;

    return Container(
      margin: EdgeInsets.only(top: 16),
      child: BlocBuilder<ProfessorCubit, ProfessorState>(
        builder: (context, state) {
          return state.when(loading: () {
            return const HomeShimmer();
          }, success: (profs) {
            professorsList = profs;
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: layoutHandler.mainHorizontalPadding()),
                  child: ViewAllRow(
                    title: appLocalizations.bestProfessor,
                    onViewAllTap: () {
                      context.popUpPage(ProfessorsView(
                        professors: professorsList,
                      ));
                    },
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 120,
                  child: ListView.builder(
                    itemCount: professorsList.length,

                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                          child: ProfessorHomeCard(
                            professor:  professorsList[index],
                          ));
                    },
                  ),
                ),
              ],
            );
          }, error: (e) {
            return CustomErrorWidget(errorMessage: e);
          });
        },
      ),
    );
  }
}
