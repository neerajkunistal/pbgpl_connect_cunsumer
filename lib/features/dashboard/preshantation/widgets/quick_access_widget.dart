import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/complaint/addComplaint/presentation/page/add_complaint_page.dart';
import 'package:customer_connect/features/complaint/viewComplaint/presentation/page/view_complaint_page.dart';
import 'package:customer_connect/features/knowYourBill/know_your_bill_page.dart';
import 'package:customer_connect/features/payment/paymentHistory/presenation/page/payment_history_page.dart';
import 'package:customer_connect/features/selfBillHistory/presentation/page/bill_request_page.dart';
import 'package:customer_connect/features/selfBilling/presentation/page/self_billing_page.dart';
import 'package:customer_connect/utills/commonClass/fade_route.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:customer_connect/utills/menuData.dart';
import 'package:flutter/material.dart';

class QuickAccessWidget extends StatelessWidget {
  const QuickAccessWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextWidget("Quick Access",
                color: AppColor.themeSecondary,
                fontSize: AppFont.font_15,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: menu.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 3,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () =>  pageNavigation(index, context),
                  child: Card(
                    color: Colors.white70,
                    shadowColor: Colors.white70,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(8.0)),
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          menu[index].icon,
                          color: AppColor.themeLightColor,
                          size: 30,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                        TextWidget(
                          menu[index].title,
                          textAlign: TextAlign.center,
                          fontSize: AppFont.font_12,
                          color: AppColor.black,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
  void pageNavigation(int index, BuildContext context) {
    if(index == 0)
    {
      Navigator.push(
        !context.mounted ? context : context,
        FadeRoute(
            page: const SelfBillingPage()),
      );
    }
    else if(index == 1)
    {
      Navigator.push(
        !context.mounted ? context : context,
        FadeRoute(
            page: const BillRequestPage()),
      );
    }
    else if(index == 2)
    {
      Navigator.push(
        !context.mounted ? context : context,
        FadeRoute(
            page: const PaymentHistoryPage()),
      );
    }
    else if(index == 3)
    {
      Navigator.push(
        !context.mounted ? context : context,
        FadeRoute(
            page: const KnowYourBillPage()),
      );
    }
    else if(index == 4)
    {
      Navigator.push(
        !context.mounted ? context : context,
        FadeRoute(
            page: const AddComplaintPage()),
      );
    }
    else if(index == 5)
    {
      Navigator.push(
        !context.mounted ? context : context,
        FadeRoute(
            page: const ViewComplaintPage()),
      );
    }
  }
}
