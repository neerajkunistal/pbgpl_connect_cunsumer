import 'package:customer_connect/SplashPage.dart';
import 'package:customer_connect/utills/commonClass/singleton.dart';
import 'package:customer_connect/utills/res/app_theme.dart';
import 'package:customer_connect/utills/res/bloc_multi_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ExportFile/app_export_file.dart';


GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Root extends StatefulWidget {

  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Singleton.instance.setContext(context);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return blocMultiProvider(
      child: MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Connect',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: '/',
      routes: {
        '/second': (context) => SplashPage(),
      },
      builder: (context, child) {
        return MediaQuery (
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      home: SplashPage(),
    ));
  }
}