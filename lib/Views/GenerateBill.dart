import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:customer_connect/models/Generatebill.dart';
import 'package:customer_connect/utills/Constants.dart';
import './dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../utills/launch_mobile.dart';


class GenerateBill extends StatefulWidget {
  static String tag = 'login-page';
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return new _GenerateBill();
  }
}
class _GenerateBill extends State<GenerateBill> {
  var democheck = false;
  var democheckNo = false;
  Future <List<Generatebill>>? futureData;



  Generatebill? _allBillsHistoryResponse;
  SharedPreferences? prefs;
  var count = 0;
  int totalcount = 0;
  List<Data> list = [];

  int _selectedIndex=0;

  var checkRecords=false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          actionsIconTheme:
          IconThemeData(size: 30.0, color: Colors.black, opacity: 10.0),
          actions: <Widget>[
          ],
          title: new Text(
            "Bill Request",
            style: whiteheadingStyle,
          ),
          leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new BillAmountDashboard()));
              }),
          backgroundColor: Colors.lightBlueAccent),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          list == null ? Container() : CertificationDetails(context),
        ],
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
  // ignore: non_constant_identifier_names
  CertificationDetails(BuildContext context) {
    return Flexible(
      child: ListView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [


          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child:list.isEmpty
                  ? Center(child: Text(
                '', style: TextStyle(fontSize: 18, color: Colors.white),))
                  : DataTable(
                /* sortAscending: sort,
              sortColumnIndex: 0,*/
                headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.black),
                dataRowHeight: 50,
                dividerThickness: 5,
                /*
Bill Number	CRN	BP Number	Bill Generated Date	Old Reading	Current Reading	Bill Amount	Reject Reason	Status*/
                columns: [
                  DataColumn(
                    label: Text("User Name",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text("Bill Number",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,

                  ),
                  DataColumn(
                    label: Text("CRN",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,

                  ),
                  DataColumn(
                    label: Text("BP Number",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,

                  ),

                  DataColumn(
                    label: Text("BILL GENERATED DATE",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,

                  ),
                  /*   DataColumn(
                    label: Text(
                      "METER IMAGE",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,

                  ),*/
                  DataColumn(
                    label: Text(
                      "Old Reading",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,

                  ),
                  DataColumn(
                    label: Text(
                      "Current Reading",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,

                  ),
                  DataColumn(
                    label: Text(
                      "Bill Amount",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text(
                      "Reject Reason",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,

                  ),
                  /* DataColumn(
                    label: Text(
                      "METER SERIAL NUMBER",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,

                  ),*/


                  DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Text(
                        "STATUS",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    numeric: false,
                  ),
                ],
                rows: list
                    .map(
                      (user) =>
                      DataRow(
                        /* selected: selectedEmployees.contains(user),
                    onSelectChanged: (b) {
                      print("Onselect");
                      onSelectedRow(b, user);
                    },*/
                          cells: [
                            DataCell(
                              Text(user.firstName!.toUpperCase()+" "+
                                  user.firstName!.toUpperCase() == null
                                  ? '-'
                                  : user.firstName!.toUpperCase()+" "+
                                  user.firstName!.toUpperCase() == null
                                  ? '-'
                                  : user.firstName!.toUpperCase()+" "+
                                  user.firstName!.toUpperCase()),
                            ),
                            DataCell(
                              Text(user.billNo!.toString() == null ? '-' : user
                                  .billNo == null ? '-' : user.billNo!.toString()),
                            ),
                            DataCell(
                              Text(user.crn!.toString() == null ? '-' : user
                                  .crn == null ? '-' : user.crn!.toString()),
                            ),
                            DataCell(
                              Text(user.bpNumber!.toString() == null ? '-' : user.bpNumber ==
                                  null ? '-' : user.bpNumber!.toString()),
                            ),
                            DataCell(
                              Text(user.billGeneratedDate!.toString() == null ? '-' : user
                                  .billGeneratedDate == null ? '-' : user
                                  .billGeneratedDate!.toString()),
                            ),
                            /*     DataCell(
                              Text(user.billGeneratedDate == null ? '-' : user
                                  .billGeneratedDate == null ? '-' : user
                                  .billGeneratedDate),

                              onTap: (){

                                var link=user.billGeneratedDate;
                                print("link$link");


                                Widget okButton = TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                );

                                // set up the AlertDialog
                                AlertDialog alert = AlertDialog(
                                  title: Text("HPCL CONNECT"),
                                  content: Image.network("http://via.placeholder.com/350x150"),
                                  actions: [
                                    okButton,
                                  ],
                                );
                                // show the dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                              }
                            ),*/
                            DataCell(
                              Text(user.oldReading!.toString() == null ? '-' : user
                                  .oldReading == null ? '-' : user
                                  .oldReading!.toString()),
                            ),
                            DataCell(
                              Text(user.currentBillReading!.toString() == null ? '-' : user.currentBillReading ==
                                  null ? '-' : user.currentBillReading!.toString()),
                            ),
                            DataCell(
                              Text(user.amount == null ? '-' : user.amount == null
                                  ? '-'
                                  : user.amount! +" INR"),
                            ),
                            DataCell(
                              Text(user.rejectReason!.toString() == null ? '-' : user.rejectReason == null
                                  ? '-'
                                  : user.rejectReason!.toString()),
                            ),
                            DataCell(
                              Center(
                                child: Card(
                                  elevation: 5,
                                  color: Colors.lightBlueAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Text(user.billApproved!.toString().contains("2")? "Rejected":user.billApproved!.toString().contains("0")? "Pending":"Approved",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),

                            ),
                          ]),
                )
                    .toList(),
              ),
            ),
          ),
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
        showBottomSheet(context: context, builder: (builder) {
          return LaunchMobilePage();
        });
      }
      /* else if (_selectedIndex == 3) {
        print('The value of the input is: third');
      }*/
    });
  }
}
