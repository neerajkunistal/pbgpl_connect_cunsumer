import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/area_model.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/coocking_fuel_model.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/district_model.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/guardian_model.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/identification_proof_model.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/owner_type_property_model.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/ownership_proof_model.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/property_category_model.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/property_class_model.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'add_connection_event.dart';
part 'add_connection_state.dart';

class AddConnectionBloc extends Bloc<AddConnectionEvent, AddConnectionState> {

  List<AreaModel> areaList = [];
  AreaModel changeAreaData = AreaModel();
  AreaModel areaData = AreaModel();

  List<GuardianModel> guardianList = [];
  GuardianModel guardianData = GuardianModel();

  List<PropertyCategoryModel> propertyCategoryList = [];
  PropertyCategoryModel propertyCategoryData = PropertyCategoryModel();

  List<PropertyClassModel> propertyClassList = [];
  PropertyClassModel propertyClassData = PropertyClassModel();

  List<DistrictModel> districtList = [];
  DistrictModel districtData = DistrictModel();

  List<CookingFuelModel> cookingFuelList = [];
  CookingFuelModel cookingFuelData = CookingFuelModel();

  List<IdentificationProofModel> identificationProofList = [];
  IdentificationProofModel identificationProofData = IdentificationProofModel();

  List<OwnerShipProofModel> ownerShipProofList = [];
  OwnerShipProofModel ownerShipProofData = OwnerShipProofModel();

  List<OwnerTypePropertyModel> ownerTypePropertyList = [];
  OwnerTypePropertyModel ownerTypePropertyData = OwnerTypePropertyModel();

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController alternateNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController sureNameController = TextEditingController();
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController buildingNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController colonyApartmentController = TextEditingController();
  TextEditingController laneStreetNameController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController noOfKitchenController = TextEditingController();
  TextEditingController noOfBathroomController = TextEditingController();
  TextEditingController noOfFamilyMemberController = TextEditingController();
  TextEditingController kycDoc1Controller = TextEditingController();
  TextEditingController kycDoc2Controller = TextEditingController();
  TextEditingController kycDoc3Controller = TextEditingController();
  File frontSideFile1 = File("");
  File frontSideFile2 = File("");
  File backSideFile1 = File("");
  File backSideFile2 = File("");
  File nocFile = File("");
  bool isLoader = false;

  String acceptConversionPolicy = "";
  String societyAllowsMDPE = "";
  String acceptExtraFillingCoast = "";

  AddConnectionBloc() : super(AddConnectionInitial()) {
    on<AddConnectionPageLoadEvent>(_pageLoad);
    on<ChangeAreaEvent>(_changeArea);
    on<AreaEvent>(_area);
    on<GuardianEvent>(_selectGuardian);
    on<PropertyCategoryEvent>(_selectPropertyCategory);
    on<PropertyClassEvent>(_selectPropertyClass);
    on<PropertyDistrictEvent>(_selectDistrict);
    on<CookingFuelEvent>(_selectCookingFuel);
    on<IdentificationProofEvent>(_selectIdentificationFuel);
    on<OwnerShipProofEvent>(_selectOwnerShipProof);
    on<OwnerShipTypePropertyEvent>(_selectOwnerShipTypeProperty);
    on<AcceptConversionPolicyEvent>(_selectAcceptConversionPolicy);
    on<AcceptExtraCostFillingEvent>(_selectAcceptExtraCostFilling);
    on<SocietyAllowMDPEEvent>(_selectSocietyAllowMDPE);
    on<FrontSide1Event>(_selectFrontSide1);
    on<FrontSide2Event>(_selectFrontSide2);
    on<BackSide1Event>(_selectBackSide1);
    on<BackSide2Event>(_selectBackSide2);
    on<AddConnectionSubmitEvent>(_submit);

  }

  _pageLoad(AddConnectionPageLoadEvent event, emit) async {
    emit(AddConnectionPageLoadState());
    isLoader = false;
    areaList = [];
    districtList = [];
    changeAreaData = AreaModel();
    areaData = AreaModel();
    guardianList = GuardianModel().getData();
    guardianData =  GuardianModel();
    propertyCategoryList = PropertyCategoryModel().getData();
    propertyCategoryData = PropertyCategoryModel();
    propertyClassList = PropertyClassModel().getData();
    propertyClassData = PropertyClassModel();
    districtData = DistrictModel();
    cookingFuelList = CookingFuelModel().getData();
    cookingFuelData = CookingFuelModel();
    identificationProofList = IdentificationProofModel().getData();
    identificationProofData = IdentificationProofModel();
    ownerShipProofList = OwnerShipProofModel().getData();
    ownerShipProofData = OwnerShipProofModel();
    ownerTypePropertyList = OwnerTypePropertyModel().getData();
    ownerTypePropertyData = OwnerTypePropertyModel();
    mobileNumberController.text =  "";
    alternateNumberController.text =  "";
    firstNameController.text =  "";
    middleNameController.text =  "";
    sureNameController.text =  "";
    guardianNameController.text =  "";
    emailIdController.text =  "";
    buildingNumberController.text =  "";
    houseNumberController.text =  "";
    colonyApartmentController.text =  "";
    laneStreetNameController.text =  "";
    townController.text =  "";
    pinCodeController.text =  "";
    noOfKitchenController.text =  "";
    noOfBathroomController.text =  "";
    noOfFamilyMemberController.text =  "";
    kycDoc1Controller.text =  "";
    kycDoc2Controller.text =  "";
    kycDoc3Controller.text =  "";
    frontSideFile1 =  File("");
    frontSideFile2 =  File("");
    backSideFile1 =  File("");
    backSideFile2 =  File("");
    nocFile =  File("");
    acceptConversionPolicy = "";
    societyAllowsMDPE = "";
    acceptExtraFillingCoast = "";
    _eventComplete(emit);
  }

  _changeArea(ChangeAreaEvent event, emit) {
    changeAreaData =  event.areaData;
    _eventComplete(emit);
  }

  _area(AreaEvent event, emit) {
    areaData =  event.areaData;
    _eventComplete(emit);
  }

  _selectGuardian(GuardianEvent event, emit) {
    guardianData = event.guardianData;
    _eventComplete(emit);
  }

  _selectPropertyCategory(PropertyCategoryEvent event, emit) {
    propertyCategoryData =  event.propertyCategoryData;
    _eventComplete(emit);
  }

  _selectPropertyClass(PropertyClassEvent event, emit) {
    propertyClassData =  event.propertyClassData;
    _eventComplete(emit);
  }

  _selectDistrict(PropertyDistrictEvent event, emit) {
    districtData =  event.districtData;
    _eventComplete(emit);
  }

  _selectCookingFuel(CookingFuelEvent event, emit) {
    cookingFuelData =  event.cookingFuelData;
    _eventComplete(emit);
  }

  _selectIdentificationFuel(IdentificationProofEvent event, emit) {
    identificationProofData =  event.identificationProofData;
    _eventComplete(emit);
  }

  _selectOwnerShipProof(OwnerShipProofEvent event, emit) {
    ownerShipProofData = event.ownerShipProofData;
    _eventComplete(emit);
  }

  _selectOwnerShipTypeProperty(OwnerShipTypePropertyEvent event, emit) {
    ownerTypePropertyData =  event.ownerTypePropertyData;
    _eventComplete(emit);
  }

  _selectAcceptConversionPolicy(AcceptConversionPolicyEvent event, emit) {
    acceptConversionPolicy =  event.acceptConversionPolicy;
    _eventComplete(emit);
  }

  _selectAcceptExtraCostFilling(AcceptExtraCostFillingEvent event, emit) {
    acceptExtraFillingCoast =  event.acceptExtraCostFitting;
    _eventComplete(emit);
  }

  _selectSocietyAllowMDPE(SocietyAllowMDPEEvent event, emit) {
    societyAllowsMDPE =  event.societyAllowMDPE;
    _eventComplete(emit);
  }

  _selectFrontSide1(FrontSide1Event event, emit) async {
    int mediaType =  event.mediaType;
    isLoader =  true;
    _eventComplete(emit);
    if(mediaType == 1){
      var res =  await DashboardHelper.cameraPiker(context: event.context);
      if(res !=  null){
        frontSideFile1 =  res ;
      }
    } else if(mediaType == 2){
      var res =  await DashboardHelper.filePiker(context: event.context);
      if(res !=  null){
        frontSideFile1 =  res ;
      }
    }
    isLoader =  false;
    _eventComplete(emit);

  }

  _selectBackSide1(BackSide1Event event, emit) async {
    int mediaType =  event.mediaType;
    isLoader =  true;
    _eventComplete(emit);
    if(mediaType == 1){
      var res =  await DashboardHelper.cameraPiker(context: event.context);
      if(res !=  null){
        backSideFile1 =  res ;
      }
    } else if(mediaType == 2){
      var res =  await DashboardHelper.filePiker(context: event.context);
      if(res !=  null){
        backSideFile1 =  res ;
      }
    }
    isLoader =  false;
    _eventComplete(emit);
  }

  _selectFrontSide2(FrontSide2Event event, emit) async {

    int mediaType =  event.mediaType;
    isLoader =  true;
    _eventComplete(emit);
    if(mediaType == 1){
      var res =  await DashboardHelper.cameraPiker(context: event.context);
      if(res !=  null){
        frontSideFile2 =  res ;
      }
    } else if(mediaType == 2){
      var res =  await DashboardHelper.filePiker(context: event.context);
      if(res !=  null){
        frontSideFile2 =  res ;
      }
    }
    isLoader =  false;
    _eventComplete(emit);
  }

  _selectBackSide2(BackSide2Event event, emit) async {
    int mediaType =  event.mediaType;
    isLoader =  true;
    _eventComplete(emit);
    if(mediaType == 1){
      var res =  await DashboardHelper.cameraPiker(context: event.context);
      if(res !=  null){
        backSideFile2 =  res ;
      }
    } else if(mediaType == 2){
      var res =  await DashboardHelper.filePiker(context: event.context);
      if(res !=  null){
        backSideFile2 =  res ;
      }
    }
    isLoader =  false;
    _eventComplete(emit);

  }

  _submit(AddConnectionSubmitEvent event, emit) async {

  }

  _eventComplete(Emitter<AddConnectionState> emit) {
    emit(FetchAddConnectionDataState(areaList: areaList,
        changeAreaData: changeAreaData,
        areaData: areaData,
        guardianList: guardianList,
        guardianData: guardianData,
        propertyCategoryList: propertyCategoryList,
        propertyCategoryData: propertyCategoryData,
        propertyClassList: propertyClassList,
        propertyClassData: propertyClassData,
        districtList: districtList,
        districtData: districtData,
        cookingFuelList: cookingFuelList,
        cookingFuelData: cookingFuelData,
        identificationProofList: identificationProofList,
        identificationProofData: identificationProofData,
        ownerShipProofList: ownerShipProofList,
        ownerShipProofData: ownerShipProofData,
        ownerTypePropertyList: ownerTypePropertyList,
        ownerTypePropertyData: ownerTypePropertyData,
        mobileNumberController: mobileNumberController,
        alternateNumberController: alternateNumberController,
        firstNameController: firstNameController,
        middleNameController: middleNameController,
        sureNameController: sureNameController,
        guardianNameController: guardianNameController,
        emailIdController: emailIdController,
        buildingNumberController: buildingNumberController,
        houseNumberController: houseNumberController,
        colonyApartmentController: colonyApartmentController,
        laneStreetNameController: laneStreetNameController,
        townController: townController,
        pinCodeController: pinCodeController,
        noOfKitchenController: noOfKitchenController,
        noOfBathroomController: noOfBathroomController,
        noOfFamilyMemberController: noOfFamilyMemberController,
        kycDoc1Controller: kycDoc1Controller,
        kycDoc2Controller: kycDoc2Controller,
        kycDoc3Controller: kycDoc3Controller,
        frontSideFile1: frontSideFile1,
        frontSideFile2: frontSideFile2,
        backSideFile1: backSideFile1,
        backSideFile2: backSideFile2,
        nocFile: nocFile,
        isLoader: isLoader,
        acceptConversionPolicy: acceptConversionPolicy,
        acceptExtraFillingCoast: acceptExtraFillingCoast,
        societyAllowsMDPE: societyAllowsMDPE,
      )
    );
  }
}
