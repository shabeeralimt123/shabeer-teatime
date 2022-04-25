import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teatime/models/branch.dart';
import 'package:teatime/resources/theme_resources.dart';
import 'package:teatime/screens/branch_screen.dart';
import 'package:teatime/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static route()=>MaterialPageRoute(builder: (context)=>
      SplashScreen());
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    goToHome();
  }
  
  goToHome() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String branch = preferences.getString("BRANCH");
    if(branch!=null){
      Navigator.pushAndRemoveUntil(context, HomeScreen.route(BranchModel.fromJson(json.decode(branch))), (route) => false);
    }else{
      Navigator.pushAndRemoveUntil(context, BranchScreen.route(), (route) => false);
    }
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageResources.loginBg,
                ),
                fit: BoxFit.cover,
                colorFilter:
                ColorFilter.mode(Colors.black38, BlendMode.darken,),),),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * .6,
            child: Container(
              child: Center(
                child: Image.asset(
                  ImageResources.logo,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
