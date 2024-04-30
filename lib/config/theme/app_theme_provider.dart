import 'package:dashboard_app/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_provider.g.dart';

@riverpod
class AppTheme extends _$AppTheme {
  Color seedColor = const Color(0xFF01579B);

  AppTheme() {
    initialize();
  }
  @override
  ThemeData build() {
    return ThemeData(
      primaryColorDark: seedColor,
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      brightness: Brightness.light,
      listTileTheme: ListTileThemeData(
        iconColor: seedColor,
      ),
      // primaryColor: const Color(0xFF01579B), // azul oscuro
      scaffoldBackgroundColor: const Color(0xFFFFFFFF), // blanco
      appBarTheme: AppBarTheme(
        color: seedColor,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF00BCD4), // turquesa
      ),
    );
  }

  void setSeedColor(Color color) {
    seedColor = color;
    state = build();
  }

  Future<void> initialize() async {
    seedColor = await GeneralUtils.getColorTheme();
    state = build();
  }
}
