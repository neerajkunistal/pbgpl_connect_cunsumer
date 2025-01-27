import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/connection/addConnection/domain/bloc/add_connection_bloc.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/coocking_fuel_model.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/district_model.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/guardian_model.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/property_category_model.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/property_class_model.dart';
import 'package:customer_connect/features/connection/addConnection/presentation/widget/address_owner_ship_proof_widget.dart';
import 'package:customer_connect/features/connection/addConnection/presentation/widget/identification_proof_widget.dart';
import 'package:customer_connect/features/connection/addConnection/presentation/widget/owner_ship_type_proof_widget.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_line_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dropdown_search_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dropdown_widget.dart';
import 'package:flutter/material.dart';

class AddConnectionPage extends StatefulWidget {
  const AddConnectionPage({super.key});

  @override
  State<AddConnectionPage> createState() => _AddConnectionPageState();
}

class _AddConnectionPageState extends State<AddConnectionPage> {

  @override
  void initState() {
    BlocProvider.of<AddConnectionBloc>(context).add(
        AddConnectionPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: AppColor.themeSecondary
        ),
        title: TextWidget(
          AppString.newConnection,

          color: AppColor.themeSecondary,
          fontWeight: FontWeight.w600,
          fontSize: AppFont.font_16,
        ),
      ),
      body: BlocBuilder<AddConnectionBloc, AddConnectionState>(
        builder: (context, state) {
          if(state is FetchAddConnectionDataState) {
            return _builder(dataState: state);
          } else {
            return const Center(child:CenterLoaderWidget());
          }
        },
      ),
    );
  }

  Widget _builder({required FetchAddConnectionDataState dataState}) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _verticalSize(),
            _changeAreaDropDown(dataState: dataState),
            _verticalSize(),
            _areaDropDown(dataState: dataState),
            _verticalSize(),
            DottedDividerLine(),
            _verticalSize(),
            Align(
                alignment: Alignment.topLeft,
                child: TextWidget("Personal Info :",
                  color: AppColor.themeSecondary,
                  fontWeight: FontWeight.w700,)),
            _verticalSize(),
            _mobileNumberController(dataState: dataState),
            _verticalSize(),
            _alternateNumberController(dataState: dataState),
            _verticalSize(),
            _firstNameController(dataState: dataState),
            _verticalSize(),
            _middleNameController(dataState: dataState),
            _verticalSize(),
            _sureNameController(dataState: dataState),
            _verticalSize(),
            _guardianDropDown(dataState: dataState),
            _verticalSize(),
            _guardianNameController(dataState: dataState),
            _verticalSize(),
            _emailIdController(dataState: dataState),
            _verticalSize(),
            DottedDividerLine(),
            _verticalSize(),
            Align(
                alignment: Alignment.topLeft,
                child: TextWidget("Property Info :",
                  color: AppColor.themeSecondary,
                  fontWeight: FontWeight.w700,)),
            _verticalSize(),
            _propertyCategoryDropDown(dataState: dataState),
            _verticalSize(),
            _propertyClassDropDown(dataState: dataState),
            _verticalSize(),
            _buildingNumberController(dataState: dataState),
            _verticalSize(),
            _houseNumberController(dataState: dataState),
            _verticalSize(),
            _colonyApartmentController(dataState: dataState),
            _verticalSize(),
            _laneStreetNameController(dataState: dataState),
            _verticalSize(),
            _townController(dataState: dataState),
            _verticalSize(),
            _districtDropDown(dataState: dataState),
            _verticalSize(),
            _pinCodeController(dataState: dataState),
            _verticalSize(),
            DottedDividerLine(),
            _verticalSize(),
            _cookingFuelDropDown(dataState: dataState),
            _verticalSize(),
            _noOfKitchenController(dataState: dataState),
            _verticalSize(),
            _noOfBathroomController(dataState: dataState),
            _verticalSize(),
            _noOfFamilyMemberController(dataState: dataState),
            _verticalSize(),
            DottedDividerLine(),
            _verticalSize(),
            IdentificationProofWidget(dataState: dataState),
            _verticalSize(),
            DottedDividerLine(),
            _verticalSize(),
            AddressOwnerShipProofWidget(dataState: dataState),
            _verticalSize(),
            DottedDividerLine(),
            _verticalSize(),
            OwnerShipTypeProofWidget(dataState: dataState),
            _verticalSize(),
            _submitButton(dataState: dataState),
            _verticalSize(),
          ],
        ),
      ),
    );
  }

  Widget _changeAreaDropDown({required FetchAddConnectionDataState dataState}) {
    return DropDownSearchWidget(
      isRequired: true,
      selectedItem:
      dataState.changeAreaData.name != null ? dataState.changeAreaData : null,
      hint: AppString.changeArea,
      items: dataState.areaList,
      itemAsString: (changeAreaData) => changeAreaData.name.toString(),
      onChanged: (value) {
        BlocProvider.of<AddConnectionBloc>(context)
            .add(ChangeAreaEvent(areaData: value));
      },
    );
  }

  Widget _areaDropDown({required FetchAddConnectionDataState dataState}) {
    return DropDownSearchWidget(
      isRequired: true,
      selectedItem:
      dataState.areaData.name != null ? dataState.areaData : null,
      hint: AppString.area,
      items: dataState.areaList,
      itemAsString: (areaData) => areaData.name.toString(),
      onChanged: (value) {
        BlocProvider.of<AddConnectionBloc>(context)
            .add(AreaEvent(areaData: value));
      },
    );
  }

  Widget _mobileNumberController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      labelText: AppString.mobileNumber,
      controller: dataState.mobileNumberController,
    );
  }

  Widget _alternateNumberController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.alternateNumber,
      controller: dataState.alternateNumberController,
    );
  }

  Widget _firstNameController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      labelText: AppString.firstName,
      controller: dataState.firstNameController,
    );
  }

  Widget _middleNameController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.middleName,
      controller: dataState.middleNameController,
    );
  }

  Widget _sureNameController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      labelText: AppString.surname,
      controller: dataState.sureNameController,
    );
  }

  Widget _guardianDropDown({required FetchAddConnectionDataState dataState}) {
    return DropdownWidget(
      isRequired: true,
      hint: AppString.selectGuardian,
      dropdownValue: dataState.guardianData.name != null
          ? dataState.guardianData
          : null,
      onChanged: (value) {
        BlocProvider.of<AddConnectionBloc>(context).add(GuardianEvent(
          guardianData: value,
        ));
      },
      items: dataState.guardianList.map<DropdownMenuItem<GuardianModel>>(
              (GuardianModel guardianData) {
            return DropdownMenuItem<GuardianModel>(
              value: guardianData,
              child: Text(guardianData.name.toString()),
            );
          }).toList(),
    );
  }

  Widget _guardianNameController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      labelText: AppString.guardianName,
      controller: dataState.guardianNameController,
    );
  }

  Widget _emailIdController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.emailID,
      controller: dataState.emailIdController,
    );
  }

  Widget _propertyCategoryDropDown({required FetchAddConnectionDataState dataState}) {
    return DropdownWidget(
      isRequired: true,
      hint: AppString.propertyCategory,
      dropdownValue: dataState.propertyCategoryData.name != null
          ? dataState.propertyCategoryData
          : null,
      onChanged: (value) {
        BlocProvider.of<AddConnectionBloc>(context).add(PropertyCategoryEvent(
          propertyCategoryData: value,
        ));
      },
      items: dataState.propertyCategoryList.map<DropdownMenuItem<PropertyCategoryModel>>(
              (PropertyCategoryModel propertyCategoryData) {
            return DropdownMenuItem<PropertyCategoryModel>(
              value: propertyCategoryData,
              child: Text(propertyCategoryData.name.toString()),
            );
          }).toList(),
    );
  }

  Widget _propertyClassDropDown({required FetchAddConnectionDataState dataState}) {
    return DropdownWidget(
      hint: AppString.propertyClass,
      dropdownValue: dataState.propertyClassData.name != null
          ? dataState.propertyClassData
          : null,
      onChanged: (value) {
        BlocProvider.of<AddConnectionBloc>(context).add(PropertyClassEvent(
          propertyClassData: value,
        ));
      },
      items: dataState.propertyClassList.map<DropdownMenuItem<PropertyClassModel>>(
              (PropertyClassModel propertyClassData) {
            return DropdownMenuItem<PropertyClassModel>(
              value: propertyClassData,
              child: Text(propertyClassData.name.toString()),
            );
          }).toList(),
    );
  }

  Widget _buildingNumberController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.buildingNumber,
      controller: dataState.buildingNumberController,
    );
  }

  Widget _houseNumberController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      labelText: AppString.houseNumber,
      controller: dataState.houseNumberController,
    );
  }

  Widget _colonyApartmentController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.colonySocietyApartment,
      controller: dataState.colonyApartmentController,
    );
  }

  Widget _laneStreetNameController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      labelText: AppString.laneStreetName,
      controller: dataState.laneStreetNameController,
    );
  }

  Widget _townController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.town,
      controller: dataState.townController,
    );
  }

  Widget _districtDropDown({required FetchAddConnectionDataState dataState}) {
    return DropdownWidget(
      isRequired: true,
      hint: AppString.district,
      dropdownValue: dataState.districtData.name != null
          ? dataState.districtData
          : null,
      onChanged: (value) {
        BlocProvider.of<AddConnectionBloc>(context).add(PropertyDistrictEvent(
          districtData: value,
        ));
      },
      items: dataState.districtList.map<DropdownMenuItem<DistrictModel>>(
              (DistrictModel districtData) {
            return DropdownMenuItem<DistrictModel>(
              value: districtData,
              child: Text(districtData.name.toString()),
            );
          }).toList(),
    );
  }

  Widget _pinCodeController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      labelText: AppString.pinCode,
      controller: dataState.pinCodeController,
    );
  }

  Widget _cookingFuelDropDown({required FetchAddConnectionDataState dataState}) {
    return DropdownWidget(
      hint: AppString.existingCookingFuel,
      dropdownValue: dataState.cookingFuelData.name != null
          ? dataState.cookingFuelData
          : null,
      onChanged: (value) {
        BlocProvider.of<AddConnectionBloc>(context).add(CookingFuelEvent(
          cookingFuelData: value,
        ));
      },
      items: dataState.cookingFuelList.map<DropdownMenuItem<CookingFuelModel>>(
              (CookingFuelModel cookingFuelData) {
            return DropdownMenuItem<CookingFuelModel>(
              value: cookingFuelData,
              child: Text(cookingFuelData.name.toString()),
            );
          }).toList(),
    );
  }

  Widget _noOfKitchenController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      textInputType: TextInputType.number,
      labelText: AppString.noOfKitchen,
      controller: dataState.noOfKitchenController,
    );
  }

  Widget _noOfBathroomController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      textInputType: TextInputType.number,
      labelText: AppString.noOfBathroom,
      controller: dataState.noOfBathroomController,
    );
  }

  Widget _noOfFamilyMemberController({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      textInputType: TextInputType.number,
      labelText: AppString.noOfFamilyMember,
      controller: dataState.noOfFamilyMemberController,
    );
  }




  Widget _submitButton({required FetchAddConnectionDataState dataState}) {
    return dataState.isLoader == false ?
    ButtonWidget(
        text: AppString.submit,
        onPressed: () {

        }
    ): const DottedLoaderWidget();
  }

  Widget _verticalSize() {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.05,
    );
  }
}
