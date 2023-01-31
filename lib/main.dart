import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:biztore/screen/home/home_screen.dart';
import 'package:biztore/screen/onboarding/onboard_screen.dart';
import 'package:biztore/screen/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'components/routes.dart';
import 'components/themes.dart';
import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';
import 'network/sqlite_data/cubit.dart';
import 'network/sqlite_data/states.dart';

void main() async {
    //start check Token, OnBoarding, and theme switcher
    WidgetsFlutterBinding.ensureInitialized();
    DioHelper.init();
    await CacheHelper.init();
    Widget widget;
    String? token = CacheHelper.getData(key: 'token');
    bool? isDarkMode = CacheHelper.getData(key: 'isDarkMode');
    bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
    if (onBoarding != null) {
      if (token != null) {
        widget = HomeScreen();
      } else {
        widget = const OnboardScreen();
      }
    } else {
      widget = const OnboardScreen();
    }
    //end theme switcher
  runApp(MyApp(isDarkMode, widget, token));
}


class MyApp extends StatefulWidget {
  bool? isDarkMode;
  final Widget startWidget;
  String? token;
  MyApp(this.isDarkMode, this.startWidget, token, {Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  Widget openPopUp() {
    return PopupMenuButton(
      itemBuilder: (context) {
        return List.generate(3, (index) => const PopupMenuItem(
          child: Text('Setting'),
        )
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..changeAppMode(fromShared: widget.isDarkMode,),
          ),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: AppCubit.get(context).isDarkMode ? ThemeMode.dark : ThemeMode.light,
                home: AnimatedSplashScreen(
                  splash: const SplashScreen(),
                  nextScreen: widget.startWidget,
                  splashIconSize: 300,
                  animationDuration: const Duration(milliseconds: 700),
                  splashTransition: SplashTransition.fadeTransition,
                ),
                routes: Routes.getRoute(),
                darkTheme: MyTheme.darkTheme,
                theme: MyTheme.lightTheme,
              );
            }
        )
    );
  }
}

