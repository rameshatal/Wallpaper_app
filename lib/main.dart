import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_131/api/api_helper.dart';
import 'package:wallpaper_app_131/screens/trending_wallpaper.dart';

import 'bloc/wallpaper_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WallpaperBloc(apiHelper: ApiHelper()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
