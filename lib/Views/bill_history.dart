import 'package:customer_connect/utills/CardText.dart';
import 'package:customer_connect/utills/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../utills/launch_mobile.dart';
import 'dashboard.dart';

class BillHistory extends StatefulWidget {
  @override
  _BillHistoryState createState() => _BillHistoryState();
}

class _BillHistoryState extends State<BillHistory> {
  var billdetailsCheck = false;
  var noRecords = false;
  var numberOfCameras = 0;
  var tableResponse;
  int _selectedIndex = 0;

  // ScanResult scanResult;
  String inVoiceNo = '';
  String billPeriod = '';
  String currency = '';
  String billAmount = '';
  String inVoiceDate = '';
  String dueDate = '';
  String firstName = '';
  String bpnumber = '';
  String lastName = '';
  int? oldReaading;
  String? scmAmount;
  String? amount;
  String? billNo;
  String address = '';
  final _text = TextEditingController();
  final mobileNo = TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _flashOnController = TextEditingController(text: "Flash on");
  final _flashOffController = TextEditingController(text: "Flash off");
  final _cancelController = TextEditingController(text: "Cancel");

  // static final _possibleFormats = BarcodeFormat.values.toList()..removeWhere((e) => e == BarcodeFormat.unknown);
  // List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _text.dispose();
    mobileNo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BillAmountDashboard()));
          },
        ),
        title: Text(
          "Approved Bill",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: ListView(
                children: <Widget>[
                  Visibility(
                    visible: billdetailsCheck,
                    child: Card(
                      shadowColor: Colors.teal,
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white12, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          child: Column(
                            children: [
                              Card(
                                elevation: 1.0,
                                shadowColor: Colors.teal,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: CardText(text: "User  Name "),
                                        flex: 0,
                                      ),
                                      Flexible(
                                        child: CardText(
                                            text: firstName + " " + lastName),
                                        flex: 0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 1.0,
                                shadowColor: Colors.teal,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: CardText(text: "BP Number "),
                                        flex: 0,
                                      ),
                                      Flexible(
                                        child: CardText(text: bpnumber),
                                        flex: 0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 1.0,
                                shadowColor: Colors.teal,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: CardText(text: "Address"),
                                        flex: 0,
                                      ),
                                      Flexible(
                                        child: CardText(text: address),
                                        flex: 0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 1.0,
                                shadowColor: Colors.teal,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: CardText(text: "Bill No"),
                                        flex: 0,
                                      ),
                                      Flexible(
                                        child: CardText(text: billNo),
                                        flex: 0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 1,
                                shadowColor: Colors.blue,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                        shadowColor: Colors.lightBlueAccent,
                                        color: Colors.white70,
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "LAST BILL ",
                                            style: listItemTitleStyle,
                                          ),
                                        ))),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: CardText(
                                                text:
                                                    "Last Reading Meter Number"),
                                            flex: 0,
                                          ),
                                          Flexible(
                                            child: CardText(
                                                text: oldReaading.toString()),
                                            flex: 0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: CardText(
                                                text: "Per SCM Amount"),
                                            flex: 0,
                                          ),
                                          Flexible(
                                            child: CardText(
                                                text:
                                                    " " + scmAmount.toString()),
                                            flex: 0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                elevation: 1.0,
                                shadowColor: Colors.lightBlueAccent,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CardText(text: "Due Date         "),
                                      CardText(text: dueDate.split(' ').first),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 1.0,
                                shadowColor: Colors.lightBlueAccent,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CardText(text: "Bill Period        "),
                                      CardText(
                                          text: billPeriod.split(' ').first),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 1.0,
                                shadowColor: Colors.lightBlueAccent,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CardText(
                                          text: "Last Bill Amount        "),
                                      CardText(text: "${amount}"),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                      visible: noRecords,
                      child: Center(
                          child: Text("NO RECORD FOUND!!!!!",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 18))))
                ],
              ),
            ),
          ),
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
    );
  }

  // Future scan() async {
  //   try {
  //     var options = ScanOptions(
  //       strings: {
  //         "cancel": _cancelController.text,
  //         "flash_on": _flashOnController.text,
  //         "flash_off": _flashOffController.text,
  //       },
  //       restrictFormat: selectedFormats,
  //       useCamera: _selectedCamera,
  //       autoEnableFlash: _autoEnableFlash,
  //       android: AndroidOptions(
  //         aspectTolerance: _aspectTolerance,
  //         useAutoFocus: _useAutoFocus,
  //       ),
  //     );
  //
  //     var result = await BarcodeScanner.scan(options: options);
  //     setState(() => scanResult = result);
  //   } on PlatformException catch (e) {
  //   }
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        EasyLoading.dismiss();
        Navigator.of(context).pop();
      } else if (_selectedIndex == 1) {
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
