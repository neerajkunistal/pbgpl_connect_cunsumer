import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:customer_connect/features/disconnection/addDisconnection/domain/bloc/add_disconnection_bloc.dart';
import 'package:customer_connect/features/disconnection/addDisconnection/domain/model/disconnection_reason_type_model.dart';
import 'package:customer_connect/features/disconnection/addDisconnection/domain/model/disconnection_type_model.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dropdown_widget.dart';
import 'package:customer_connect/utills/res/app_icon.dart';
import 'package:flutter/material.dart';

class AddDisconnectionPage extends StatefulWidget {
  const AddDisconnectionPage({super.key});

  @override
  State<AddDisconnectionPage> createState() => _AddDisconnectionPageState();
}

class _AddDisconnectionPageState extends State<AddDisconnectionPage> {

  @override
  void initState() {
    BlocProvider.of<AddDisconnectionBloc>(context)
        .add(AddDisconnectionPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.themeSecondary),
        title: TextWidget(
          AppString.addDisconnection,
          color: AppColor.themeSecondary,
          fontWeight: FontWeight.w600,
          fontSize: AppFont.font_16,
        ),
      ),
      body: BlocBuilder<AddDisconnectionBloc, AddDisconnectionState>(
        builder: (context, state) {
          if (state is FetchAddDisconnectionDataState) {
            return _buildWidget(dataState: state);
          } else {
            return const Center(child: CenterLoaderWidget());
          }
        },
      ),
    );
  }

  Widget _buildWidget({required FetchAddDisconnectionDataState dataState}) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _verticalSize(),
              _bpNumberNumberWidget(dataState: dataState),
              _verticalSize(),
              _disconnectionTypeDropDown(dataState: dataState),
              _verticalSize(),
              _requestDateController(dataState: dataState),
              _verticalSize(),
              _disconnectionRequestDateController(dataState: dataState),
              _verticalSize(),
              _disconnectionReasonTypeDropDown(dataState: dataState),

              dataState.disconnectionReasonTypeData.id.toString() == "5" ?
              _verticalSize() : const SizedBox.shrink(),

              dataState.disconnectionReasonTypeData.id.toString() == "5" ?
              _disconnectionReasonControllerController(dataState: dataState) : const SizedBox.shrink(),


              _verticalSize(),
              _file(dataState: dataState),
              _verticalSize(),
              _submitButton(dataState: dataState),
              _verticalSize(),
              _verticalSize(),
            ],
          ),
        )
    );
  }

  Widget _bpNumberNumberWidget({required FetchAddDisconnectionDataState dataState}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: TextWidget("BP Number.",
            fontSize: AppFont.font_14,
            color: AppColor.themeColor,
            fontWeight: FontWeight.w600,),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey[350],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextWidget("${dataState.bpNumberData.customerData!.bpNumber.toString()}",),
          ),
        ),
      ],
    );
  }

  Widget _disconnectionTypeDropDown({required FetchAddDisconnectionDataState dataState}) {
    return DropdownWidget(
      isRequired: true,
      hint: AppString.disconnectionType,
      dropdownValue: dataState.disconnectionTypeData.name != null
          ? dataState.disconnectionTypeData
          : null,
      onChanged: (value) {
        BlocProvider.of<AddDisconnectionBloc>(context).add(AddDisconnectionSelectDisconnectionTypeEvent(
          disconnectionTypeData: value,
        ));
      },
      items: dataState.disconnectionTypeList.map<DropdownMenuItem<DisconnectionTypeModel>>(
              (DisconnectionTypeModel disconnectionTypeData) {
            return DropdownMenuItem<DisconnectionTypeModel>(
              value: disconnectionTypeData,
              child: Text(disconnectionTypeData.name.toString()),
            );
          }).toList(),
    );
  }
  
  Widget _requestDateController({required FetchAddDisconnectionDataState  dataState}) {
    return TextFieldWidget(
      isRequired: true,
      enabled: false,
      labelText: AppString.dateOfRequest,
      controller: dataState.requestDateController,
      onTap: () {
        BlocProvider.of<AddDisconnectionBloc>(context)
            .add(AddDisconnectionSelectRequestDateEvent(context: context));
      },
    );
  }

  Widget _disconnectionRequestDateController({required FetchAddDisconnectionDataState  dataState}) {
    return TextFieldWidget(
      isRequired: true,
      enabled: false,
      labelText: AppString.disconnectionRequestDate,
      controller: dataState.disconnectionRequestController,
      onTap: () {
        BlocProvider.of<AddDisconnectionBloc>(context)
            .add(AddDisconnectionSelectDisconnectionRequestDateEvent(context: context));
      },
    );
  }

  Widget _disconnectionReasonControllerController({required FetchAddDisconnectionDataState  dataState}) {
    return TextFieldWidget(
      isRequired: true,
      labelText: AppString.other,
      controller: dataState.disconnectionReasonController,
      maxLine: 3,
    );
  }

  Widget _disconnectionReasonTypeDropDown({required FetchAddDisconnectionDataState dataState}) {
    return DropdownWidget(
      isRequired: true,
      hint: AppString.disconnectionReason,
      dropdownValue: dataState.disconnectionReasonTypeData.name != null
          ? dataState.disconnectionReasonTypeData
          : null,
      onChanged: (value) {
        BlocProvider.of<AddDisconnectionBloc>(context).add(AddDisconnectionSelectDisconnectionReasonTypeEvent(
          disconnectionReasonTypeData: value,
        ));
      },
      items: dataState.disconnectionReasonTypeList.map<DropdownMenuItem<DisconnectionReasonType>>(
              (DisconnectionReasonType disconnectionReasonTypeData) {
            return DropdownMenuItem<DisconnectionReasonType>(
              value: disconnectionReasonTypeData,
              child: Text(disconnectionReasonTypeData.name.toString()),
            );
          }).toList(),
    );
  }

  Widget _file({required FetchAddDisconnectionDataState dataState}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/3,
      height:  MediaQuery.of(context).size.width/3,
      child: DottedBorder(
        color: AppColor.themeColor,
        child: InkWell(
          onTap: () {
              mediaType(context: context,
                  onPressedCamera: () {
                    BlocProvider.of<AddDisconnectionBloc>(context)
                        .add(AddDisconnectionSelectFileEvent(context: context, mediaType: 1));
                    Navigator.pop(context);
                  },
                  onPressedGallery:() {
                    BlocProvider.of<AddDisconnectionBloc>(context)
                        .add(AddDisconnectionSelectFileEvent(context: context, mediaType: 2));
                    Navigator.pop(context);
                  }
              );
          },
          child: dataState.file.path.isEmpty ?
          Padding(
            padding: EdgeInsets.all( MediaQuery.of(context).size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppIcon.registrationFormIcon,
                  height: MediaQuery.of(context).size.width * 0.07,),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                TextWidget(AppString.updateDisconnectionSignedForm,
                  textAlign: TextAlign.center,
                  fontSize: AppFont.font_10,),
              ],),
          ) : Stack(
            children: <Widget>[
              new Positioned.fill(
                child:dataState.file.path.toString().toLowerCase().contains(".jpg")
              || dataState.file.path.toString().toLowerCase().contains(".png")
              || dataState.file.path.toString().toLowerCase().contains(".jpeg") ?
                Image.file(dataState.file, fit: BoxFit.fill,)
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.file_copy_outlined,
                        color: Colors.grey,
                        size: MediaQuery.of(context).size.width * 0.15),
                        TextWidget(dataState.file.path.split('/').last.toString(),
                          textAlign: TextAlign.center,
                          color: AppColor.themeColor, fontSize: AppFont.font_12,),
                      ],
                    ),
              ),
              new Positioned.fill(
                child: Icon(Icons.refresh),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _submitButton({required FetchAddDisconnectionDataState dataState}) {
    return dataState.isLoader == false ?
    ButtonWidget(
        text: AppString.submit,
        onPressed: () {
          BlocProvider.of<AddDisconnectionBloc>(context)
              .add(AddDisconnectionSubmitEvent(context: context));
        }
    ): const DottedLoaderWidget();
  }

  Widget _verticalSize() {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.05,
    );
  }
}
