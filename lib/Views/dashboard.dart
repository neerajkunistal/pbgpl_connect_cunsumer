import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:customer_connect/complaint_form.dart';
import 'package:customer_connect/utills/global_constant.dart';
import 'package:kenburns/kenburns.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/pending_bill_model.dart';
import '../service/api_server.dart';
import '../utills/Constants.dart';
import '../utills/launch_mobile.dart';
import '../utills/logout_from.dart';
import '../utills/menuData.dart';
import 'GenerateBill.dart';
import 'PNGPrice.dart';
import 'PolicyAndProcedure.dart';
import 'TransactionHistory.dart';
import 'bill_history.dart';
import 'billing_request.dart';
import 'complaint_history.dart';
import 'login_screen.dart';
import 'png_service_charge.dart';
import 'web_view_page.dart';

class BillAmountDashboard extends StatefulWidget {
  @override
  _BillAmountDashboardPageState createState() =>  _BillAmountDashboardPageState();
}

class _BillAmountDashboardPageState extends State<BillAmountDashboard> {

  SharedPreferences? pref;
  bool check = true;
  bool loading = false;
  bool viewcheck = false;
  String userName = '', bpNumber = '', crNumber = '', amount = '', address= '',payNow ='', pdf = "" ;
  String dmaId = '';
  String schema = '';
  String billAmount = '';
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String? mobilenumber;
  int _selectedIndex = 0;
  ApiIntegration? apiIntegration;
  PendingBillRequestModel? pendingBillRequestModel;

  @override
  void initState() {
    apiIntegration = ApiIntegration();
    loadData();
    super.initState();
  }

  loadData() async{
  await getLocalData();
    fetchPendingBill();
  }

  Future<void> getLocalData() async {
    pref = await SharedPreferences.getInstance();
    userName = pref!.getString(GlobalConstants.username)!.toUpperCase();
    bpNumber = pref!.getString(GlobalConstants.bpNumber)!;
    schema = pref!.getString(GlobalConstants.schema)!;
    mobilenumber = pref!.getString(GlobalConstants.mobileNumber)!;
    address = pref!.getString(GlobalConstants.address)!;
    crNumber = pref!.getString(GlobalConstants.crn)!;
    if (pref!.getBool(GlobalConstants.isUserLogIn) != null) {
      setState(() {
        check = true;
        viewcheck = true;
      });
    } else {
      setState(() {
        check = false;
        viewcheck = false;
        pref!.clear();
      });
    }
  }

  Future fetchPendingBill() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    pendingBillRequestModel = PendingBillRequestModel(
      schema: schema,
      bpNumber:bpNumber,
      payNow: "",
    );
    var response = await apiIntegration!.apiPengingBill(pendingBillRequestModel!);
      amount = response!.amount;
      pdf = response.pdf.toString();
      pref.setString(GlobalConstants.payNow, response.payNow.toString());
      pref.setString(GlobalConstants.pdf, response.pdf.toString());
    if (response != null) {
      setState(() {
        loading = false;
      });
      print("success");
    } else {
      setState(() {
        loading = false;
      });
      print("failed");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.lightBlueAccent.withOpacity(0.8),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.lightBlueAccent,
            title: new Text("HPCL Connect",style: TextStyle(color: Colors.white)),
            actions: [
              IconButton(
                icon: Icon(Icons.logout,color: Colors.white,),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return LogoutFromPage(
                          onPressed: () async {
                            Navigator.of(context,rootNavigator: false).pop();
                            SharedPreferences preferences = await SharedPreferences.getInstance();
                            await preferences.clear();
                            EasyLoading.showInfo("Logout Successfully");
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>LoginScreen()));
                          },
                        );
                      });
                },
              )
            ],
          ),
          body:ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  ShapeOfView(
                    elevation: 4,
                    height: 300,
                    shape: DiagonalShape(angle: DiagonalAngle.deg(angle: 15)),
                    child: Stack(
                      children: [
                        KenBurns(
                          maxScale: 5,
                          child: Image.asset("assets/images/backgroundbill.jpg",fit: BoxFit.cover,),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 230),
                    child: ShapeOfView(
                      height: 100, width: 100,
                      shape: CircleShape(borderColor: Colors.white, borderWidth: 3),
                      elevation: 12,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Image(image: AssetImage('assets/images/logo.png',)),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, top: 240),
                      child: Padding(
                        padding: EdgeInsets.only(left: 18, top: 0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Bill Amount",style: billAmountStyle),
                                Text(amount == null ? "No Amount" : "$amount INR",style: amountUser,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: viewcheck,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, top: 340),
                      child: Text("$userName",style: userStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 350),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: viewcheck,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.lightBlueAccent, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: Text("MY CONNECTION",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          Divider(color: Colors.teal.shade100,thickness: 1.0,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  launchURL();
                                               //   Navigator.push(context,MaterialPageRoute(builder: (context) => PdfViewerPage ()));
                                                },
                                                child: Text("View Bill",
                                                  style: TextStyle(
                                                      fontWeight:FontWeight.bold,
                                                      letterSpacing:0.1,
                                                      fontSize: 18,
                                                      color:Colors.lightBlueAccent),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: (){
                                               //  launchURL();
                                                   Navigator.push(context,MaterialPageRoute(builder: (context) => WebViewPage()));
                                                },
                                                child: Card(
                                                  elevation: 1,
                                                  color: Colors.white70,
                                                  shadowColor: Colors.lightBlueAccent,
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                                                    child: Text("PAY NOW", style: payNowStyle,),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: viewcheck,
                              child: Card(
                                color: Colors.white70,
                                shadowColor: Colors.white70,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.lightBlueAccent, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),
                                    ListTile(
                                      title: Row(
                                        children: [
                                          Text("MY CONNECTION",style:connection,),
                                          Spacer(),
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 20,),
                                          Divider(color: Colors.teal.shade100,thickness: 1.0,),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(color: Colors.lightBlueAccent, width: 1),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: new Container(
                                                height: MediaQuery.of(context).size.width / 3,
                                                width: MediaQuery.of(context).size.width / 3,
                                                alignment: Alignment.center,
                                                child: Column(
                                                  crossAxisAlignment:CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:const EdgeInsets.all(8.0),
                                                      child: Text("BP Number",textAlign: TextAlign.center,style: cardUserDetails),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(8.0),
                                                      child: Text("$bpNumber",textAlign:TextAlign.center, style: cardUser
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Card(
                                              elevation: 5.0,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(color: Colors.lightBlueAccent, width: 1),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child:
                                              SingleChildScrollView(
                                                scrollDirection:Axis.vertical,
                                                child: new Container(
                                                  height: MediaQuery.of(context).size.width / 3,
                                                  width: MediaQuery.of(context).size.width / 3,
                                                  alignment: Alignment.center,
                                                  child:Column(
                                                    crossAxisAlignment:CrossAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.all(8.0),
                                                        child:SingleChildScrollView(
                                                          scrollDirection:Axis.horizontal,
                                                          child: Text("CRN NUMBER",style: cardUserDetails),
                                                        ),
                                                      ),
                                                      SingleChildScrollView(
                                                        scrollDirection:Axis.vertical,
                                                        child:SingleChildScrollView(
                                                          scrollDirection:Axis.horizontal,
                                                          child: Padding(
                                                            padding:const EdgeInsets.all(8.0),
                                                            child: Text("$crNumber",textAlign:TextAlign.center,style: cardUser,),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Card(
                                              elevation: 5.0,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(color: Colors.lightBlueAccent, width: 1),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection:Axis.vertical,
                                                child: new Container(
                                                  height: MediaQuery.of(context).size.width / 3,
                                                  width: MediaQuery.of(context).size.width / 3,
                                                  alignment:Alignment.center,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding:const EdgeInsets.all(8.0),
                                                        child: SingleChildScrollView(
                                                          scrollDirection:Axis.horizontal,
                                                          child: Text("Address",style: cardUserDetails),
                                                        ),
                                                      ),
                                                      SingleChildScrollView(
                                                        scrollDirection: Axis.vertical,
                                                        child:SingleChildScrollView(
                                                          scrollDirection: Axis.horizontal,
                                                          child:Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text("$address",textAlign:TextAlign.center,style: cardUser,),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(color: Colors.lightBlueAccent, width: 1),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              elevation: 5.0,
                                              child: new Container(
                                                height: MediaQuery.of(context).size.width / 3,
                                                width: MediaQuery.of(context).size.width / 3,
                                                alignment: Alignment.center,
                                                child: Column(
                                                  crossAxisAlignment:CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text("Mobile Number",textAlign:TextAlign.center,style: cardUserDetails),
                                                    ),
                                                    Padding(
                                                      padding:const EdgeInsets.all(8.0),
                                                      child: Text("$mobilenumber",textAlign:TextAlign.center,style: cardUser,),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.white70,
                              shadowColor: Colors.white70,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.lightBlueAccent, width: 3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: menu.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 1,
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 1.0,
                                      mainAxisSpacing: 1.0),
                                  itemBuilder:(BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        var position = index;
                                        if (position == 0) {
                                          if (pref!.getBool(GlobalConstants.isUserLogIn) != null) {
                                            Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => GenerateBill()));
                                          } else {
                                            EasyLoading.showInfo(GlobalConstants.loginFirst);
                                          }
                                        } else if (position == 1) {
                                          if (pref!.getBool(GlobalConstants.isUserLogIn) != null) {
                                            Navigator.push(context,MaterialPageRoute(builder: (context) => MeterRequestScreen()));
                                          } else {
                                            EasyLoading.showInfo(GlobalConstants.loginFirst);
                                          }
                                        } else if (position == 2) {
                                          Navigator.push(context,MaterialPageRoute(builder: (context) =>TransactionHistory()));
                                        } else if (position == 3) {
                                          if (pref!.getBool(GlobalConstants.isUserLogIn) != null) {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => BillHistory()));
                                          } else {
                                            EasyLoading.showInfo(GlobalConstants.loginFirst);
                                          }
                                        } else if (position == 4) {
                                          Navigator.push(context, MaterialPageRoute( builder: (context) => ComplaintForm()));
                                        } else if (position == 5) {
                                          if (pref!.getBool(GlobalConstants.isUserLogIn) != null) {
                                            Navigator.push(context,MaterialPageRoute(builder: (context) =>ComplainHistory()));
                                          } else {
                                            EasyLoading.showInfo(GlobalConstants.loginFirst);
                                          }
                                        }
                                      },
                                      child: Card(
                                        elevation: 0.2,
                                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(8.0)),
                                        child: Column(
                                          mainAxisAlignment:MainAxisAlignment.center,
                                          crossAxisAlignment:CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(menu[index].icon,size: 30,),
                                            SizedBox(height: 20),
                                            Text(menu[index].title, textAlign: TextAlign.center,style: menuTitle,)
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.white70,
                              shadowColor: Colors.white70,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.lightBlueAccent, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => PngServiceChange()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 50, width: 300,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.lightBlueAccent,
                                                  Colors.green,
                                                  Colors.lightBlueAccent,
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.white70.withOpacity(0.2),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3),
                                                )
                                              ]),
                                          child: Center(
                                            child: Text('PNG SERVICES CHARGE',textAlign: TextAlign.left,style: pngServices),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PNGPrice()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 50,
                                          width: 300,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.lightBlueAccent,
                                                  Colors.green,
                                                  Colors.lightBlueAccent,
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.white70.withOpacity(0.2),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3),
                                                )
                                              ]),
                                          child: Center(
                                            child: Text('PNG PRICE',textAlign: TextAlign.left,style: pngServices),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                        //  Navigator.push( context,MaterialPageRoute(builder: (context) =>WebViewWebPage()));
                                        },
                                        child: Card(
                                          elevation: 5,
                                          color: Colors.lightBlueAccent,
                                          shadowColor: Colors.white,
                                          child: Padding(
                                            padding:const EdgeInsets.all(8.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal, //.horizontal
                                              child: Text("POLICY & PROCEDURE",style:policy),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,MaterialPageRoute(builder: (context) =>PolicyProcedure()));
                                          },
                                          child: Card(
                                            elevation: 5,
                                            color: Colors.lightBlueAccent,
                                            shadowColor: Colors.white,
                                            child: Padding(
                                              padding:const EdgeInsets.all(8.0),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal, //.horizontal
                                                child: Text("Terms and Conditions",style:policy,),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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


  launchURL() async {
    if (await canLaunch(pdf!)) {
      await launch(pdf!);
      print("pdf----->"+pdf!);
    } else {
      throw 'Could not launch $pdf';
    }
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
       if (_selectedIndex == 1) {
         showBottomSheet( context: context, builder: (builder) {
              return LaunchMobilePage();
            }
        );
      }
    }
    );
  }
}

