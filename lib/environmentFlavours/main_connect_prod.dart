import 'package:customer_connect/localDataBase/shared_preferences_utils.dart';
import 'package:customer_connect/root.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:customer_connect/utills/res/environment_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtils.getInstance();
  await UserInfo.instanceInit();
/*  await FirebaseService.instance.initializeService();*/
/*  AppColor(themeColor: 0xFF165dA7, themeLightColor: 0xFF3688DD);*/
  var configuredApp = const EnvironmentConfig(
      flavours: EnvironmentFlavours.productionPBGPL,
      child: Root()
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(configuredApp);
}
