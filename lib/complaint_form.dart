import 'dart:async';
import 'dart:io';

import 'package:customer_connect/models/get_sub_category_model.dart';
import 'package:customer_connect/utills/Constants.dart';
import 'package:customer_connect/utills/global_constant.dart';
import 'package:customer_connect/utills/launch_mobile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/complaint_save_model.dart';
import 'models/get_category_model.dart';
import 'service/api_server.dart';
import 'utills/common_widget/custom_toast.dart';

class ComplaintForm extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<ComplaintForm> {
  String schema = '';
  String dmaId = '';
  File? _profileImage;
  bool isLoading = false;
  final picker = ImagePicker();
  String profileImagePath = '';
  int _selectedIndex = 0;
  GetCategoryData? selectGetCategory;
  GetSubCategoryData? selectGetSubCategory;
  String? dataList;
  List<GetCategoryData> categoryList = [];
  List<GetSubCategoryData> subCategoryList = [];
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController descriptionController = new TextEditingController();

  ApiIntegration? apiIntegration;
  GetCategoryRequestModel? getCategoryRequestModel;
  GetSubCategoryRequestModel? getSubCategoryRequestModel;
  ComplaintSaveRequestModel? complaintSaveRequestModel;
  PhotoController meterPhotoContrller = new PhotoController();

  @override
  void initState() {
    super.initState();
    apiIntegration = ApiIntegration();
    loadData();
  }

  loadData() async {
    await getData();
    fetchGetCategory();
  }

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      schema = pref.getString(GlobalConstants.schema) ?? "";
      dmaId = pref.getString(GlobalConstants.dmaId) ?? "";
      print("schema--->" + schema);
      print("dmaId--->" + dmaId);
    });
  }

  fetchGetCategory() async {
    getCategoryRequestModel = GetCategoryRequestModel(
      schema: schema,
    );
    final res = await apiIntegration!.apiGetCategory(getCategoryRequestModel!);
    setState(() {
      categoryList = res!.data!;
    });
    if (res != null) {
      print("success");
    } else {
      print("failed");
    }
  }

  fetchGetSubCategory(String categoryId) async {
    getSubCategoryRequestModel = GetSubCategoryRequestModel(
      schema: schema,
      categoryId: categoryId,
    );
    final res =
        await apiIntegration!.apiGetSubCategory(getSubCategoryRequestModel!);
    setState(() {
      subCategoryList = res!.data!;
    });
    if (res != null) {
      print("success");
    } else {
      print("failed");
    }
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
        title: Text("Complaint Form",
            style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Complaint Category',
                      style: headingStyle,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    child: DropdownButton<GetCategoryData>(
                      onChanged: (val) {
                        setState(() {
                          selectGetCategory = val;
                          selectGetSubCategory = null;
                          subCategoryList.clear();
                          fetchGetSubCategory(selectGetCategory!.id!);
                        });
                        print(val?.id);
                      },
                      value: selectGetCategory,
                      underline: const SizedBox(),
                      hint: const Text('Select'),
                      icon: const Icon(Icons.arrow_drop_down),
                      isExpanded: true,
                      items: categoryList.map((item) {
                        return DropdownMenuItem<GetCategoryData>(
                          child: Text(item.title!),
                          value: item,
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Customer Sub Category',
                      style: headingStyle,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    child: DropdownButton<GetSubCategoryData>(
                      onChanged: (val) {
                        setState(() {
                          selectGetSubCategory = val;
                        });
                        print(val?.id);
                      },
                      value: selectGetSubCategory,
                      underline: const SizedBox(),
                      hint: const Text('Select'),
                      icon: const Icon(Icons.arrow_drop_down),
                      isExpanded: true,
                      items: subCategoryList.map((item) {
                        return DropdownMenuItem<GetSubCategoryData>(
                          child: Text(item.title!),
                          value: item,
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Description',
                      style: headingStyle,
                    ),
                  ),
                  TextField(
                      controller: descriptionController,
                      maxLines: 5,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          labelStyle: greyHeadingStyle,
                          labelText: "",
                          border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: _profileImage == null
                              ? profileImagePath.isEmpty
                                  ? DottedBorder(
                                      padding: EdgeInsets.all(20),
                                      borderType: BorderType.Circle,
                                      dashPattern: [6, 3],
                                      color: greyColor,
                                      child: Image.asset(
                                        'assets/images/placeholder.png',
                                        width: 60,
                                        height: 60,
                                      ),
                                    )
                                  : CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(profileImagePath),
                                      radius: 40,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              blackColor.withOpacity(0.7),
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.delete_outlined,
                                                color:
                                                    whiteColor.withOpacity(0.7),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  profileImagePath = "";
                                                });
                                              }),
                                        ),
                                      ),
                                    )
                              : CircleAvatar(
                                  backgroundImage: FileImage(_profileImage!),
                                  radius: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          blackColor.withOpacity(0.7),
                                      child: IconButton(
                                          icon: Icon(Icons.delete_outlined,
                                              color:
                                                  whiteColor.withOpacity(0.7)),
                                          onPressed: () {
                                            setState(() {
                                              _profileImage = null;
                                            });
                                          }),
                                    ),
                                  ),
                                )),
                      InkWell(
                          onTap: () {
                            _showPicker(context, meterPhotoContrller);
                          },
                          child: Text(
                            'Attached Doc',
                            style: headingStyle,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                      ),
                      onPressed: () {
                        fetchComplaintSave();
                      },
                      child: Text("Continue")),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          (isLoading)
              ? Container(
                  color: Colors.white60,
                  child: Center(
                    child: Card(
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Wrap(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5,
                              ),
                              child: SizedBox(
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                ),
                                height: 20.0,
                                width: 20.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 5),
                              child: Text(
                                'Wait..',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container()
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

  fetchComplaintSave() async {
    setState(() {
      isLoading = true;
    });
    complaintSaveRequestModel = ComplaintSaveRequestModel(
      schema: schema,
      dmaId: dmaId,
      complainCat: selectGetCategory!.id!,
      complainSubCat: selectGetSubCategory!.id!,
      description: descriptionController.text.toString(),
      priority: "0",
      attachedDoc: "",
    );
    final res =
        await apiIntegration!.apiComplaintSave(complaintSaveRequestModel!);
    if (res != null) {
      setState(() {
        isLoading = false;
      });
      print("success");
      CustomToast.showToast(res.data!);
      clearData();
      Navigator.of(context).pop('Refresh');
    } else {
      setState(() {
        isLoading = false;
      });
      CustomToast.showToast(res.data!);
    }
  }

  Future getProfilePhoto() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  clearData() {
    selectGetCategory!.id = null;
    selectGetSubCategory!.id = null;
    descriptionController.clear();
    meterPhotoContrller = PhotoController();
  }

  void _showPicker(context, PhotoController photoContrller) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getProfilePhoto();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageGellery(photoContrller, ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  getImageGellery(PhotoController controller, ImageSource imgSource) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: imgSource, maxHeight: 100, maxWidth: 100, imageQuality: 100);
    setState(() {
      _profileImage = File(pickedFile!.path);
    });
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

class PhotoController {
  File? imagePath;
}
