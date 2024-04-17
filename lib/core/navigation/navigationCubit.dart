import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../enums/navBarItem.dart';
import 'navigationState.dart';



class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.home, 0,null));

  void getNavBarItem<T>(NavbarItem navbarItem, T data) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavigationState(NavbarItem.home, 0,data));
        break;
      case NavbarItem.sections:
        emit(NavigationState(NavbarItem.sections, 1,data));
        break;
      case NavbarItem.courses:
        emit(NavigationState(NavbarItem.courses, 2,data));
        break;
      case NavbarItem.evaluation:
        emit(NavigationState(NavbarItem.evaluation, 3,data));
        break;
        case NavbarItem.profile:
        emit(NavigationState(NavbarItem.profile, 4,data));
        break;
    }
  }
}