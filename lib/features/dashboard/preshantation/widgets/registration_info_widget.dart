import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/payment/addPayment/domain/bloc/add_payment_bloc.dart';
import 'package:customer_connect/features/payment/addPayment/presentation/page/add_payemnt_page.dart';
import 'package:customer_connect/utills/commonClass/fade_route.dart';
import 'package:customer_connect/utills/res/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is FetchDashboardDataState) {
          return state.bpNumberData.customerData != null
              ? Padding(
            padding: EdgeInsets.all(
              8.0,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.width / 2.2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2),
                        color: AppColor.grey.withOpacity(0.8),
                        blurRadius: 5)
                  ],
                  color: AppColor.themeColor.withOpacity(0.8),
                  image: DecorationImage(
                    image:
                    AssetImage("assets/images/card_background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        state.bpNumberData.paymentType.toString().isEmpty ?
                        "Registration Amount" : state.bpNumberData.paymentType.toString(),
                        color: AppColor.white,
                        fontSize: AppFont.font_16,
                        fontWeight: FontWeight.w700,
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                state.bpNumberData.customerData!.paymentCreditStatus.toString() != "1"
                                    ? "₹ ${state.bpNumberData.customerData!.initialAmount.toString()}"
                                    : "₹ 0",
                                color: AppColor.white,
                                fontSize: AppFont.font_18,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          state.bpNumberData.customerData!.paymentCreditStatus.toString() != "1"
                              ? _payNowButton(context: context, state: state)
                              : const SizedBox.shrink(),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextWidget(
                              state.bpNumberData.customerData!
                                  .firstName !=
                                  null
                                  ? "${state.bpNumberData.customerData!.firstName} ${state.bpNumberData.customerData!.lastName}"
                                  : "",
                              color: AppColor.themeSecondary,
                              fontSize: AppFont.font_13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SelectableTextWidget(
                            " " + state.bpNumber,
                            color: AppColor.white,
                            fontSize: AppFont.font_14,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            width:
                            MediaQuery.of(context).size.width * 0.01,
                          ),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(
                                  ClipboardData(text: state.bpNumber));
                            },
                            child: Icon(
                              Icons.copy,
                              color: AppColor.themeSecondary,
                              size: MediaQuery.of(context).size.width *
                                  0.04,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
              : const SizedBox.shrink();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _payNowButton(
      {required BuildContext context, required FetchDashboardDataState state}) {
    return ButtonWidget(
        text: AppString.payNow,
        onPressed: () async {
          BlocProvider.of<AddPaymentBloc>(context).add(
              AddPaymentPageLoadEvent(context: context,
                  paymentRequest: PaymentRequest.newConnection));
          var res =   await Navigator.push(
            !context.mounted ? context : context,
            FadeRoute(
                page: const AddPaymentPage()),
          );
          if(res.toString() == "Complete"){
            BlocProvider.of<DashboardBloc>(context)
                .add(DashboardPageLoadEvent(context: context));
          }
        });
  }

}
