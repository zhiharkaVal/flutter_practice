import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 12, 97, 112),
  dynamicSchemeVariant: DynamicSchemeVariant.fidelity
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 1, 49, 32),
  dynamicSchemeVariant: DynamicSchemeVariant.neutral
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: AppBarTheme().copyWith(
            foregroundColor: kDarkColorScheme.primary,
            backgroundColor: kDarkColorScheme.onPrimary
        ),
        cardTheme: CardThemeData().copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
            )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15
          )
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary
        ),
        cardTheme: CardThemeData().copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15
          )
        )
      ),
      // To force theme mode, by default it takes theme mode of the system
      // themeMode: ThemeMode.dark,
      home: Expenses(),
    ),
  );
}