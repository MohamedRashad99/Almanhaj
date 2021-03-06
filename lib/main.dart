import 'package:almanhaj/config/bloc_observer.dart';
import 'package:almanhaj/local_storage/local_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'screens/home_screen/page/views/banner_slider/cubit/slider_cubit.dart';
import 'screens/student_class_select/cubit/stages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:queen_themes/queen_themes.dart';
import 'config/theme.dart';
import 'generated/tr.dart';
import 'screens/splash_screen/view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
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
