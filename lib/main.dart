import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:queen_themes/queen_themes.dart';

import 'config/theme.dart';
import 'generated/tr.dart';
import 'screens/splash_screen/view.dart';

Future<void> main() async {
  await Nations.boot();

  await QTheme.boot(ThemeConfig());
  runApp(NationsBuilder(builder: (context) {
    return const Almanhaj();
  }));
}

class Almanhaj extends StatelessWidget {
  const Almanhaj({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        // TODo:: This Not Fair
        return Directionality(
          textDirection: TextDirection.ltr,
          child: child ?? const SizedBox(),
        );
      },
      locale: Nations.locale,
      localizationsDelegates: Nations.delegates,
      supportedLocales: Nations.supportedLocales,
      theme: QTheme.current,
      home: const SplashScreen(),
    );
  }
}
