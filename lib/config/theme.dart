// * # Q U E E N  👑
import 'package:flutter/material.dart';
import 'package:queen_themes/queen_themes.dart';

class ThemeConfig extends QThemeConfig {
  @override
  List<ThemeData> get themes => [
        ThemeData.dark(),
        ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.red),
        ThemeData.light(),
      ];
}
