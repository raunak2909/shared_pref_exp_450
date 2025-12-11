import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref_exp_450/home_page.dart';
import 'package:shared_pref_exp_450/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 4), () async{

      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLogin = prefs.getBool("login") ?? false;

      Widget nextPage = LoginPage();

      if(isLogin){
        nextPage = HomePage();
      }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => nextPage,));

    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 200,),
            SizedBox(
              height: 11,
            ),
            Text('Classico', style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }
}
