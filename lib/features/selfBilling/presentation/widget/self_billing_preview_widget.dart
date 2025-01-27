import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/dashboard/domain/model/customer_model.dart';
import 'package:customer_connect/features/selfBilling/domain/bloc/self_billing_bloc.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_line_widget.dart';
import 'package:flutter/material.dart';

class SelfBillingPreviewWidget extends StatelessWidget {
  final BuildContext buildContext;
  const SelfBillingPreviewWidget({super.key, required this.buildContext});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelfBillingBloc, SelfBillingState>(
      builder: (context, state) {
        if(state is FetchSelfBillingDataState){
          return _builder(dataState: state, context: context);
        } else {
          return Center(child: CenterLoaderWidget());
        }
      },
    );
  }

  Widget _builder({required FetchSelfBillingDataState dataState, required BuildContext context}) {
    CustomerModel customerData =  BlocProvider.of<DashboardBloc>(context).bpNumberData.customerData!;
    double differenceReading = double.parse(dataState.meterData.currentMeterReading.toString()) - double.parse(dataState.meterData.lastReading.toString());

    return Container(
      height: MediaQuery.of(context).size.height/1.7,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.06,
                ),
                TextWidget("${customerData.firstName.toString()} ${customerData.lastName.toString()}",
                  fontWeight: FontWeight.w700,),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                TextWidget("${customerData.address1.toString()} ${customerData.address2.toString()}"
                    " ${customerData.locality.toString()}, ${customerData.state.toString()}, ${customerData.pinCode.toString()}",
                  textAlign: TextAlign.center,
                  fontSize: AppFont.font_13,
                  color: AppColor.grey,
                  fontWeight: FontWeight.w500,),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                DottedDividerLine(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                _rowWidget(label: "BP Number", value: customerData.bpNumber.toString()),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                _rowWidget(label: "Meter Number", value: dataState.meterData.meterNumber.toString()),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                _rowWidget(label: "Serial Number", value: dataState.meterData.serialNumber.toString()),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                DottedDividerLine(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget("Date" + " : ", fontSize: AppFont.font_13, fontWeight: FontWeight.w700,),
                    TextWidget(dataState.meterData.billingCyclePeriods.toString(), textAlign: TextAlign.start,),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                _rowWidget(label: "Previous Reading", value: dataState.meterData.lastReading.toString()),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                _rowWidget(label: "Current Reading", value: dataState.meterData.currentMeterReading.toString()),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                DottedDividerLine(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                _rowWidget(label: "Reading Difference ",
                    value: "${differenceReading.toStringAsFixed(3)}"),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                DottedDividerLine(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                _submitButton(context: context),
              ],
            ),
          ),
          Positioned(
            top: -1.0,
            right: 0.1,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                  Icons.close
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _submitButton({required BuildContext context}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/2,
      child: ButtonWidget(
          text: AppString.submit,
          onPressed: () {
            Navigator.of(context).pop();
            BlocProvider.of<SelfBillingBloc>(buildContext)
                .add(SelfBillingSubmitEvent(context: buildContext, isPreview: false));
      }),
    );
  }

  Widget _rowWidget({required String label, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(label + " : ", fontSize: AppFont.font_13, fontWeight: FontWeight.w700,),
        Expanded(child: TextWidget(value, textAlign: TextAlign.end,)),
      ],
    );
  }
}
