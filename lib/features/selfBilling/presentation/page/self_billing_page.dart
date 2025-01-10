import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:customer_connect/features/selfBilling/domain/bloc/self_billing_bloc.dart';
import 'package:customer_connect/utills/commonWidgets/button_widget.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/otp_text_field_widget.dart';
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

  List<TextEditingController> controllerList = [];

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
          } else if(state is SelfBillingPageErrorState){
            return _errorWidget(dataState: state);
          } else {
            return Center(child: CenterLoaderWidget());
          }
        },
      ),
    );
  }

  Widget _errorWidget({required SelfBillingPageErrorState dataState}) {
    return Center(
   child: Column(
     crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppIcon.meterIcon,
          height: MediaQuery.of(context).size.width * 0.16,),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.02,
        ),
        TextWidget(dataState.error,
          color: AppColor.themeSecondary,
          textAlign: TextAlign.center,
          fontSize: AppFont.font_16, fontWeight: FontWeight.w600,)
      ],
    ));
  }

  Widget _builder({required FetchSelfBillingDataState dataState}) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _verticalSize(),
            _meterNumberWidget(dataState: dataState),
            _verticalSize(),
            _serialNumberWidget(dataState: dataState),
            _verticalSize(),
            _previousReadingController(dataState: dataState),
            _verticalSize(),
            _verticalSize(),
            _currentReadingTextField(dataState: dataState),
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

  Widget _meterNumberWidget({required FetchSelfBillingDataState dataState}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: TextWidget("Meter No.",
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
            child: TextWidget("${dataState.meterData.meterNumber}",),
          ),
        ),
      ],
    );
  }

  Widget _serialNumberWidget({required FetchSelfBillingDataState dataState}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: TextWidget("Serial No.",
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
            child: TextWidget("${dataState.meterData.serialNumber}",),
          ),
        ),
      ],
    );
  }

  Widget _previousReadingController({required FetchSelfBillingDataState dataState}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 2.0),
          child: TextWidget(AppString.previousReading,
            fontSize: AppFont.font_14,
            color: AppColor.black,
            fontWeight: FontWeight.w500,),
        ),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 4,
          direction: Axis.horizontal,
          runSpacing: 10,
          children: [
            for(int i = 0; i < dataState.lastReadingController.length; i++)
              OtpTextFieldWidget(first: i == dataState.lastReadingController.length-1 ? true : false,
                last: i == 0 ? true : false,
                controller: dataState.lastReadingController[i],
                boardColor: i == dataState.lastReadingController.length -1 ? Colors.red
                    : i == dataState.lastReadingController.length -2 ? Colors.red
                    : i == dataState.lastReadingController.length -3 ? Colors.red
                    : null,
                isEnable: false,
                // isEnable:  dataState.currentReadingController[9].text.toString().isEmpty ? false : true,
              ),
          ],
        ),
      ],
    );
  }

  Widget _currentReadingTextField({required FetchSelfBillingDataState dataState}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 2.0),
          child: TextWidget("Current Meter Reading",
            fontSize: AppFont.font_14,
            color: AppColor.black,
            fontWeight: FontWeight.w500,),
        ),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 4,
          direction: Axis.horizontal,
          runSpacing: 10,
          children: [
            for(int i = 0; i < dataState.currentReadingController.length; i++)
              OtpTextFieldWidget(first: i == dataState.currentReadingController.length-1 ? true : false,
                  last: i == 0 ? true : false,
                controller: dataState.currentReadingController[i],
                boardColor: i == dataState.currentReadingController.length -1 ? Colors.red
                    : i == dataState.currentReadingController.length -2 ? Colors.red
                    : i == dataState.currentReadingController.length -3 ? Colors.red
                    : null,
                isEnable: true,
                // isEnable:  dataState.currentReadingController[9].text.toString().isEmpty ? false : true,
              ),
          ],
        ),
      ],
    );
  }

  Widget _submitButton({required FetchSelfBillingDataState dataState}) {
    return dataState.isLoader == false ?
    ButtonWidget(
        text: AppString.submit,
        onPressed: () {
          BlocProvider.of<SelfBillingBloc>(context)
          .add(SelfBillingSubmitEvent(context: context, isPreview: true));
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
              BlocProvider.of<SelfBillingBloc>(context)
                  .add(SelfBillingSelectFileEvent(context: context, mediaType: 1));
/*              mediaType(context: context,
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
              );*/
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
