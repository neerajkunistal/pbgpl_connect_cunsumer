import 'dart:async';

import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/preshantation/page/dashboard.dart';
import 'package:customer_connect/features/login/domain/bloc/login_bloc.dart';
import 'package:customer_connect/features/login/domain/bloc/login_event.dart';
import 'package:customer_connect/features/login/presentation/pages/login_page.dart';
import 'package:customer_connect/utills/global_constant.dart';
import 'package:customer_connect/utills/res/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SharedPreferences? pref;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColor.white,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
        extendBody: true,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: Image(
                  image: AssetImage(
                'assets/images/logo.png',
              )),
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    onDoneLoading();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    String userName =  await SharedPreferencesUtils.getString(key: PreferencesName.userName);
    String password =  await SharedPreferencesUtils.getString(key: PreferencesName.password);

    if (userName.isNotEmpty && password.isEmpty) {
/*      BlocProvider.of<LoginBloc>(context).add(LoginSetBpNumberEvent(bpNumber: userName, context: context, isLoginPage: false));
      BlocProvider.of<LoginBloc>(context).add(LoginSubmitDataEvent(isLoginPage: false, context: context));*/
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginView()));
    }
     else if (userName.isNotEmpty && password.isNotEmpty) {
      BlocProvider.of<LoginBloc>(context).add(LoginSetBpNumberEvent(bpNumber: userName, context: context, isLoginPage: false));
      BlocProvider.of<LoginBloc>(context).add(LoginSetPasswordEvent(password: password));
      BlocProvider.of<LoginBloc>(context).add(LoginSubmitDataEvent(isLoginPage: false, context: context));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginView()));
    }
  }
}
