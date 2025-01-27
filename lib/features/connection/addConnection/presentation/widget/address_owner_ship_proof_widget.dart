import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/connection/addConnection/domain/bloc/add_connection_bloc.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/ownership_proof_model.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:customer_connect/utills/commonWidgets/dropdown_widget.dart';
import 'package:flutter/material.dart';

class AddressOwnerShipProofWidget extends StatelessWidget {
  final FetchAddConnectionDataState dataState;

  const AddressOwnerShipProofWidget({super.key, required this.dataState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _addressOwnerShipProofDropDown(dataState: dataState, context: context),
        _verticalSize(context: context),
        Row(
          children: [
            _addressOwnerShipFrontProofFile(dataState: dataState, context: context),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            _addressOwnerShipBackProofFile(dataState: dataState, context: context),
          ],
        ),
        _verticalSize(context: context),
        _kycDoc2Controller(dataState: dataState),
      ],
    );
  }

  Widget _addressOwnerShipProofDropDown({required FetchAddConnectionDataState dataState, required BuildContext context}) {
    return DropdownWidget(
      isRequired: true,
      hint: AppString.addressOwnerShipProof,
      dropdownValue: dataState.ownerShipProofData.name != null
          ? dataState.ownerShipProofData
          : null,
      onChanged: (value) {
        BlocProvider.of<AddConnectionBloc>(context).add(OwnerShipProofEvent(
          ownerShipProofData: value,
        ));
      },
      items: dataState.ownerShipProofList.map<DropdownMenuItem<OwnerShipProofModel>>(
              (OwnerShipProofModel ownerShipProofData) {
            return DropdownMenuItem<OwnerShipProofModel>(
              value: ownerShipProofData,
              child: Text(ownerShipProofData.name.toString()),
            );
          }).toList(),
    );
  }

  Widget _addressOwnerShipFrontProofFile({required FetchAddConnectionDataState dataState, required BuildContext context}) {
    return dataState.frontSideFile2.path.isEmpty ?
    SizedBox(
      height: MediaQuery.of(context).size.width * 0.25,
      width: MediaQuery.of(context).size.width * 0.25,
      child: DottedBorder(
        color: AppColor.themeColor,
        child: InkWell(
            onTap: () {
              mediaType(context: context,
                  onPressedCamera: () {
                    Navigator.pop(context);
                  },
                  onPressedGallery:() {
                    Navigator.pop(context);
                  }
              );
            },
            child: Padding(
              padding: EdgeInsets.all( MediaQuery.of(context).size.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.perm_media_outlined,
                    color: AppColor.themeSecondary,
                    size: MediaQuery.of(context).size.width * 0.07,),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                  TextWidget(AppString.frontSide,
                    textAlign: TextAlign.center,
                    fontSize: AppFont.font_10,),
                ],),
            )
        ),
      ),
    ) : SizedBox(
      height: MediaQuery.of(context).size.width * 0.25,
      width: MediaQuery.of(context).size.width * 0.25,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(dataState.frontSideFile2, fit: BoxFit.fill,),
            ),
          ),
          Positioned(
            top: -1,
            right: -1,
            child: InkWell(
                onTap: ()  {

                },
                child: Icon(Icons.close,color: Colors.red[500],)),
          ),
        ],
      ),
    );
  }

  Widget _addressOwnerShipBackProofFile(
      {required FetchAddConnectionDataState dataState, required BuildContext context}) {
    return dataState.backSideFile2.path.isEmpty ?
    SizedBox(
      height: MediaQuery.of(context).size.width * 0.25,
      width: MediaQuery.of(context).size.width * 0.25,
      child: DottedBorder(
        color: AppColor.themeColor,
        child: InkWell(
            onTap: () {
              mediaType(context: context,
                  onPressedCamera: () {
                    Navigator.pop(context);
                  },
                  onPressedGallery:() {
                    Navigator.pop(context);
                  }
              );
            },
            child: Padding(
              padding: EdgeInsets.all( MediaQuery.of(context).size.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.perm_media_outlined,
                    color: AppColor.themeSecondary,
                    size: MediaQuery.of(context).size.width * 0.07,),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                  TextWidget(AppString.backSide,
                    textAlign: TextAlign.center,
                    fontSize: AppFont.font_10,),
                ],),
            )
        ),
      ),
    ) : SizedBox(
      height: MediaQuery.of(context).size.width * 0.25,
      width: MediaQuery.of(context).size.width * 0.25,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(dataState.backSideFile2, fit: BoxFit.fill,),
            ),
          ),
          Positioned(
            top: -1,
            right: -1,
            child: InkWell(
                onTap: ()  {

                },
                child: Icon(Icons.close,color: Colors.red[500],)),
          ),
        ],
      ),
    );
  }

  Widget _kycDoc2Controller({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      textInputType: TextInputType.text,
      labelText: AppString.kycDoc2,
      controller: dataState.kycDoc2Controller,
    );
  }

  Widget _verticalSize({required BuildContext context}) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.05,
    );
  }
}
