import 'dart:async';
import 'package:customer_connect/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:customer_connect/utills/global_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Views/dashboard.dart';
import 'Views/login_screen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  SharedPreferences? pref;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.lightBlueAccent,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
        extendBody: true,
        body: SafeArea(
          child : Center(
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: Image(image: AssetImage('assets/images/logo.png',)),
            ),
          ),
        ));
  }
  @override
  void initState() {
    super.initState();
    loadData();
  }
  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 3), onDoneLoading);
  }
    onDoneLoading() async {
    pref = await SharedPreferences.getInstance();
    if (pref!.getBool(GlobalConstants.isUserLogIn) != null) {
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BillAmountDashboard()));
    } else {
         Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginView()));
    }
  }
}
