import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';

class ConnectionInfoWidget extends StatelessWidget {
  const ConnectionInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if(state is FetchDashboardDataState){
          return state.bpNumberData.customerData != null ?
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget("My Connection",
                      color: AppColor.themeSecondary,
                      fontSize: AppFont.font_15,
                      fontWeight: FontWeight.w700),
                ),
                Card(
                  elevation: 2,
                  shadowColor: AppColor.themeLightColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextWidget("BP Number : ", fontWeight: FontWeight.w700, fontSize: AppFont.font_13),
                            Expanded(child: TextWidget(state.bpNumberData.customerData!.bpNumber.toString(), fontSize: AppFont.font_13)),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Row(
                          children: [
                            TextWidget("CRN Number: ", fontWeight: FontWeight.w700, fontSize: AppFont.font_13),
                            Expanded(child: TextWidget(state.bpNumberData.customerData!.crn.toString(), fontSize: AppFont.font_13)),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Row(
                          children: [
                            TextWidget("Mobile Number : ", fontWeight: FontWeight.w700, fontSize: AppFont.font_13),
                            Expanded(child: TextWidget(state.bpNumberData.customerData!.mobileNumber.toString(), fontSize: AppFont.font_13)),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget("Address : ", fontWeight: FontWeight.w700, fontSize: AppFont.font_13,),
                            Expanded(child: TextWidget("${state.bpNumberData.customerData!.address1.toString()} ${state.bpNumberData.customerData!.address2.toString()} ${state.bpNumberData.customerData!.locality.toString()}",
                             textAlign: TextAlign.start,
                             fontSize: AppFont.font_13,
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ) : const SizedBox.shrink();
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
