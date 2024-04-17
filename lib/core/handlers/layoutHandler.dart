import 'package:flutter/cupertino.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';

class LayoutHandler {
  final _smallPhones = 366;
  final _regularPhones = 1080;
// final _tablet = 1024;
  final BuildContext context;

  LayoutHandler(this.context);
  double valuesHandler(
      double regular, double small, double tablet, double landScape) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return landScape;
    }
    if (context.screenWidth > _regularPhones) {
      return tablet;
    }
    if (context.screenWidth <= _regularPhones &&
        context.screenWidth > _smallPhones) {
      return regular;
    }
    if (context.screenWidth <= _smallPhones) {
      return small;
    }

    return regular;
  }

  double mainHorizontalPadding() {
    return valuesHandler(16, 8, 70, 70);
  }
}
