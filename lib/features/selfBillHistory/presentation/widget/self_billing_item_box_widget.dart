import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/dashboard/domain/model/customer_model.dart';
import 'package:customer_connect/features/selfBillHistory/domain/model/self_bill_model.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SelfBillingItemBoxWidget extends StatelessWidget {
  final SelfBillModel selfBillData;
  const SelfBillingItemBoxWidget({super.key, required this.selfBillData});

  @override
  Widget build(BuildContext context) {
    CustomerModel customerData =  BlocProvider.of<DashboardBloc>(context).bpNumberData.customerData!;
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    DateTime dateTime = formatter.parse(selfBillData.createdAt.toString());
    DateTime cycleFrom = formatter.parse(selfBillData.cycleFrom.toString());
    DateTime cycleTo = formatter.parse(selfBillData.cycleTo.toString());
    double differenceReading = double.parse(selfBillData.meterReading.toString()) - double.parse(selfBillData.prevBillReading.toString());
    return Container(
      margin: EdgeInsets.all(0.0),
      child: Card(
        elevation: 2,
        shadowColor: AppColor.themeColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              _imageWidget(context: context, url: selfBillData.meterImage.toString()),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget("Billing Cycle Period" + " : ", fontSize: AppFont.font_13, fontWeight: FontWeight.w700,),
                  Expanded(child: TextWidget("${DateFormat('dd-MM-yyyy').format(cycleFrom)} To ${DateFormat('dd-MM-yyyy').format(cycleTo)}",)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              DottedDividerLine(),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              _rowWidget(label: "BP Number", value: customerData.bpNumber.toString()),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              _rowWidget(label: "Meter Number", value: selfBillData.meterNumber.toString()),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              _rowWidget(label: "Serial Number", value: selfBillData.meterSerial.toString()),
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
                  TextWidget("Bill Generate Date" + " : ", fontSize: AppFont.font_13, fontWeight: FontWeight.w700,),
                  TextWidget("${DateFormat('dd-MM-yyyy').format(dateTime)}", textAlign: TextAlign.start,),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              _rowWidget(label: "Previous Reading", value: selfBillData.prevBillReading.toString()),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              _rowWidget(label: "Enter Reading", value: selfBillData.meterReading.toString()),
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
              _statusWidget(label: "Status",
                  value: "${selfBillData.status.toString() == "0" ? "In Progress"
                      : selfBillData.status.toString() == "1" ? "Approved"
                      : selfBillData.status.toString() == "2" ? "Rejected" : "" }",
                  color: selfBillData.status.toString() == "0" ? Colors.orange
                      : selfBillData.status.toString() == "1" ? Colors.green
                      : selfBillData.status.toString() == "2" ? Colors.red : Colors.grey
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              DottedDividerLine(),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              selfBillData.remarks.toString().isNotEmpty ?
              _rowWidget(label: "Remark ",
                  value: "${selfBillData.remarks}") : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
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

  Widget _statusWidget({required String label, required String value, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget("${label} : ", fontWeight: FontWeight.w500, fontSize: AppFont.font_12,),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: color,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
              child: TextWidget(value, fontWeight: FontWeight.w500, fontSize: AppFont.font_12, color: Colors.white, ),
            )),
      ],
    );
  }

  Widget _imageWidget({required BuildContext context, required String url}) {
    return url.isNotEmpty ?
    Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () async {
          if (!await launchUrl(Uri.parse(url))) {
            throw Exception('Could not launch ${url}');
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(url,
              height: MediaQuery.of(context).size.width * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                      : null,
                ),);
              }
          ),
        ),
      ),
    ) : const SizedBox.shrink();
  }
}
