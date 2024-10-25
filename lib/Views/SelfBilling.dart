import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:customer_connect/utills/Constants.dart';
import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../utills/CustomEmailTextFieldU.dart';
import '../utills/launch_mobile.dart';
import '../utills/photo_controller.dart';


class SelfBilling extends StatefulWidget {
  static String tag = 'login-page';
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return new _FilterList();
  }
}

class _FilterList extends State<SelfBilling> {
  TextEditingController MeterSerialNumber = new TextEditingController(text: '');
  TextEditingController fileName1 = TextEditingController();
  File? meterImage;
  PhotoController meterPhotoContrller = new PhotoController();

  int _selectedIndex=0;

  @override
  void initState() {
    EasyLoading.show(status: "Please wait");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
          actionsIconTheme:
          IconThemeData(size: 30.0, color: Colors.black, opacity: 10.0),
          actions: <Widget>[
          ],
          title: new Text(
            "Self Billing Generation",
            style: whiteheadingStyle,
          ),
          leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
              }),
          backgroundColor: Colors.lightBlueAccent),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.bottomCenter,
                  child: CustomTextEmailField(
                    controller: MeterSerialNumber,
                    validate: true,
                    labelText: "Meter Reading",
                    hintText: "Meter Reading",
                    filledColor: Colors.lightBlueAccent.shade100
                        .withOpacity(.1),

                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Meter Image",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text("",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.bottomCenter,
                  child: CustomTextEmailField(
                    controller: MeterSerialNumber,
                    validate: true,
                    labelText: "Meter Serial Number",
                    hintText: "Meter Serial Number",
                    filledColor: Colors.lightBlueAccent.shade100
                        .withOpacity(.1),

                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey,
                          Colors.black,
                          Colors.grey,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Center(
                    child: Text(
                      'Submit',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Netflix",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        letterSpacing: 0.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: Colors.lightBlueAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.account_box,), label: "Dial Before Dig"),
          BottomNavigationBarItem(icon: Icon(Icons.chat,), label: "Ask Maitri",)
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        EasyLoading.dismiss();
        Navigator.of(context).pop();

      }
      else if (_selectedIndex == 1) {
        showBottomSheet(context: context,  builder: (builder) {
              return LaunchMobilePage();
            });
      }

    });
  }
}
