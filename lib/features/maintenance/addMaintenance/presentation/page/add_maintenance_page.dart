import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:customer_connect/features/maintenance/addMaintenance/domain/bloc/add_maintenance_bloc.dart';
import 'package:customer_connect/features/maintenance/addMaintenance/domain/model/maintenance_service_type.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dropdown_widget.dart';
import 'package:customer_connect/utills/res/app_icon.dart';
import 'package:flutter/material.dart';

class AddMaintenancePage extends StatefulWidget {
  const AddMaintenancePage({super.key});

  @override
  State<AddMaintenancePage> createState() => _AddMaintenancePageState();
}

class _AddMaintenancePageState extends State<AddMaintenancePage> {

  @override
  void initState() {
    BlocProvider.of<AddMaintenanceBloc>(context).add(AddMaintenancePageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.themeSecondary),
        title: TextWidget(
          AppString.addMaintenance,
          color: AppColor.themeSecondary,
          fontWeight: FontWeight.w600,
          fontSize: AppFont.font_16,
        ),
      ),
      body: BlocBuilder<AddMaintenanceBloc, AddMaintenanceState>(
        builder: (context, state) {
          if (state is FetchAddMaintenanceDataState) {
            return _buildWidget(dataState: state);
          } else {
            return const Center(child: CenterLoaderWidget());
          }
        },
      ),
    );
  }

  Widget _buildWidget({required FetchAddMaintenanceDataState dataState}) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _verticalSize(),
              _bpNumberNumberWidget(dataState: dataState),
              _verticalSize(),
              _serviceTypeDropDown(dataState: dataState),
              _verticalSize(),
              _requestDateController(dataState: dataState),
              _verticalSize(),
              _messageController(dataState: dataState),
              _verticalSize(),
              _file(dataState: dataState),
              _verticalSize(),
              _submitButton(dataState: dataState),
              _verticalSize(),

            ],
          ),
        )
    );
  }

  Widget _bpNumberNumberWidget({required FetchAddMaintenanceDataState dataState}) {
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


  Widget _serviceTypeDropDown({required FetchAddMaintenanceDataState dataState}) {
    return DropdownWidget(
      isRequired: true,
      hint: AppString.serviceType,
      dropdownValue: dataState.serviceTypeData.description != null
          ? dataState.serviceTypeData
          : null,
      onChanged: (value) {
        BlocProvider.of<AddMaintenanceBloc>(context).add(AddMaintenanceSelectServiceTypeEvent(
          serviceTypeData: value,
        ));
      },
      items: dataState.serviceTypeList.map<DropdownMenuItem<MaintenanceServiceTypeModel>>(
              (MaintenanceServiceTypeModel serviceTypeData) {
            return DropdownMenuItem<MaintenanceServiceTypeModel>(
              value: serviceTypeData,
              child: Text(serviceTypeData.description.toString()),
            );
          }).toList(),
    );
  }


  Widget _requestDateController({required FetchAddMaintenanceDataState  dataState}) {
    return TextFieldWidget(
      isRequired: true,
      enabled: false,
      labelText: AppString.dateOfRequest,
      controller: dataState.requestDateController,
      onTap: () {
        BlocProvider.of<AddMaintenanceBloc>(context)
            .add(AddMaintenanceSelectRequestDateEvent(context: context));
      },
    );
  }

  Widget _messageController({required FetchAddMaintenanceDataState  dataState}) {
    return TextFieldWidget(
      isRequired: true,
      labelText: AppString.message,
      controller: dataState.messageController,
      maxLine: 3,
    );
  }

  Widget _file({required FetchAddMaintenanceDataState dataState}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/3,
      height:  MediaQuery.of(context).size.width/3,
      child: DottedBorder(
        color: AppColor.themeColor,
        child: InkWell(
          onTap: () {
            mediaType(context: context,
                onPressedCamera: () {
                  BlocProvider.of<AddMaintenanceBloc>(context)
                      .add(AddMaintenanceSelectFileEvent(context: context, mediaType: 1));
                  Navigator.pop(context);
                },
                onPressedGallery:() {
                  BlocProvider.of<AddMaintenanceBloc>(context)
                      .add(AddMaintenanceSelectFileEvent(context: context, mediaType: 2));
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

  Widget _submitButton({required FetchAddMaintenanceDataState dataState}) {
    return dataState.isLoader == false ?
    ButtonWidget(
        text: AppString.submit,
        onPressed: () {
          BlocProvider.of<AddMaintenanceBloc>(context)
              .add(AddMaintenanceSubmitEvent(context: context));
        }
    ): const DottedLoaderWidget();
  }

  Widget _verticalSize() {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.05,
    );
  }
}
