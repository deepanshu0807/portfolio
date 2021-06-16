import 'package:flutter/material.dart';
import 'package:my_portfolio/presentation/utils/utility.dart';

//Decorations related

const kPadding20 = EdgeInsets.all(20);
const kPadding10 = EdgeInsets.all(10);
final kBorderR20 = BorderRadius.circular(20);
final kBorderR15 = BorderRadius.circular(15);
final kBorderR10 = BorderRadius.circular(10);
final kRoundedShape = RoundedRectangleBorder(borderRadius: kBorderR20);
const kIconSize = 35.0;
final kColorTween12 = ColorTween(begin: Colors.grey, end: Colors.black);

BoxDecoration containerDecoration(Color color) {
  return BoxDecoration(borderRadius: kBorderR15, color: color, boxShadow: [
    BoxShadow(
      color: AppColors.secondaryColor.withOpacity(0.4),
      spreadRadius: 30,
      blurRadius: 5,
    )
  ]);
}

double designFactor(Size screenSize) {
  return screenSize.width / 375.0;
}
