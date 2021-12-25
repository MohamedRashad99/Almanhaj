import 'package:almanhaj/config/bloc_observer.dart';
import 'package:almanhaj/local_storage/local_storage.dart';
import 'package:almanhaj/screens/home_screen/page/views/user_section_selected/cubit_show_subjects/show_subjects_cubit.dart';
import 'screens/home_screen/page/views/banner_slider/cubit/slider_cubit.dart';
import 'package:almanhaj/screens/student_class_select/cubit/stages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:queen_themes/queen_themes.dart';

import 'config/theme.dart';
import 'generated/tr.dart';
import 'screens/all_sections_notes/cubit/all_sections_notes_cubit.dart';
import 'screens/splash_screen/view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  await Nations.boot();
  await LocalStorage.boot();
  await QTheme.boot(ThemeConfig());
  runApp(NationsBuilder(builder: (context) {
    return const Almanhaj();
  }));
}

class Almanhaj extends StatelessWidget{
  const Almanhaj({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StagesCubit(),),
        BlocProvider(create: (context) => SliderCubit(),),


      ],
      child: GetMaterialApp(
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
      ),
    );
  }
}
