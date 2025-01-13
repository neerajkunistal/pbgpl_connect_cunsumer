import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/connection/addConnection/domain/bloc/add_connection_bloc.dart';
import 'package:customer_connect/features/connection/addConnection/domain/model/identification_proof_model.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:customer_connect/utills/commonWidgets/dropdown_widget.dart';
import 'package:flutter/material.dart';

class IdentificationProofWidget extends StatelessWidget {
  final FetchAddConnectionDataState dataState;
  const IdentificationProofWidget({super.key, required this.dataState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _identificationProofDropDown(dataState: dataState, context: context),
        _verticalSize(context: context),
        Row(
          children: [
            _identificationFrontProofFile(dataState: dataState, context: context),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            _identificationBackProofFile(dataState: dataState, context: context),
          ],
        ),
        _verticalSize(context: context),
        _kycDoc1Controller(dataState: dataState),
      ],
    );
  }

  Widget _identificationProofDropDown({required FetchAddConnectionDataState dataState, required BuildContext context}) {
    return DropdownWidget(
      isRequired: true,
      hint: AppString.identificationProof,
      dropdownValue: dataState.identificationProofData.name != null
          ? dataState.identificationProofData
          : null,
      onChanged: (value) {
        BlocProvider.of<AddConnectionBloc>(context).add(IdentificationProofEvent(
          identificationProofData: value,
        ));
      },
      items: dataState.identificationProofList.map<DropdownMenuItem<IdentificationProofModel>>(
              (IdentificationProofModel identificationProofData) {
            return DropdownMenuItem<IdentificationProofModel>(
              value: identificationProofData,
              child: Text(identificationProofData.name.toString()),
            );
          }).toList(),
    );
  }

  Widget _identificationFrontProofFile({required FetchAddConnectionDataState dataState, required BuildContext context}) {
    return dataState.frontSideFile1.path.isEmpty ?
    SizedBox(
      height: MediaQuery.of(context).size.width * 0.25,
      width: MediaQuery.of(context).size.width * 0.25,
      child: DottedBorder(
        color: AppColor.themeColor,
        child: Align(
          child: InkWell(
              onTap: () {
                mediaType(context: context,
                    onPressedCamera: () {
                      BlocProvider.of<AddConnectionBloc>(context)
                          .add(FrontSide1Event(context: context, mediaType: 1));
                      Navigator.pop(context);
                    },
                    onPressedGallery:() {
                      BlocProvider.of<AddConnectionBloc>(context)
                          .add(FrontSide1Event(context: context, mediaType: 2));
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
      ),
    ) : SizedBox(
      height: MediaQuery.of(context).size.width * 0.25,
      width: MediaQuery.of(context).size.width * 0.25,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(dataState.frontSideFile1, fit: BoxFit.fill,),
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

  Widget _identificationBackProofFile(
      {required FetchAddConnectionDataState dataState, required BuildContext context}) {
    return dataState.backSideFile1.path.isEmpty ?
    SizedBox(
      height: MediaQuery.of(context).size.width * 0.25,
      width: MediaQuery.of(context).size.width * 0.25,
      child: DottedBorder(
        color: AppColor.themeColor,
        child: InkWell(
            onTap: () {
              mediaType(context: context,
                  onPressedCamera: () {
                    BlocProvider.of<AddConnectionBloc>(context)
                        .add(BackSide1Event(context: context, mediaType: 1));
                    Navigator.pop(context);
                  },
                  onPressedGallery:() {
                    BlocProvider.of<AddConnectionBloc>(context)
                        .add(BackSide1Event(context: context, mediaType: 2));
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
              child: Image.file(dataState.backSideFile1, fit: BoxFit.fill,),
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

  Widget _kycDoc1Controller({required FetchAddConnectionDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      textInputType: TextInputType.text,
      labelText: AppString.kycDoc1,
      controller: dataState.kycDoc1Controller,
    );
  }

  Widget _verticalSize({required BuildContext context}) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.05,
    );
  }
}
