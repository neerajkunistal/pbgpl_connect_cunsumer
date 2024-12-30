import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/changePassword/domain/bloc/change_password_bloc.dart';
import 'package:customer_connect/features/complaint/addComplaint/domain/bloc/add_complaint_bloc.dart';
import 'package:customer_connect/features/complaint/viewComplaint/domain/bloc/view_complaint_bloc.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/forgetPassword/domain/bloc/forget_password_bloc.dart';
import 'package:customer_connect/features/login/domain/bloc/login_bloc.dart';
import 'package:customer_connect/features/otp/domain/domain/bloc/otp_bloc.dart';
import 'package:customer_connect/features/payment/addPayment/domain/bloc/add_payment_bloc.dart';
import 'package:customer_connect/features/payment/paymentHistory/domain/bloc/payment_history_bloc.dart';
import 'package:customer_connect/features/profile/domain/bloc/profile_bloc.dart';
import 'package:customer_connect/features/selfBillHistory/domain/bloc/bill_request_bloc.dart';
import 'package:customer_connect/features/selfBilling/domain/bloc/self_billing_bloc.dart';
import 'package:flutter/cupertino.dart';

MultiProvider blocMultiProvider({required Widget child}) {

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
        BlocProvider(create: (BuildContext context) => OtpBloc()),
        BlocProvider(create: (BuildContext context) => ForgetPasswordBloc()),
        BlocProvider(create: (BuildContext context) => ProfileBloc()),
        BlocProvider(create: (BuildContext context) => ChangePasswordBloc())
      ],
    child: child,
  );
}