import 'dart:async';
import 'dart:convert' show json;
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:customer_connect/Views/GenerateBill.dart';
import 'package:customer_connect/Views/dashboard.dart';
import 'package:customer_connect/models/pay_bill_model.dart';
import 'package:customer_connect/service/Apis.dart';
import 'package:customer_connect/utills/CardText.dart';
import 'package:customer_connect/utills/Myfunctions.dart';
import 'package:customer_connect/utills/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utills/Constants.dart';
import '../utills/CustomEmailTextFieldU.dart';
import '../utills/launch_mobile.dart';
import '../utills/photo_controller.dart';

class SelfBillingReques extends StatefulWidget {
  final String scm, amount, old, currency;

  SelfBillingReques(
      {Key? key,
      required this.scm,
      required this.amount,
      required this.old,
      required this.currency})
      : super(key: key);

  @override
  MeterReadingNumberState createState() => MeterReadingNumberState();
}

class MeterReadingNumberState extends State<SelfBillingReques> {
  int i = 9;
  int? keyIndex;
  File? _image;
  File? meterImage;
  int maxLength = 4;

  int _selectedIndex = 0;
  String scmamount = '';
  SharedPreferences? pref;
  var totalAmount;
  String token = '';
  String last = '';
  String text = "";
  String current = '';
  var totalReading;
  var checkStatus;
  String oldMeterNumber = '';
  List<String> intArr = [];
  List<String> userSearchItems = [];

  final FocusScopeNode _node = FocusScopeNode();
  final myController1 = new TextEditingController();
  final myController2 = new TextEditingController();
  final myController3 = new TextEditingController();
  final myController4 = new TextEditingController();
  final myController5 = new TextEditingController();
  final myController6 = new TextEditingController();
  final myController7 = new TextEditingController();
  final myController8 = new TextEditingController();
  final myController9 = new TextEditingController();
  final myController10 = new TextEditingController();
  PhotoController meterPhotoContrller = new PhotoController();
  TextEditingController meterSerialNumber = new TextEditingController(text: '');
  TextEditingController fileName1 = TextEditingController();
  final oldMeterReaderController = new TextEditingController();
  TextEditingController _controller = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getLocal();
    super.initState();
  }

  @override
  void dispose() {
    _node.dispose();
    oldMeterReaderController.dispose();
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    myController4.dispose();
    myController5.dispose();
    myController6.dispose();
    myController7.dispose();
    myController8.dispose();
    myController9.dispose();
    myController10.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BillAmountDashboard()));
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Customer Self Billing",
          style: selfBilling,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Current  Meter Reading:", style: meterReader)),
                SizedBox(
                  height: 10.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 40,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: myController3,
                            autofocus: false,
                            enabled: false,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 40,
                          child: TextField(
                            controller: myController4,
                            autofocus: false,
                            enabled: false,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 40,
                          child: TextField(
                            controller: myController5,
                            autofocus: false,
                            enabled: false,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 40,
                          child: TextField(
                            controller: myController6,
                            autofocus: false,
                            enabled: false,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 40,
                          child: TextField(
                            controller: myController7,
                            autofocus: false,
                            enabled: false,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 40,
                          child: TextField(
                            controller: myController8,
                            autofocus: false,
                            enabled: false,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 40,
                          child: FocusScope(
                            node: _node,
                            child: TextField(
                              controller: myController9,
                              autofocus: false,
                              enabled: false,
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 40,
                          child: FocusScope(
                            node: _node,
                            child: TextField(
                                controller: myController10,
                                autofocus: true,
                                enabled: true,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textAlign: TextAlign.center,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                onChanged: (text) {
                                  setState(() {
                                    var textdata = text;
                                    print("METER NUMBER${textdata.toString()}");
                                    userSearchItems.add(textdata[0]);
                                    print("userSearchItems$userSearchItems");
                                    myController10.text = userSearchItems.last;
                                  });
                                  myController9.text = userSearchItems[
                                      userSearchItems.length - 2];
                                  myController8.text = userSearchItems[
                                      userSearchItems.length - 3];
                                  myController7.text = userSearchItems[
                                      userSearchItems.length - 4];
                                  myController6.text = userSearchItems[
                                      userSearchItems.length - 5];
                                  myController5.text = userSearchItems[
                                      userSearchItems.length - 6];
                                  myController4.text = userSearchItems[
                                      userSearchItems.length - 7];
                                  myController3.text = userSearchItems[
                                      userSearchItems.length - 8];
                                }),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      // if you need this.
                      side: BorderSide(
                        color: Colors.blue.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            userSearchItems.clear();
                            myController1.text = '';
                            myController2.text = '';
                            myController3.text = '';
                            myController4.text = '';
                            myController5.text = '';
                            myController6.text = '';
                            myController7.text = '';
                            myController8.text = '';
                            myController9.text = '';
                            myController10.text = '';
                            i = 9;
                          },
                          child: Text(
                            "CLEAR ",
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                InkWell(
                  child: Card(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.lightBlue, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 15,
                      child: Text("CONTINUE", style: CONTINUE),
                    ),
                  ),
                  onTap: () {
                    checkStatus = "${myController1.text}${myController2.text}"
                        "${myController2.text}${myController3.text}${myController4.text}${myController5.text}"
                        "${myController6.text}${myController7.text}${myController8.text}${myController9.text}${myController10.text}";
                    if ((myController10.text.isEmpty ?? true)) {
                      showErrorMessage(
                          "Current Meter reading is required", context);
                    } else {
                      showBottomSheet(
                        context: context,
                        builder: (context) => StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: Container(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('HPCL Connect'),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  color: Colors.lightBlueAccent,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 12),
                                                    child: new TextButton(
                                                      child: new Text(
                                                          "TAKE PHOTO",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                      onPressed: () async {
                                                        _showPicker(context,
                                                            meterPhotoContrller);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Widget okButton =
                                                        TextButton(
                                                      child: Text("OK"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    );
                                                    AlertDialog alert =
                                                        AlertDialog(
                                                      title: Text("MY PHOTO"),
                                                      content: _image == null
                                                          ? Container(
                                                              margin: EdgeInsets
                                                                  .all(2),
                                                              width: 100,
                                                              height: 100,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/placeholder.png'),
                                                                      fit: BoxFit
                                                                          .fill)),
                                                            )
                                                          : Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(1.0),
                                                              width: 300,
                                                              height: 200,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  image: DecorationImage(
                                                                      image: FileImage(
                                                                          _image!),
                                                                      fit: BoxFit
                                                                          .cover)),
                                                            ),
                                                      actions: [
                                                        okButton,
                                                      ],
                                                    );
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return alert;
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    color: Colors
                                                        .lightBlueAccent
                                                        .shade100,
                                                    child: Center(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 18.0),
                                                          child: TextField(
                                                            enabled: false,
                                                            decoration:
                                                                InputDecoration(
                                                                    hintText:
                                                                        'VIEW IMAGE'),
                                                            onChanged: (text) {
                                                              text = '';
                                                              print(
                                                                  'First text field: $text');
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Row(
                                            children: [
                                              Text("CURRENT METER READING : "),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30),
                                                child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      "$checkStatus",
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                          child: Container(
                                              alignment: Alignment.bottomCenter,
                                              child: CustomTextEmailField(
                                                enabled: false,
                                                controller: meterSerialNumber,
                                                validate: true,
                                                labelText:
                                                    "Meter Serial Number",
                                                hintText: "Meter Serial Number",
                                                filledColor: Colors
                                                    .lightBlueAccent.shade100
                                                    .withOpacity(.1),
                                              )),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            var i1;
                                            if (meterPhotoContrller != null &&
                                                meterPhotoContrller.imagePath !=
                                                    null) {
                                              i1 = meterPhotoContrller
                                                  .imagePath!.path;
                                              btnClick(context, i1, current);
                                            } else {
                                              showErrorMessage(
                                                  "Please upload meter image ",
                                                  context);
                                            }
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 11),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.lightBlueAccent,
                                                        Colors.lightBlue,
                                                        Colors.lightBlueAccent,
                                                      ],
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.white70
                                                            .withOpacity(0.2),
                                                        spreadRadius: 1,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 3),
                                                      )
                                                    ]),
                                                child: Center(
                                                  child: Text(
                                                    'Submit',
                                                    textAlign: TextAlign.left,
                                                    style: submit,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.lightBlueAccent,
                                                        Colors.lightBlueAccent,
                                                        Colors.lightBlueAccent,
                                                      ],
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.white70
                                                            .withOpacity(0.2),
                                                        spreadRadius: 1,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 3),
                                                      )
                                                    ]),
                                                child: Center(
                                                  child: Text('CLOSE',
                                                      textAlign: TextAlign.left,
                                                      style: submit),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    }
                  },
                ),
              ],
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

  Future<void> getLocal() async {
    pref = await SharedPreferences.getInstance();
    scmamount = pref!.getString(GlobalConstants.perScmAmt)!;
    setState(() {
      meterSerialNumber.text =
          pref!.getString(GlobalConstants.meterSerialNumber).toString();
    });
  }

  selfBillingRequest(BuildContext context, String current, String totalReading,
      double totalAmount) {
    AlertDialog alert = AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shadowColor: Colors.lightBlueAccent,
            elevation: 4,
            color: Colors.white70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                "CURRENT BILL DETAILS",
                style: TextStyle(fontSize: 18),
              )),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current Meter  Reading ",
                      style: TextStyle(fontSize: 18),
                    ),
                    CardText(text: "$current"),
                    new SizedBox(
                      height: 10.0,
                      child: new Center(
                        child: new Container(
                          margin: new EdgeInsetsDirectional.only(
                              start: 1.0, end: 1.0),
                          height: 2.0,
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    Text(
                      "Old Meter Reading",
                      style: TextStyle(fontSize: 18),
                    ),
                    CardText(text: "${widget.old}"),
                    new SizedBox(
                      height: 10.0,
                      child: new Center(
                        child: new Container(
                          margin: new EdgeInsetsDirectional.only(
                              start: 1.0, end: 1.0),
                          height: 2.0,
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    Text(
                      "Total Meter Reading",
                      style: TextStyle(fontSize: 18),
                    ),
                    CardText(text: "${totalReading}"),
                    new SizedBox(
                      height: 10.0,
                      child: new Center(
                        child: new Container(
                          margin: new EdgeInsetsDirectional.only(
                              start: 1.0, end: 1.0),
                          height: 2.0,
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    Text(
                      "Per SCM Amount ",
                      style: TextStyle(fontSize: 18),
                    ),
                    CardText(text: "${widget.scm}"),
                    new SizedBox(
                      height: 10.0,
                      child: new Center(
                        child: new Container(
                          margin: new EdgeInsetsDirectional.only(
                              start: 1.0, end: 1.0),
                          height: 2.0,
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    Text(
                      "Total Bill Amount",
                      style: TextStyle(fontSize: 18),
                    ),
                    CardText(
                        text: "${(widget.scm)}*$totalReading =  $totalAmount"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Ok"),
              onPressed: () async {
                if (totalAmount >= 100000) {
                  EasyLoading.showInfo(
                      "Total Bill Amount should be less than 1 lacs");
                } else {
                  Navigator.of(context).pop();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setDouble(GlobalConstants.totalAmount, totalAmount);
                  EasyLoading.show(status: 'loading...');
                  var jwt = await attemptLogIn();
                  PayBillResponse lgd =
                      new PayBillResponse.fromJson(json.decode(jwt));
                  EasyLoading.dismiss();
                  if (lgd.status.toString().contains("200")) {
                    EasyLoading.dismiss();
                    PayBillResponse lgd =
                        new PayBillResponse.fromJson(json.decode(jwt));
                    EasyLoading.showInfo(lgd.status.toString());
                    // Navigator.pushReplacement(context, MaterialPageRoute( builder: (context) =>ListingTab()));
                  } else if (lgd.status == 401) {
                    Navigator.pop(context);
                    PayBillResponse lgd =
                        new PayBillResponse.fromJson(json.decode(jwt));
                    EasyLoading.showInfo(lgd.status.toString());
                    setState(() {
                      EasyLoading.dismiss();
                    });
                  } else if (lgd.status == 415) {
                    Navigator.pop(context);
                    PayBillResponse lgd =
                        new PayBillResponse.fromJson(json.decode(jwt));
                    EasyLoading.showInfo(lgd.status.toString());
                    setState(() {
                      EasyLoading.dismiss();
                    });
                  } else {
                    Navigator.pop(context);
                    PayBillResponse lgd =
                        new PayBillResponse.fromJson(json.decode(jwt));
                    EasyLoading.showInfo(lgd.status.toString());
                    setState(() {
                      EasyLoading.dismiss();
                    });
                  }
                }
              },
            ),
          ],
        )
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _showPicker(context, PhotoController photoContrller) {
    getImageGallery(photoContrller, ImageSource.camera);
  }

  getImageGallery(PhotoController controller, ImageSource imgSource) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: imgSource, maxHeight: 1000, maxWidth: 1000, imageQuality: 100);

    setState(() {
      if (pickedFile != null) {
        if (controller != null) controller.imagePath = File(pickedFile.path);
        pickedFile.path;
        print(pickedFile.path);
        if (meterPhotoContrller != null &&
            meterPhotoContrller.imagePath != null) {
          setState(() {
            EasyLoading.showInfo("Photo captured");
            _image = File(meterPhotoContrller.imagePath!.path);
            fileName1.text =
                meterPhotoContrller.imagePath!.path.split("/").last.toString();
          });
        } else {
          setState(() {
            fileName1.text = "No File Chosen";
          });
        }
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> btnClick(BuildContext context, i1, mycureentReading) async {
    pref = await SharedPreferences.getInstance();
    token = pref!.getString(GlobalConstants.token) ?? '';
    String schema = pref!.getString(GlobalConstants.schema) ?? '';
    String bpNumber = pref!.getString(GlobalConstants.bpNumber) ?? '';
    print("checkStatus$checkStatus");
    if (i1 == null) {
      EasyLoading.showInfo("Please upload meter image");
    } else if (meterSerialNumber.text.length == 0) {
      EasyLoading.showInfo("Please Enter Meter Serial Number");
    } else {
      setState(() {
        EasyLoading.show(status: 'loading...');
      });
      var postUri = Uri.parse(Apis.generate);
      print("Apis.generate${Apis.generate}");
      http.MultipartRequest request =
          new http.MultipartRequest("POST", postUri);
      var meterImage;
      if (i1 != null) {
        meterImage = await http.MultipartFile.fromPath("meter_image_file", i1);
        request.files.add(meterImage);
      }
      request.headers['authorization'] = token;
      request.fields['bpNumber'] = bpNumber;
      request.fields["meter_reading"] = checkStatus;
      request.fields["generate_by_customer"] = "1";
      request.fields["meter_serial"] = meterSerialNumber.text;
      request.fields["schema"] = schema;
      http.StreamedResponse response = await request.send();
      var tesr = await response.stream.toBytes();
      final Map<String, dynamic> data =
          json.decode(String.fromCharCodes(tesr).toString());
      print("datadata$data");
      print(data['code']);
      print("ResponseData${data.keys}");
      var code = data['code'];
      var message = data['message'];
      if (code.toString().contains("200")) {
        Navigator.of(context).pop();
        EasyLoading.dismiss();
        showErrorMessage("Data saved successfully", context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => GenerateBill()));
      } else if (code.toString().contains("403")) {
        EasyLoading.dismiss();
        Navigator.of(context).pop();
        EasyLoading.showInfo("${message.toString()}");
      } else if (code.toString().contains("415")) {
        EasyLoading.dismiss();
        EasyLoading.showInfo("$message");
        Navigator.of(context).pop();
      } else if (code.toString().contains("400")) {
        EasyLoading.dismiss();
        EasyLoading.showInfo("$message");
        Navigator.of(context).pop();
      } else {
        EasyLoading.dismiss();
        Navigator.of(context).pop();
      }
    }
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
    });
  }
}

Future<String> attemptLogIn() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var rng = new Random();
  var code = rng.nextInt(900000) + 100000;
  var refNumber = "R$code";
  DateTime timestamp = DateTime.now();
  var res = await http.post((Uri.parse(Apis.pay_bill)), body: {
    "schema": pref.getString(GlobalConstants.schema),
    "bp_number": pref.getString(GlobalConstants.bpNumber),
    "transaction_ref_number": refNumber,
    "amount_paid": pref.getDouble(GlobalConstants.totalAmount).toString(),
    "transaction_timestamp": timestamp.toString().split('.').first,
    "status": "success",
    "bill_number": pref.getString(GlobalConstants.billNo),
    "payment_mode": "Credit Card",
    "bill_fetch_ref": pref.getString(GlobalConstants.billFetchRef)
  }, headers: {
    "Accept": "application/json",
    "Authorization": pref.getString(GlobalConstants.token)!
  });
  print("Apispay_bill  ${Apis.pay_bill}");
  return res.body;
}
