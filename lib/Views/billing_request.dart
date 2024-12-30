import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/bp_number_model.dart';
import '../models/generate_model.dart';
import '../service/api_server.dart';
import '../utills/CustomEmailTextFieldU.dart';
import '../utills/common_widget/custom_toast.dart';
import '../utills/custom_dialog_box.dart';
import '../utills/global_constant.dart';
import '../utills/meeter_reader_number.dart';
import '../utills/photo_controller.dart';
import '../utills/reused_text_style.dart';

class MeterRequestScreen extends StatefulWidget {
  MeterRequestScreen({
    Key? key,
  }) : super(key: key);

  @override
  MeterReadingNumberState createState() => MeterReadingNumberState();
}

class MeterReadingNumberState extends State<MeterRequestScreen> {
  int i = 9;
  bool canProceed = true;
  bool isOffline = false;
  bool dialogIsVisible = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  bool progressBar = false;
  bool loading = false;
  String scmAmount = '';
  SharedPreferences? pref;
  var totalAmount;
  final String _takePhotoLabel = 'Take Photo';
  String locationLat = '0';
  String locationLong = '0';
  String address = '';

  PhotoController meterImgController = PhotoController();
  final FocusScopeNode _node = FocusScopeNode();
  final bpNumberController = new TextEditingController();
  final meterNumberController = new TextEditingController();
  final customerNameController = new TextEditingController();
  final customerAddressController = new TextEditingController();
  final previousReadingController = new TextEditingController();
  final previousOutStandingController = new TextEditingController();
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
  final oldMeterReaderController = new TextEditingController();
  final _controller = new TextEditingController();
  TextEditingController meterSerialNumber = new TextEditingController(text: '');
  TextEditingController fileName1 = TextEditingController();
  PhotoController meterPhotoController = new PhotoController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool con1 = false,
      con2 = false,
      con3 = false,
      con4 = false,
      con5 = false,
      con6 = false,
      con7 = false,
      con8 = false,
      con9 = false,
      con10 = true;
  ApiIntegration? apiIntegration;
  BPNumberRequestModel? bpNumberRequestModel;
  GenerateRequestModel? generateRequestModel;
  BpNumberModel? bpNumberModel;
  List<DataList> searchList = [];

  int? keyIndex;
  File? meterImage;
  Color? borderColor;
  String token = '';
  String schema = '';
  String current = '';
  var totalReading;
  var checkStatus;
  bool checkValue = false;

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      schema = pref.getString(GlobalConstants.schema) ?? "";
      bpNumberController.text = pref.getString(GlobalConstants.bpNumber) ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    apiIntegration = ApiIntegration();
    loadData();
    locationConnect();
    initConnectivity();
  }

  loadData() async {
    await getData();
    billMeterReader();
  }

  double? actualResult;

  subMethod() {
    setState(() {
      double sum = double.parse(myController1.text +
                  myController2.text +
                  myController3.text +
                  myController4.text +
                  myController5.text +
                  myController6.text +
                  myController7.text +
                  myController8.text +
                  myController9.text +
                  myController10.text) /
              1000 -
          double.parse(previousReadingController.text);
      actualResult = sum.toDouble();
    });
  }

  Future billMeterReader() async {
    setState(() {
      loading = true;
    });
    bpNumberRequestModel = BPNumberRequestModel(
      schema: schema,
      bpNumber: bpNumberController.text,
    );
    var response = await apiIntegration!.bpNumberSearch(bpNumberRequestModel!);
    setState(() {
      try {
        searchList = response;
        print("searchList-->" + response.toString());
        dataClear();
        meterNumberController.text = searchList[0].meterSerialNumber.toString();
        customerNameController.text = searchList[0].firstName.toString() +
            " " +
            searchList[0].lastName.toString();
        customerAddressController.text = searchList[0].houseNumber.toString() +
            "\n" +
            searchList[0].locality.toString() +
            "\n" +
            searchList[0].town.toString() +
            "\n" +
            searchList[0].pinCode.toString();
        previousReadingController.text =
            searchList[0].oldReading.toString() ?? "";

        // setState(() {
        //   loading = false;
        // });
      } catch (e) {
        setState(() {
          loading = false;
        });
      }
    });
    if (response.toString() != null) {
      setState(() {
        loading = false;
      });
      print("success");
    } else {
      setState(() {
        loading = false;
      });
      CustomToast.showToast("Failed");
      print("failed");
    }
  }

  Future onClick() async {
    String myReadingValue = myController1.text.toString().trim() +
        myController2.text.toString().trim() +
        myController3.text.toString().trim() +
        myController4.text.toString().trim() +
        myController5.text.toString().trim() +
        myController6.text.toString().trim() +
        myController7.text.toString().trim() +
        myController8.text.toString().trim() +
        myController9.text.toString().trim() +
        myController10.text.toString().trim();
    double myReading = double.parse(myReadingValue) / 1000;
    if (bpNumberController == null) {
      CustomToast.showToast("Select BP Number");
      return;
    }
    if (customerNameController == null) {
      CustomToast.showToast("Select Customer Name ");
      return;
    }
    if (customerAddressController == null) {
      CustomToast.showToast("Select Customer Address ");
      return;
    }
    if (meterNumberController == null) {
      CustomToast.showToast("Select Meeter Number");
      return;
    }
    if (previousReadingController == null) {
      CustomToast.showToast("Select Previous Reading ");
      return;
    }
    if (myReadingValue.trim() == "") {
      CustomToast.showToast("Enter New Meter Reading");
      return;
    }
    if (meterImgController.imagePath == null ||
        meterImgController.imagePath == " ") {
      CustomToast.showToast("Select Meter Image");
      return;
    }
    if (double.parse(previousReadingController.text) > myReading) {
      CustomToast.showToast(
          "New Reading should be more than Previous Reading ");
      return;
    }
    setState(() {
      progressBar = true;
    });
    generateRequestModel = GenerateRequestModel(
      bpNumber: bpNumberController.text.toString(),
      schema: schema,
      meter_reading: myReading.toString(),
      meter_serial: meterNumberController.text.toString(),
      generate_by_customer: "1",
      latitude: locationLat,
      longitude: locationLong,
      meter_image_file: meterImgController.imagePath!.path,
      old_reading: previousReadingController.text.toString(),
    );
    var response =
        await apiIntegration!.submitgenerateApi(generateRequestModel!);
    setState(() {
      try {
        print(
            "response submit -->" + generateRequestModel!.toJson().toString());
      } catch (e) {
        CustomToast.showToast(response.message.toString());
        progressBar = false;
      }
    });

    if (response != null) {
      setState(() {
        progressBar = false;
      });
      if (response.code == 200) {
        CustomToast.showToast(response.message.toString());
        print("success");
        bpNumberController.clear();
        dataClear();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MeterRequestScreen()),
        );
      } else {
        ShowCustomToast.showToast(response.message.toString());
        print("success");
        Navigator.of(context).pop();
      }
    } else {
      CustomToast.showToast(response.message.toString());
      Navigator.of(context).pop();
      print("failed");
    }
  }

  dataClear() {
    meterSerialNumber.clear();
    meterNumberController.clear();
    customerNameController.clear();
    customerAddressController.clear();
    previousReadingController.clear();
    previousOutStandingController.clear();
    myController1.clear();
    myController2.clear();
    myController3.clear();
    myController4.clear();
    myController5.clear();
    myController6.clear();
    myController7.clear();
    myController8.clear();
    myController9.clear();
    myController10.clear();
    meterImgController = PhotoController();
  }

  dataTextEnable() {
    myController1.clear();
    myController2.clear();
    myController3.clear();
    myController4.clear();
    myController5.clear();
    myController6.clear();
    myController7.clear();
    myController8.clear();
    myController9.clear();
    myController10.clear();
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
    _connectivitySubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.lightBlueAccent,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        centerTitle: true,
        title: Text("Meter Reader",
            style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: CustomTextEmailField(
                          enabled: false,
                          keyboardType: TextInputType.name,
                          controller: bpNumberController,
                          validate: false,
                          labelText: "BP Number",
                          filledColor: Colors.white,
                        )),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: CustomTextEmailField(
                          enabled: false,
                          keyboardType: TextInputType.name,
                          controller: customerNameController,
                          validate: false,
                          labelText: "Customer Name",
                          filledColor: Colors.white,
                        )),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: CustomTextEmailField(
                          enabled: false,
                          keyboardType: TextInputType.streetAddress,
                          maxLines: 4,
                          controller: customerAddressController,
                          validate: false,
                          labelText: "Customer Address",
                          filledColor: Colors.white,
                        )),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: CustomTextEmailField(
                          enabled: false,
                          keyboardType: TextInputType.number,
                          controller: meterNumberController,
                          validate: false,
                          labelText: "Meter Number",
                          filledColor: Colors.white,
                        )),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: CustomTextEmailField(
                          enabled: false,
                          keyboardType: TextInputType.number,
                          controller: previousReadingController,
                          validate: false,
                          labelText: "Previous Reading",
                          filledColor: Colors.white,
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Meter Reading:",
                            style: ReusedTextStyle.currentMeeterReader)),
                    SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          MeterNumber(
                              myController1, false, con2, TextInputAction.done,
                              (_) {
                            if (myController1.text
                                .toString()
                                .trim()
                                .isNotEmpty) {
                              setState(() {
                                con9 = true;
                                FocusScope.of(context).unfocus();
                              });
                            } else {
                              setState(() {
                                con9 = false;
                              });
                            }
                          }, Colors.grey),
                          SizedBox(
                            width: 2.0,
                          ),
                          MeterNumber(myController2, con2, con3,
                              TextInputAction.previous, (_) {
                            if (myController2.text
                                .toString()
                                .trim()
                                .isNotEmpty) {
                              setState(() {
                                con1 = true;
                                FocusScope.of(context).previousFocus();
                              });
                            } else {
                              setState(() {
                                con1 = false;
                              });
                            }
                          }, Colors.grey),
                          SizedBox(
                            width: 2.0,
                          ),
                          MeterNumber(myController3, con3, con4,
                              TextInputAction.previous, (_) {
                            if (myController3.text
                                .toString()
                                .trim()
                                .isNotEmpty) {
                              setState(() {
                                con2 = true;
                                FocusScope.of(context).previousFocus();
                              });
                            } else {
                              setState(() {
                                con2 = false;
                              });
                            }
                          }, Colors.grey),
                          SizedBox(
                            width: 2.0,
                          ),
                          MeterNumber(myController4, con4, con5,
                              TextInputAction.previous, (_) {
                            if (myController4.text
                                .toString()
                                .trim()
                                .isNotEmpty) {
                              setState(() {
                                con3 = true;
                                FocusScope.of(context).previousFocus();
                              });
                            } else {
                              setState(() {
                                con3 = false;
                              });
                            }
                          }, Colors.grey),
                          SizedBox(
                            width: 2.0,
                          ),
                          MeterNumber(myController5, con5, con6,
                              TextInputAction.previous, (_) {
                            if (myController5.text
                                .toString()
                                .trim()
                                .isNotEmpty) {
                              setState(() {
                                con4 = true;
                                FocusScope.of(context).previousFocus();
                              });
                            } else {
                              setState(() {
                                con4 = false;
                              });
                            }
                          }, Colors.grey),
                          SizedBox(
                            width: 2.0,
                          ),
                          MeterNumber(myController6, con6, con7,
                              TextInputAction.previous, (_) {
                            if (myController6.text
                                .toString()
                                .trim()
                                .isNotEmpty) {
                              setState(() {
                                con5 = true;
                                FocusScope.of(context).previousFocus();
                              });
                            } else {
                              setState(() {
                                con5 = false;
                              });
                            }
                          }, Colors.grey),
                          SizedBox(
                            width: 2.0,
                          ),
                          MeterNumber(myController7, con7, con8,
                              TextInputAction.previous, (_) {
                            if (myController7.text
                                .toString()
                                .trim()
                                .isNotEmpty) {
                              setState(() {
                                con6 = true;
                                FocusScope.of(context).previousFocus();
                              });
                            } else {
                              setState(() {
                                con6 = false;
                              });
                            }
                          }, Colors.grey),
                          SizedBox(
                            width: 2.0,
                          ),
                          MeterNumber(myController8, con8, con9,
                              TextInputAction.previous, (_) {
                            if (myController8.text
                                .toString()
                                .trim()
                                .isNotEmpty) {
                              setState(() {
                                con7 = true;
                              });
                            } else {
                              setState(() {
                                con7 = false;
                              });
                            }
                            FocusScope.of(context).previousFocus();
                          }, Colors.red),
                          SizedBox(
                            width: 2.0,
                          ),
                          MeterNumber(myController9, con9, con10,
                              TextInputAction.previous, (_) {
                            if (myController9.text
                                .toString()
                                .trim()
                                .isNotEmpty) {
                              setState(() {
                                con8 = true;
                              });
                            } else {
                              setState(() {
                                con8 = false;
                              });
                            }
                            FocusScope.of(context).previousFocus();
                          }, Colors.red),
                          SizedBox(
                            width: 2.0,
                          ),
                          MeterNumber(myController10, true, con10,
                              TextInputAction.previous, (_) {
                            if (myController10.text
                                .toString()
                                .trim()
                                .isNotEmpty) {
                              setState(() {
                                con9 = true;
                                FocusScope.of(context).previousFocus();
                              });
                            } else {
                              setState(() {
                                con9 = false;
                              });
                            }
                          }, Colors.red),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          meterImgController.imagePath != null
                              ? Image.file(
                                  meterImgController.imagePath!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/placeholder.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                          MaterialButton(
                              color: Colors.lightBlueAccent,
                              child: Text(
                                _takePhotoLabel,
                                style: const TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                _openImageSource(context, meterImgController);
                              }),
                        ]),
                    SizedBox(
                      height: 18,
                    ),
                    MaterialButton(
                      color: Colors.lightBlueAccent,
                      onPressed: () {
                        String myReadingValue =
                            myController1.text.toString().trim() +
                                myController2.text.toString().trim() +
                                myController3.text.toString().trim() +
                                myController4.text.toString().trim() +
                                myController5.text.toString().trim() +
                                myController6.text.toString().trim() +
                                myController7.text.toString().trim() +
                                myController8.text.toString().trim() +
                                myController9.text.toString().trim() +
                                myController10.text.toString().trim();
                        double myReading = double.parse(myReadingValue) / 1000;
                        //  ShowAlertDialog.showAlertDialog(context);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("BP Number : " +
                                      bpNumberController.text.toString()),
                                  Text("Customer Name : " +
                                      customerNameController.text.toString()),
                                  Text("Customer Address : " +
                                      customerAddressController.text
                                          .toString()),
                                  Text("Meter Number : " +
                                      meterNumberController.text.toString()),
                                  Text("Previous Reading  : " +
                                      previousReadingController.text
                                          .toString()),
                                  Text("New Reading : " +
                                      myReading.toStringAsFixed(3)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton(
                                              child: Text(
                                                "Submit",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.lightBlueAccent),
                                              onPressed: () {
                                                subMethod();
                                                if (actualResult! >= 0) {
                                                  if (actualResult! > 5 &&
                                                      actualResult! < 25) {
                                                    print("Greater then 25");
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return CustomDialogBox(
                                                              msg:
                                                                  "Reading is Ok",
                                                              myReading:
                                                                  actualResult
                                                                      .toString(),
                                                              onPressed: () {
                                                                onClick();
                                                              });
                                                        });
                                                  } else if (actualResult! <
                                                      5) {
                                                    print("less then 5");
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return CustomDialogBox(
                                                              msg:
                                                                  " Less then 5",
                                                              myReading:
                                                                  actualResult
                                                                      .toString(),
                                                              onPressed: () {
                                                                onClick();
                                                              });
                                                        });
                                                  } else {
                                                    print("25--->" +
                                                        " Greater then 25");
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return CustomDialogBox(
                                                              msg:
                                                                  " Greater then 25",
                                                              myReading:
                                                                  actualResult
                                                                      .toString(),
                                                              onPressed: () {
                                                                onClick();
                                                              });
                                                        });
                                                  }
                                                } else {
                                                  print(
                                                      "Negative value is not Valid");
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return CustomDialogBox(
                                                            msg:
                                                                "Negative value is not Valid",
                                                            myReading:
                                                                actualResult
                                                                    .toString(),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            });
                                                      });
                                                }
                                              },
                                            ),
                                            TextButton(
                                              child: Text("Edit",
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.lightBlueAccent),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        )),
                                  )
                                ],
                              ));
                            });
                      },
                      child: Text("Preview",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          (progressBar)
              ? Center(
                  child: Container(
                    width: 200,
                    height: 100,
                    alignment: Alignment.center,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Waiting...")
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Future<void> _openImageSource(
    BuildContext mContext,
    PhotoController controller,
  ) async {
    return showDialog<void>(
      context: mContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose One'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                    title: const Text('Gallery'),
                    onTap: () {
                      Navigator.of(context).pop();
                      getImage(controller, ImageSource.gallery)
                          .then((value) => setState(() {}));
                    }),
                ListTile(
                  title: const Text('Camera'),
                  onTap: () {
                    Navigator.of(context).pop();
                    getImage(controller, ImageSource.camera)
                        .then((value) => setState(() {}));
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> getImage(
      PhotoController photoController, ImageSource imageSource) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
          source: imageSource,
          maxHeight: 400,
          maxWidth: 300,
          imageQuality: 100);
      setState(() {
        if (pickedFile != null) {
          if (photoController != null) {
            photoController.imagePath = File(pickedFile.path);
          }
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      CustomToast.showToast(e.toString());
    }
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
        buildAlertDialog("Internet connection cannot be established!");
        break;
      default:
        setState(() => isOffline = true);
        break;
    }
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    try {
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
                                "Please! proceed by connecting to a internet connection",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.red),
                              ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        onPressed: () {
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        },
                        child: Text("CLOSE THE APP",
                            style: TextStyle(color: Colors.white)),
                      ),
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        onPressed: () {
                          if (isOffline) {
                            setState(() {
                              canProceed = false;
                            });
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: Text("PROCEED",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  );
                });
          }
        }));
  }

  locationConnect() async {
    Position position = await _getGeoLocationPosition();
    setState(() {
      locationLat = '${position.latitude}';
      locationLong = ' ${position.longitude}';
      print("locationLat-->" + locationLat);
      print("locationLong-->" + locationLong);
      //   GetAddressFromLatLong(position);
    });
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
