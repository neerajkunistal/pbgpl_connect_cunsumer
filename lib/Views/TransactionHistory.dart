import 'dart:async';

import 'package:customer_connect/Views/dashboard.dart';
import 'package:customer_connect/models/LeadListResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utills/launch_mobile.dart';

class TransactionHistory extends StatefulWidget {
  static String tag = 'login-page';

  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return new _FilterList();
  }
}

class _FilterList extends State<TransactionHistory> {
  var democheck = false;
  var democheckNo = false;
  Future<List<LeadListResponse>>? futureData;

  TextEditingController mobileNumberControler =
      new TextEditingController(text: '');
  LeadListResponse? listResponse;
  SharedPreferences? prefs;
  var count = 0;
  var EXITCOUNT = 0;
  var FRESSCOUNT = 0;
  int totalcount = 0;

  List list = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
          actionsIconTheme:
              IconThemeData(size: 30.0, color: Colors.black, opacity: 10.0),
          actions: <Widget>[],
          title: new Text(
            "Bill History",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                EasyLoading.dismiss();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new BillAmountDashboard()));
              }),
          backgroundColor: Colors.white),
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
                  ? Center(
                      child: Text(
                      '',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ))
                  : DataTable(
                      /* sortAscending: sort,
              sortColumnIndex: 0,*/
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black),
                      dataRowHeight: 50,
                      dividerThickness: 5,
                      columns: [
                        DataColumn(
                          label: Text(
                            "COMPANY NAME",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            "PAID AMOUNT",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            "BILL PAY DATE.",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            "TXT-REF-NUMBER",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            "BILL NUMBER",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            "Amount",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            "BILL DUE DATE",
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
                              "BILL GENERATED DATE",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "ADDRESS",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              "CRN",
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
                            (user) => DataRow(
                                /* selected: selectedEmployees.contains(user),
                    onSelectChanged: (b) {
                      print("Onselect");
                      onSelectedRow(b, user);
                    },*/
                                cells: [
                                  DataCell(
                                    Text(user.firstName.toUpperCase() +
                                                " " +
                                                user.firstName.toUpperCase() ==
                                            null
                                        ? '-'
                                        : user.firstName.toUpperCase() +
                                                    " " +
                                                    user.firstName
                                                        .toUpperCase() ==
                                                null
                                            ? '-'
                                            : user.firstName.toUpperCase() +
                                                " " +
                                                user.firstName.toUpperCase()),
                                  ),
                                  DataCell(
                                    Text(user.paidAmount == null
                                        ? '-'
                                        : user.paidAmount == null
                                            ? '-'
                                            : user.paidAmount),
                                  ),
                                  DataCell(
                                    Text(user.billPayDate == null
                                        ? '-'
                                        : user.billPayDate == null
                                            ? '-'
                                            : user.billPayDate),
                                  ),
                                  DataCell(
                                    Text(user.txnRefNumber == null
                                        ? '-'
                                        : user.txnRefNumber == null
                                            ? '-'
                                            : user.txnRefNumber),
                                  ),
                                  DataCell(
                                    Text(user.billNo == null
                                        ? '-'
                                        : user.billNo == null
                                            ? '-'
                                            : user.billNo),
                                  ),
                                  DataCell(
                                    Text(user.amount == null
                                        ? '-'
                                        : user.amount == null
                                            ? '-'
                                            : user.amount),
                                  ),
                                  DataCell(
                                    Text(user.billDueDate == null
                                        ? '-'
                                        : user.billDueDate == null
                                            ? '-'
                                            : user.billDueDate),
                                  ),
                                  /*DataCell(
                          Text(user.m == null ? '-' : user.billGeneratedDate == null ? '-' : user.billGeneratedDate),
                        ),*/
                                  DataCell(
                                    Text(user.billGeneratedDate == null
                                        ? '-'
                                        : user.billGeneratedDate == null
                                            ? '-'
                                            : user.billGeneratedDate),
                                  ),
                                  DataCell(
                                    Text(user.address == null
                                        ? '-'
                                        : user.address == null
                                            ? '-'
                                            : user.address),
                                  ),
                                  DataCell(
                                    Text(user.crn == null
                                        ? '-'
                                        : user.crn == null
                                            ? '-'
                                            : user.crn),
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
