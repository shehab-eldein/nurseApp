import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../enums/navBarItem.dart';



class NavigationState<T> extends Equatable {
  final NavbarItem navbarItem;
  final int index;
  final T data;

  NavigationState(this.navbarItem, this.index,this.data);

  @override
  List<Object> get props => [this.navbarItem, this.index];
}