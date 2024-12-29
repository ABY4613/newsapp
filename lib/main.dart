// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:newsapp/controller/news_controller.dart';
import 'package:newsapp/view/splash_screen/splash_screen.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()

 {
  //  SharedPreferences prefs = await SharedPreferences.getInstance();
  // String? username = prefs.getString('username');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //  final String? username;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home:
        SplashScreen()
        ),
    );
            
  }
}
