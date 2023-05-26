import 'package:flutter/material.dart';

class UIHelper {
  static const double _verticalExtraSmall = 4.0;
  static const double _verticaleSmall = 8.0;
  static const double _verticalMedium = 16.0;
  static const double _verticalLarge = 24.0;
  static const double _verticalExtraLarge = 42;
  //--
  static const double _horizontalExtraSmall = 4.0;
  static const double _horizontalSmall = 8.0;
  static const double _horizontalMedium = 16.0;
  static const double _horizontalLarge = 24.0;
  static const double _horizontalExtraLarge = 32.0;

  //--
  static SizedBox verticalSpace(double height) => SizedBox(height: height);
  static SizedBox horizontalSpace(double width) => SizedBox(width: width);

  //--Vertical
  static SizedBox verticalSpaceExtraSmall() =>
      verticalSpace(_verticalExtraSmall);
  static SizedBox verticalSpaceSmall() => verticalSpace(_verticaleSmall);
  static SizedBox verticalSpaceMedium() => verticalSpace(_verticalMedium);
  static SizedBox verticalSpaceLarge() => verticalSpace(_verticalLarge);
  static SizedBox verticalSpaceExtraLarge() =>
      verticalSpace(_verticalExtraLarge);

  //--Horizontal
  static SizedBox horizontalSpaceExtraSmall() =>
      horizontalSpace(_horizontalExtraSmall);
  static SizedBox horizontalSpaceSmall() => horizontalSpace(_horizontalSmall);
  static SizedBox horizontalSpaceMedium() => horizontalSpace(_horizontalMedium);
  static SizedBox horizontalSpaceLarge() => horizontalSpace(_horizontalLarge);
  static SizedBox horizontalSpaceExtraLarge() =>
      horizontalSpace(_horizontalExtraLarge);
}
