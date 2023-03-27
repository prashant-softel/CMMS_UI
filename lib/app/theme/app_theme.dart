import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

ThemeData themeData(BuildContext context) => ThemeData(
      // primarySwatch: Colors.black,
      shadowColor: const Color(0xFFDDE3FD),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(23, 166, 221, 1))),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
      primaryColor: const Color.fromRGBO(23, 166, 221, 1),
      secondaryHeaderColor: const Color.fromRGBO(23, 166, 221, 1),
      fontFamily: 'Poppins',
      textTheme: TextTheme(
        displaySmall: TextStyle(
          color: Colors.white,
        ),
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorValues.whiteColor,
      colorScheme: ColorScheme.light(
        surface: Colors.black.withOpacity(.16),
        onInverseSurface: const Color.fromRGBO(0, 0, 0, 0.12),
        primary: const Color.fromRGBO(23, 166, 221, 1),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),

      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.grey,
        hintStyle: TextStyle(
          color: Theme.of(context).hintColor.withOpacity(.3),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 209, 209, 209),
            width: 1.5,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
          borderSide: BorderSide(
            color: Color.fromRGBO(23, 166, 221, .4),
            width: 1.5,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
          borderSide: BorderSide(
            color: Color.fromRGBO(240, 151, 149, 1),
            width: 1.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
          borderSide: BorderSide(
            color: Color.fromRGBO(23, 166, 221, .8),
            width: 1.5,
          ),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromRGBO(23, 166, 221, 1)),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.black,
      ),
    );

ThemeData darkThemeData(BuildContext context) => ThemeData(
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromRGBO(23, 166, 221, 1)),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        displaySmall: TextStyle(
          color: Colors.black,
        ),
      ),
      secondaryHeaderColor: const Color.fromRGBO(23, 166, 221, 1),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      primaryColor: const Color(0xFFF31B82),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
      ),
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        surface: Colors.white.withOpacity(.16),
        primary: const Color.fromRGBO(23, 166, 221, 1),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.grey,
        hintStyle: TextStyle(
          color: Theme.of(context).hintColor.withOpacity(.3),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 209, 209, 209),
            width: 1.5,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 209, 209, 209),
            width: 1.5,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
          borderSide: BorderSide(
            color: Color.fromRGBO(240, 151, 149, 1),
            width: 1.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(30, 27, 83, 244),
            width: 1.5,
          ),
        ),
      ),
      scaffoldBackgroundColor: Colors.black,
      fontFamily: 'Poppins',
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white,
      ),
    );
