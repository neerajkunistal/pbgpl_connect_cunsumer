import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import './dashboard.dart';
import 'dart:io' show Platform, exit;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/utills/global_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service/api_server.dart';
import '../utills/common_widget/custom_toast.dart';
import '../utills/login_customt_text_field.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController bpNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final Connectivity _connectivity = Connectivity();
  final formKey = GlobalKey<FormState>();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;


  Rect? rect;
  bool isLoading = false;
  bool canProceed = true;
  bool isOffline = false;
  bool dialogIsVisible = false;
  bool passwordVisible = true;

  LoginRequestModel? loginRequestModel;
  ApiIntegration? service;

  @override
  void initState() {
    service = ApiIntegration();
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  @override
  void dispose() {
    bpNumberController.dispose();
    _connectivitySubscription!.cancel();
    super.dispose();
  }
  Future callApi() async {
    if(checkValidation()) {
      setState(() {
        isLoading = true;
      });
     /* loginRequestModel = LoginRequestModel(
          bp_number:bpNumberController.text.toString(),
          mobile_number:passwordController.text.toString(),
          schema: "sonipat"
      );*/
      loginRequestModel = LoginRequestModel(
        bpNumber:bpNumberController.text.toString(),
        password:passwordController.text.toString(),

      );
      var responce = await service!.login(loginRequestModel!);
      if(responce != null) {
        setState(() {
          isLoading = false;
        });
        CustomToast.showToast(responce.messages.toString());
        print(responce.messages);
        SharedPreferences prefs = await SharedPreferences.getInstance();
     /*   prefs.setString(GlobalConstants.dmaId, responce.user.dmaId.toString());
        prefs.setString(GlobalConstants.token, responce.token.toString());
        prefs.setString(GlobalConstants.bpNumber,responce.user.bpNumber.toString());
        prefs.setString(GlobalConstants.meterSerialNumber,responce.user.serialNumber.toString());
        prefs.setString(GlobalConstants.crn,responce.user.crn.toString());
        prefs.setString(GlobalConstants.username,responce.user.name);
        prefs.setString(GlobalConstants.schema, responce.user.schema);
        prefs.setString(GlobalConstants.email, responce.user.email);
        prefs.setString(GlobalConstants.mobileNumber, responce.user.mobileNumber);
        prefs.setString(GlobalConstants.address, responce.user.address);
        prefs.setString(GlobalConstants.pinCode, responce.user.pincode);
        prefs.setString(GlobalConstants.town, responce.user.town);
        prefs.setString(GlobalConstants.locality, responce.user.locality);
        prefs.setString(GlobalConstants.states, responce.user.states!);
        prefs.setString(GlobalConstants.dmaId, responce.user.dmaId);
        prefs.setBool(GlobalConstants.isUserLogIn, true);*/
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BillAmountDashboard()));

      }
    }
  }

  bool checkValidation(){
    final form = formKey.currentState;
    if(form!.validate()){
      form.save();
      return true;
    }
    return false;
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 7.0,
                      shadowColor: Colors.teal,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key:formKey ,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 30,),
                                      Container(
                                        child: new CircleAvatar(
                                          radius: 60,
                                          backgroundColor: Colors.lightBlueAccent,
                                          child: Container(
                                              width: 80,
                                              height: 80,
                                              child: Image(image: AssetImage('assets/images/logo.png',))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 60,),
                              UserTextField(
                                obscureText : false,
                                  keyboardType: TextInputType.number,
                                  controller: bpNumberController,
                                  labelText: "BP Number",
                                  validator: (value){
                                    if (value!.isEmpty && value.length == 0 && value.length <= 9) {
                                      return "Enter BP-Number";
                                    } else {
                                      return null;
                                    }
                                  },
                              ),
                              SizedBox(height: 8,),
                              UserTextField(
                                controller: passwordController,
                                obscureText : passwordVisible,
                                keyboardType : TextInputType.text,
                                suffixIcon : IconButton(
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                labelText: "Password",
                                validator: (val) => val!.length < 4 ? 'Password must be at least 4 digit long' : null,
                                onSaved: (val) => passwordController.text = val!,
                              ),
                              SizedBox(height: 15,),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    padding:  MaterialStateProperty.all(
                                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
                                    ),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.blue)
                                          )
                                      )
                                  ),
                                child: Text("Login"),
                                onPressed:callApi,
                              ),
                              Align(
                                alignment:Alignment.bottomCenter,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                          child: Container(
                                              width: 30, height: 30,
                                              child: Image.asset('assets/images/unistal.png')),
                                        ),
                                        Text("Powered By Unistal Systems Pvt.Ltd.")
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                  child: Container(
                                      width: 200, height: 30,
                                      child: Image.asset('assets/images/smartgasnet.png')),
                                ),
                              ),
                              SizedBox(height: 30,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            (isLoading) ? Container(
              color: Colors.white60,
              child: Center(
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Wrap(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5,),
                          child: SizedBox(
                            child: CircularProgressIndicator(strokeWidth: 3,),
                            height: 20.0,
                            width: 20.0,
                          ),
                        ),Padding(
                          padding: EdgeInsets.only(left: 10,right: 5),
                          child: Text('Wait..',),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ):Container()

          ],
        ),
      ),
    );
  }


  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        setState(() {
          isOffline = false;
          dialogIsVisible = false;
        });
        break;
      case ConnectivityResult.mobile:
        setState(() {
          isOffline = false;
          dialogIsVisible = false;
        });
        break;
      case ConnectivityResult.none:
        setState(() => isOffline = true);
        buildAlertDialog("Internet connection cannot be establised!");
        break;
      default:
        setState(() => isOffline = true);
        break;
    }
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    if (!mounted) {
      return;
    }
    _updateConnectionStatus(result!);
  }
  void buildAlertDialog(String message) {
    SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {
      if (isOffline && !dialogIsVisible) {
        dialogIsVisible = true;
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.portable_wifi_off,
                      color: Colors.redAccent,
                      size: 36.0,
                    ),
                    canProceed
                        ? Text(
                      "Check your internet connection before proceeding.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0),
                    )
                        : Text(
                      "Please! roceed by connecting to a internet connection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.0, color: Colors.red),
                    ),
                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    },
                    child: Text("CLOSE THE APP",style: TextStyle(color: Colors.white),),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      if (isOffline) {
                        setState(() {
                          canProceed = false;
                        });
                      } else {
                        Navigator.pop(context);
                        //your code
                      }
                    },
                    child: Text(
                      "PROCEED",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            });
      }
    }));
  }
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new TextButton(
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: new Text('No'),
          ),
          new TextButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }

}
