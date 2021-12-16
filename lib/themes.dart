import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

ThemeData light(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: const Color(0xFFF9F9F9),
      primaryTextTheme: Theme.of(context).textTheme.apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ),
      cardTheme: const CardTheme(
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(kDefaultRadius),
            side: BorderSide(width: 1, color: Colors.black12)
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
          errorStyle: GoogleFonts.lato(fontSize: 11, color: Colors.red)
      ),
      textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      accentTextTheme: GoogleFonts.latoTextTheme(Theme.of(context).accentTextTheme),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              primary: Colors.white,
              onSurface: Colors.black,
              side: Divider.createBorderSide(context, color: Colors.black12, width: 0.5),
              padding: const EdgeInsets.symmetric(
                  vertical: 12
              ),
              textStyle: AppTypography.button.copyWith(
                  color: Colors.black,
                  fontSize: 19,
                  height: 22/19
              )
          )
      ),
      appBarTheme: AppBarTheme(
          elevation: 1,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          textTheme: ThemeData().textTheme.copyWith(
            headline6: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black87, height: 1.5),
          ),
          iconTheme: const IconThemeData(
              color: Colors.black
          ),
          actionsIconTheme: const IconThemeData(
              color: Colors.black
          )
      ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: kPadding[4],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
        ),
        primary: const Color(0xff6342E8),
        onPrimary: Colors.white,
        textStyle: AppTypography.smallButton
    ),)
  );
}

ThemeData dark(BuildContext context) {
  return ThemeData.dark();
}
