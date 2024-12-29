
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newsapp/utils/colors_const.dart';
import 'package:newsapp/view/login_screen/login_screen.dart';


import 'package:shared_preferences/shared_preferences.dart';


class SignoutScreen extends StatefulWidget {
  const SignoutScreen({super.key});

  @override
  State<SignoutScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<SignoutScreen> {
    int selectindex=0;

  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
      
     appBar: AppBar(title: Text("home screen"),),
     body:  Column(
       children: [
       // Text("$saved")
        ElevatedButton(
          style:  ElevatedButton.styleFrom(
            backgroundColor:ColorConstants.PRIMARY
                      ),
                  onPressed: () async { 
                    SharedPreferences prefs=await SharedPreferences.getInstance();
                    await prefs.remove('username');
                    await prefs.remove('password');
                   Navigator.pushReplacement( 
                      context,
                      MaterialPageRoute(
                        builder:  (context) => LoginScreen(),)
                       );
                },
                 child: Text("Logout")),
       ],
     ),
    );
  }
}