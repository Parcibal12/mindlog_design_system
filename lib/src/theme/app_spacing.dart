import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  static const double xxxs = 2.0;

  static const double xxs = 4.0;

  static const double xs = 8.0;

  static const double sm = 12.0;

  static const double md = 16.0;

  static const double lg = 20.0;

  static const double xl = 24.0;

  static const double xxl = 32.0;

  static const double xxxl = 48.0;

  static const EdgeInsets insetsAllXs = EdgeInsets.all(xs);
  static const EdgeInsets insetsAllSm = EdgeInsets.all(sm);
  static const EdgeInsets insetsAllMd = EdgeInsets.all(md);
  static const EdgeInsets insetsAllLg = EdgeInsets.all(lg);
  static const EdgeInsets insetsAllXl = EdgeInsets.all(xl);

  static const EdgeInsets insetsHorizontalMd = EdgeInsets.symmetric(
    horizontal: md,
  );
  static const EdgeInsets insetsHorizontalLg = EdgeInsets.symmetric(
    horizontal: lg,
  );
}
