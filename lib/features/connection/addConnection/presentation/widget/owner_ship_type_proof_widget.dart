import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/connection/addConnection/domain/bloc/add_connection_bloc.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/owner_type_property_model.dart';
import 'package:customer_connect/utills/commonWidgets/dropdown_widget.dart';
import 'package:flutter/material.dart';

class OwnerShipTypeProofWidget extends StatelessWidget {
  final FetchAddConnectionDataState dataState;

  const OwnerShipTypeProofWidget({super.key, required this.dataState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ownerShipTypeProofDropDown(dataState: dataState, context: context),
        _verticalSize(context: context),
        _acceptConversionPolicyDropDown(dataState: dataState, context: context),
        _verticalSize(context: context),
        _acceptExtraFittingCostDropDown(dataState: dataState, context: context),
        _verticalSize(context: context),
        _societyAllowsMDPEDropDown(dataState: dataState, context: context)
      ],
    );
  }

  Widget _ownerShipTypeProofDropDown(
      {required FetchAddConnectionDataState dataState,
      required BuildContext context}) {
    return DropdownWidget(
      hint: AppString.ownerShipTypeProperty,
      dropdownValue: dataState.ownerTypePropertyData.name != null
          ? dataState.ownerTypePropertyData
          : null,
      onChanged: (value) {
        BlocProvider.of<AddConnectionBloc>(context)
            .add(OwnerShipTypePropertyEvent(
          ownerTypePropertyData: value,
        ));
      },
      items: dataState.ownerTypePropertyList
          .map<DropdownMenuItem<OwnerTypePropertyModel>>(
              (OwnerTypePropertyModel ownerTypePropertyData) {
        return DropdownMenuItem<OwnerTypePropertyModel>(
          value: ownerTypePropertyData,
          child: Text(ownerTypePropertyData.name.toString()),
        );
      }).toList(),
    );
  }

  Widget _acceptConversionPolicyDropDown(
      {required FetchAddConnectionDataState dataState,
      required BuildContext context}) {
    return DropdownWidget(
      isRequired: true,
      hint: "Accept Conversion Policy",
      dropdownValue: dataState.acceptConversionPolicy.isNotEmpty
          ? dataState.acceptConversionPolicy
          : null,
      onChanged: (value) {
        BlocProvider.of<AddConnectionBloc>(context)
            .add(AcceptConversionPolicyEvent(
          acceptConversionPolicy: value,
        ));
      },
      items: ['Yes', 'No', 'NA'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _acceptExtraFittingCostDropDown(
      {required FetchAddConnectionDataState dataState,
      required BuildContext context}) {
    return DropdownWidget(
      isRequired: true,
      hint: "Accept Extra Fitting Cost",
      dropdownValue: dataState.acceptExtraFillingCoast.isNotEmpty
          ? dataState.acceptExtraFillingCoast
          : null,
      onChanged: (value) {
        BlocProvider.of<AddConnectionBloc>(context)
            .add(AcceptExtraCostFillingEvent(
          acceptExtraCostFitting: value,
        ));
      },
      items: ['Yes', 'No', 'NA'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _societyAllowsMDPEDropDown(
      {required FetchAddConnectionDataState dataState,
      required BuildContext context}) {
    return DropdownWidget(
      hint: "Society Allows MDPE",
      dropdownValue: dataState.societyAllowsMDPE.isNotEmpty
          ? dataState.societyAllowsMDPE
          : null,
      onChanged: (value) {
        BlocProvider.of<AddConnectionBloc>(context)
            .add(SocietyAllowMDPEEvent(
          societyAllowMDPE: value,
        ));
      },
      items: [
        'Yes',
        'No',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _verticalSize({required BuildContext context}) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.05,
    );
  }
}
