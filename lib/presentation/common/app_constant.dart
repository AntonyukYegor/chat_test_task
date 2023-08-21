import 'package:flutter/widgets.dart';

class AppConstants {
  AppConstants._();

  static BorderRadius incomingBubbleBorder = const BorderRadius.only(
    topLeft: Radius.circular(incomingBubbleBorderRadiusValue),
    topRight: Radius.circular(incomingBubbleBorderRadiusValue),
    bottomRight: Radius.circular(incomingBubbleBorderRadiusValue),
  );

  static const double incomingBubbleBorderRadiusValue = 25;

  static const double outcomingBubbleBorderRadius = 15;

  static const double messageInputFieldBorderRadius = 32;
}
