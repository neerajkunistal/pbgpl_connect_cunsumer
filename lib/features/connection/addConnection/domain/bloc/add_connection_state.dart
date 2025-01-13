part of 'add_connection_bloc.dart';

sealed class AddConnectionState extends Equatable {
  const AddConnectionState();
}

final class AddConnectionInitial extends AddConnectionState {
  @override
  List<Object> get props => [];
}

final class AddConnectionPageLoadState extends AddConnectionInitial {
  @override
  List<Object> get props => [];
}

final class FetchAddConnectionDataState extends AddConnectionInitial {
  final List<AreaModel> areaList;
  final AreaModel changeAreaData;
  final AreaModel areaData;
  final List<GuardianModel> guardianList;
  final GuardianModel guardianData;
  final List<PropertyCategoryModel> propertyCategoryList;
  final PropertyCategoryModel propertyCategoryData;
  final List<PropertyClassModel> propertyClassList;
  final PropertyClassModel propertyClassData;
  final List<DistrictModel> districtList;
  final DistrictModel districtData;
  final List<CookingFuelModel> cookingFuelList;
  final CookingFuelModel cookingFuelData;
  final List<IdentificationProofModel> identificationProofList;
  final IdentificationProofModel identificationProofData;
  final List<OwnerShipProofModel> ownerShipProofList;
  final OwnerShipProofModel ownerShipProofData;
  final List<OwnerTypePropertyModel> ownerTypePropertyList;
  final OwnerTypePropertyModel ownerTypePropertyData;
  final TextEditingController mobileNumberController;
  final TextEditingController alternateNumberController;
  final TextEditingController firstNameController;
  final TextEditingController middleNameController;
  final TextEditingController sureNameController;
  final TextEditingController guardianNameController;
  final TextEditingController emailIdController;
  final TextEditingController buildingNumberController;
  final TextEditingController houseNumberController;
  final TextEditingController colonyApartmentController;
  final TextEditingController laneStreetNameController;
  final TextEditingController townController;
  final TextEditingController pinCodeController;
  final TextEditingController noOfKitchenController;
  final TextEditingController noOfBathroomController;
  final TextEditingController noOfFamilyMemberController;
  final TextEditingController kycDoc1Controller;
  final TextEditingController kycDoc2Controller;
  final TextEditingController kycDoc3Controller;
  final File frontSideFile1;
  final File frontSideFile2;
  final File backSideFile1;
  final File backSideFile2;
  final File nocFile;
  final bool isLoader;
  final String acceptConversionPolicy;
  final String societyAllowsMDPE;
  final String acceptExtraFillingCoast;

  FetchAddConnectionDataState({
    required this.areaList,
    required this.changeAreaData,
    required this.areaData,
    required this.guardianList,
    required this.guardianData,
    required this.propertyCategoryList,
    required this.propertyCategoryData,
    required this.propertyClassList,
    required this.propertyClassData,
    required this.districtList,
    required this.districtData,
    required this.cookingFuelList,
    required this.cookingFuelData,
    required this.identificationProofList,
    required this.identificationProofData,
    required this.ownerShipProofList,
    required this.ownerShipProofData,
    required this.ownerTypePropertyList,
    required this.ownerTypePropertyData,
    required this.mobileNumberController,
    required this.alternateNumberController,
    required this.firstNameController,
    required this.middleNameController,
    required this.sureNameController,
    required this.guardianNameController,
    required this.emailIdController,
    required this.buildingNumberController,
    required this.houseNumberController,
    required this.colonyApartmentController,
    required this.laneStreetNameController,
    required this.townController,
    required this.pinCodeController,
    required this.noOfKitchenController,
    required this.noOfBathroomController,
    required this.noOfFamilyMemberController,
    required this.kycDoc1Controller,
    required this.kycDoc2Controller,
    required this.kycDoc3Controller,
    required this.frontSideFile1,
    required this.frontSideFile2,
    required this.backSideFile1,
    required this.backSideFile2,
    required this.nocFile,
    required this.isLoader,
    required this.acceptConversionPolicy,
    required this.acceptExtraFillingCoast,
    required this.societyAllowsMDPE,
  });

  @override
  List<Object> get props => [
        areaList,
        changeAreaData,
        areaData,
        guardianList,
        guardianData,
        propertyCategoryList,
        propertyCategoryData,
        propertyClassList,
        propertyClassData,
        districtList,
        districtData,
        cookingFuelList,
        cookingFuelData,
        identificationProofList,
        identificationProofData,
        ownerShipProofList,
        ownerShipProofData,
        ownerTypePropertyList,
        ownerTypePropertyData,
        mobileNumberController,
        alternateNumberController,
        firstNameController,
        middleNameController,
        sureNameController,
        guardianNameController,
        emailIdController,
        buildingNumberController,
        houseNumberController,
        colonyApartmentController,
        laneStreetNameController,
        townController,
        pinCodeController,
        noOfKitchenController,
        noOfBathroomController,
        noOfFamilyMemberController,
        kycDoc1Controller,
        kycDoc2Controller,
        kycDoc3Controller,
        frontSideFile1,
        frontSideFile2,
        backSideFile1,
        backSideFile2,
        nocFile,
        isLoader,
        acceptConversionPolicy,
        acceptExtraFillingCoast,
        societyAllowsMDPE,
      ];
}
