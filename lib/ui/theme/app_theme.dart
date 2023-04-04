import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/global.dart';

class AppTheme {
  static Color primaryColor = const Color.fromRGBO(172, 30, 35, 1);
  static Color primaryColorOpacity = const Color.fromARGB(255, 215, 101, 105);
  static Color secondColor = globalIsDarkSelected
      ? const Color.fromRGBO(245, 245, 245, 1)
      : const Color.fromRGBO(89, 89, 89, 1);
  static Color backgorundColor = globalIsDarkSelected
      ? const Color.fromRGBO(26, 26, 26, 1)
      : const Color.fromRGBO(245, 245, 245, 1);
  static Color textFieldColor = globalIsDarkSelected
      ? const Color.fromRGBO(245, 245, 245, 1)
      : const Color.fromRGBO(26, 26, 26, 1);
  static Color succesulColor = const Color.fromRGBO(102, 187, 106, 1);
  static Color errorColor = const Color.fromRGBO(229, 115, 115, 1);
  static Color alertColor = const Color.fromRGBO(255, 202, 40, 1);
  static Color itemMenuColor = globalIsDarkSelected
      ? const Color.fromRGBO(245, 245, 245, 1)
      : const Color.fromRGBO(89, 89, 89, 1);
  static Color itemMenuSelectedColor = const Color.fromRGBO(172, 30, 35, 1);
  static Color cardColor = globalIsDarkSelected
      ? const Color.fromRGBO(40, 40, 40, 1)
      : const Color.fromRGBO(245, 245, 245, 1);
  static Color textColor = globalIsDarkSelected
      ? const Color.fromRGBO(175, 175, 175, 1)
      : const Color.fromARGB(255, 60, 60, 60);

  static final ThemeData theme = ThemeData.light().copyWith(
      //Definir el color primario de la aplicacion
      primaryColor: primaryColor,

      //Definir el diseño de todos los AppBars
      appBarTheme: AppBarTheme(
        foregroundColor: secondColor,
        color: backgorundColor,
        elevation: 5,
      ),

      //Definir el diseño de todos los botones
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: backgorundColor,
          foregroundColor: secondColor,
        ),
      ),

      //Definir el diseño para todos los botones flotantes
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor, elevation: 10),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: textFieldColor,
          foregroundColor: textColor,
          disabledBackgroundColor: Colors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        disabledColor: Colors.grey,
        buttonColor: Colors.black,
      ),

      //Definir el estilo para todos los inputs
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: textFieldColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textFieldColor),
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textFieldColor),
          borderRadius: const BorderRadius.all(Radius.circular(1)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
          borderRadius: const BorderRadius.all(Radius.circular(1)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
          borderRadius: const BorderRadius.all(Radius.circular(1)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: textFieldColor),
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
      ),

      //definir el color del fondo de pantalla
      scaffoldBackgroundColor: backgorundColor,
      //definir el tipo de letra para toda la aplicacion

      textTheme:
          GoogleFonts.getTextTheme('Poppins').apply(bodyColor: textColor),
      cardTheme: CardTheme(
        elevation: 10,
        color: cardColor,
      ));
}
