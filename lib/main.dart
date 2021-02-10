import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpapers_app/Bloc/categoryWallpaperBloc.dart';
import 'package:wallpapers_app/Bloc/wallpaperBloc.dart';

import 'Bloc/searchWallpaperBloc.dart';
import 'Screens/HomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WallpaperBloc(),
      child: BlocProvider(
        create: (context) => SearchWallpaperBloc(),
        child: BlocProvider(
          create: (context) => CategoryWallPaperBloc(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Awesome Wallpapers 2021',
            theme: ThemeData(
                brightness: Brightness.light,
                cardColor: Colors.white38,
                accentColor: Colors.black,
                cursorColor: Colors.black,
                dialogBackgroundColor: Colors.white,
                primaryColor: Colors.grey),

            home: MyHomePage('Awesome Wallpapers 2021'),
          ),
        ),
      ),
    );
  }
}