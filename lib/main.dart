import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) await DesktopWindow.setMinWindowSize(Size(300, 300));
  if (Platform.isMacOS) await DesktopWindow.setMinWindowSize(Size(300, 300));
  BlocOverrides.runZoned(
    () async {
      DioHelper.init();
      await CacheHelper.init();
      bool deffoultMode = false;
      late bool? isDark = CacheHelper.getBool(key: 'isDark');
      runApp(MyApp(isDark == null ? deffoultMode : isDark));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  late bool isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()
            ..getBusiness()
            ..changeThemMode(fromShared: isDark),
        ),
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch:
                    Colors.deepOrange, // for circulerProgressIndecator
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    height: 1,
                    fontSize: 24,
                  ),
                  actionsIconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Colors.white,
                  elevation: 20,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch:
                    Colors.deepOrange, // for circulerProgressIndecator
                scaffoldBackgroundColor: HexColor("333739"),
                appBarTheme: AppBarTheme(
                  backgroundColor: HexColor("333739"),
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  actionsIconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor("333739"),
                    statusBarIconBrightness: Brightness.light,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: HexColor("333739"),
                  elevation: 20,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              themeMode: NewsCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: NewsLayout(),
            );
          }),
    );
  }
}
