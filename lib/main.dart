import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/SplashPage.dart';
import 'package:customer_connect/features/billRequest/domain/bloc/bill_request_bloc.dart';
import 'package:customer_connect/features/complaint/addComplaint/domain/bloc/add_complaint_bloc.dart';
import 'package:customer_connect/features/complaint/viewComplaint/domain/bloc/view_complaint_bloc.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/login/domain/bloc/login_bloc.dart';
import 'package:customer_connect/features/payment/addPayment/domain/bloc/add_payment_bloc.dart';
import 'package:customer_connect/features/payment/paymentHistory/domain/bloc/payment_history_bloc.dart';
import 'package:customer_connect/features/selfBilling/domain/bloc/self_billing_bloc.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:customer_connect/utills/res/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtils.getInstance();
  await UserInfo.instanceInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LoginBloc()),
        BlocProvider(create: (BuildContext context) => DashboardBloc()),
        BlocProvider(create: (BuildContext context) => PaymentHistoryBloc()),
        BlocProvider(create: (BuildContext context) => BillRequestBloc()),
        BlocProvider(create: (BuildContext context) => SelfBillingBloc()),
        BlocProvider(create: (BuildContext context) => AddComplaintBloc()),
        BlocProvider(create: (BuildContext context) => ViewComplaintBloc()),
        BlocProvider(create: (BuildContext context) => AddPaymentBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          builder: (context, child) {
            return MediaQuery (
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
         home: SplashPage()
      ),
    );
  }

}
