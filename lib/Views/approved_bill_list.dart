import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:customer_connect/models/Generatebill.dart';
import 'package:customer_connect/utills/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dashboard.dart';

class ApprovedBill extends StatefulWidget {
  static String tag = 'login-page';
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return new _ApprovedBill();
  }
}
class _ApprovedBill extends State<ApprovedBill> {
  var democheck = false;
  var democheckNo = false;
  Future <List<Generatebill>>? futureData;
  
  TextEditingController mobileNumberController =
  new TextEditingController(text: '');
 
  Generatebill? _allBillsHistoryResponse;
  SharedPreferences? prefs;
  var count = 0;
  var EXITCOUNT = 0;
  var FRESSCOUNT = 0;
  int totalcount = 0;

  List<String> mylist = ["ALL"];
  List<Data> list = [];
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
            "Bill Generation History",
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
              child: list.isEmpty
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
                    label: Text(
                      "User Name",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,

                  ),
                  DataColumn(
                    label: Text(
                      "Bill Number",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,

                  ),
                  DataColumn(
                    label: Text(
                      "CRN",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,

                  ),
                  DataColumn(
                    label: Text(
                      "BP Number",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,

                  ),

                  DataColumn(
                    label: Text(
                      "BILL GENERATED DATE",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    numeric: false,

                  ),
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
                                  .billNo!.toString() == null ? '-' : user.billNo.toString()),
                            ),
                            DataCell(
                              Text(user.crn!.toString() == null ? '-' : user
                                  .crn!.toString() == null ? '-' : user.crn!.toString()),
                            ),
                            DataCell(
                              Text(user.bpNumber!.toString() == null ? '-' : user.bpNumber!.toString() ==
                                  null ? '-' : user.bpNumber!.toString()),
                            ),
                            DataCell(
                              Text(user.billGeneratedDate!.toString() == null ? '-' : user
                                  .billGeneratedDate!.toString() == null ? '-' : user
                                  .billGeneratedDate!.toString()),
                            ),
                            DataCell(
                              Text(user.oldReading!.toString() == null ? '-' : user
                                  .oldReading!.toString() == null ? '-' : user
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
                                    child: Text('Pending',
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
}
