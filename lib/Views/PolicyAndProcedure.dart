import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utills/launch_mobile.dart';

class PolicyProcedure extends StatefulWidget {
  @override
  _WebViewWebPageState createState() => _WebViewWebPageState();
}

class _WebViewWebPageState extends State<PolicyProcedure> {
  // URL to load
  var URL = "https://citygas.hpcl.co.in/termsandconditions";

  // Webview progress
  double progress = 0;

  int _selectedIndex = 0;

  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            this.progress = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            this.progress = double.parse(progress.toString());
          });
        },
        onPageFinished: (url) {
          setState(() {
            this.progress = progress / 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse(URL),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Terms and Conditions"),
      ),
      body: Card(
        elevation: 1,
        shadowColor: Colors.white,
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: <Widget>[
            (progress != 1.0)
                ? LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.green,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purple))
                : Container(), // Should be removed while showing
                Expanded(
                  child: Container(
                    child: WebViewWidget(
                      controller: controller,
                    ),
                  ),
                )
          ].where((Object o) => o != null).toList()),
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: Colors.lightBlueAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
              ),
              label: "Dial Before Dig"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: "Ask Maitri",
          )
        ],
      ),
    ); //Remove null widgets,
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        EasyLoading.dismiss();
        Navigator.of(context).pop();
        /*  showModalBottomSheet(
            context: context,
            builder: (builder) {
              return new Container(
                  height: 350.0,
                  color: Colors.transparent,
                  //could change this to Color(0xFF737373),
                  //so you don't have to change MaterialApp canvasColor
                  child: new Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Text(
                                  'Customer Care',
                                  textAlign: TextAlign.right,
                                  style: (TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  )),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                  AssetImage("assets/icons/user.png"),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  launch("tel:1800102509");
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 20.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 50,
                                      color: Colors.black12,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            color: Colors.red,
                                            width: 70,
                                            height: 70,
                                            child: Icon(Icons.phone,
                                                color: Colors.white),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text('1800-102-5109',
                                                    style: TextStyle(
                                                        color: Colors.grey))
                                              ],
                                            ),
                                          ),
                                          */ /*       Icon(Icons.arrow_forward_ios,
                                              color: Colors.blue),*/ /*
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  launch("tel:1800-180-5109");
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 20.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 50,
                                      color: Colors.black12,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            color: Colors.red,
                                            width: 70,
                                            height: 70,
                                            child: Icon(Icons.phone,
                                                color: Colors.white),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text('1800-180-5109',
                                                    style: TextStyle(
                                                        color: Colors.grey))
                                              ],
                                            ),
                                          ),
                                          */ /*       Icon(Icons.arrow_forward_ios,
                                              color: Colors.blue),*/ /*
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ));
            });*/
      }
      /*else if (_selectedIndex == 1) {
        */ /*  Navigator.push(
            context, MaterialPageRoute(builder: (context) => DialBeforeDig()));*/ /*
      }*/
      else if (_selectedIndex == 1) {
        showBottomSheet(
            context: context,
            builder: (builder) {
              return LaunchMobilePage();
            });
      }
      /* else if (_selectedIndex == 3) {
        print('The value of the input is: third');
      }*/
    });
  }
}
