import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:customer_connect/features/selfBilling/domain/bloc/self_billing_bloc.dart';
import 'package:customer_connect/utills/commonWidgets/button_widget.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/text_field_widget.dart';
import 'package:customer_connect/utills/res/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelfBillingPage extends StatefulWidget {
  const SelfBillingPage({super.key});

  @override
  State<SelfBillingPage> createState() => _SelfBillingPageState();
}

class _SelfBillingPageState extends State<SelfBillingPage> {

  @override
  void initState() {
    BlocProvider.of<SelfBillingBloc>(context)
        .add(SelfBillingPageLoadEvent(context: context));
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
            AppString.selfBilling,
           color: AppColor.themeSecondary,
           fontWeight: FontWeight.w600,
           fontSize: AppFont.font_16,
        ),
      ),
      body: BlocBuilder<SelfBillingBloc, SelfBillingState>(
        builder: (context, state) {
          if(state is FetchSelfBillingDataState){
             return _builder(dataState: state);
          } else {
            return Center(child: CenterLoaderWidget());
          }
        },
      ),
    );
  }

  Widget _builder({required FetchSelfBillingDataState dataState}) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _verticalSize(),
            _bpNumberController(dataState: dataState),
            _verticalSize(),
            _customerNameController(dataState: dataState),
            _verticalSize(),
            _customerAddressController(dataState: dataState),
            _verticalSize(),
            _meterNumberController(dataState: dataState),
            _verticalSize(),
            _previousReadingController(dataState: dataState),
            _verticalSize(),
            _file(dataState: dataState),
            _verticalSize(),
            _submitButton(dataState: dataState),
            _verticalSize(),
          ],
        ),
      ),
    );
  }

  Widget _bpNumberController({required FetchSelfBillingDataState dataState}) {
    return TextFieldWidget(
        isRequired: true,
        enabled: false,
        labelText: AppString.bpNumber,
        controller:  dataState.bpNumberController,
    );
  }

  Widget _customerNameController({required FetchSelfBillingDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      labelText: AppString.customerName,
      controller:  dataState.customerNameController,
    );
  }

  Widget _customerAddressController({required FetchSelfBillingDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      maxLine: 5,
      labelText: AppString.customerAddress,
      controller:  dataState.customerAddressController,
    );
  }

  Widget _meterNumberController({required FetchSelfBillingDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      labelText: AppString.meterNumber,
      controller:  dataState.meterNumberController,
    );
  }

  Widget _previousReadingController({required FetchSelfBillingDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      labelText: AppString.previousReading,
      controller:  dataState.previousReadingController,
    );
  }

  Widget _submitButton({required FetchSelfBillingDataState dataState}) {
    return dataState.isLoader == false ?
    ButtonWidget(
        text: AppString.submit,
        onPressed: () {
          BlocProvider.of<SelfBillingBloc>(context)
          .add(SelfBillingSubmitEvent(context: context));
    }) : const DottedLoaderWidget();
  }

  Widget _file({required FetchSelfBillingDataState dataState}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/3,
      height:  MediaQuery.of(context).size.width/3,
      child: DottedBorder(
          color: AppColor.themeColor,
          child: InkWell(
            onTap: () {
              mediaType(context: context,
                  onPressedCamera: () {
                    BlocProvider.of<SelfBillingBloc>(context)
                        .add(SelfBillingSelectFileEvent(context: context, mediaType: 1));
                    Navigator.pop(context);
                  },
                  onPressedGallery:() {
                    BlocProvider.of<SelfBillingBloc>(context)
                        .add(SelfBillingSelectFileEvent(context: context, mediaType: 2));
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
                 Image.asset(AppIcon.meterIcon,
                   height: MediaQuery.of(context).size.width * 0.07,),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                  TextWidget("Upload Meter Reading Photo",
                    textAlign: TextAlign.center,
                    fontSize: AppFont.font_10,),
              ],),
            ) : Stack(
              children: <Widget>[
                new Positioned.fill(
                  child: Image.file(dataState.file, fit: BoxFit.fill,),
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

  Widget _verticalSize() {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.05,
    );
  }
}
