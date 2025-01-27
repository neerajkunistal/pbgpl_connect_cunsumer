import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/dashboard/domain/model/customer_model.dart';
import 'package:customer_connect/features/otp/domain/domain/bloc/otp_bloc.dart';
import 'package:customer_connect/features/otp/presentation/page/otp_page.dart';
import 'package:customer_connect/features/profile/helper/profile_helper.dart';
import 'package:customer_connect/utills/commonClass/fade_route.dart';
import 'package:customer_connect/utills/commonWidgets/phone_validation.dart';
import 'package:customer_connect/utills/commonWidgets/snack_bar_error_widget.dart';
import 'package:customer_connect/utills/res/enums.dart';
import 'package:flutter/cupertino.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  CustomerModel _customerData =  CustomerModel();
  CustomerModel get customerData => _customerData;

  bool _isLoader =  false;
  bool get isLoader => _isLoader;

  bool isProfileEdit = false;

  TextEditingController mobileNumberController =  TextEditingController();

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfilePageLoadEvent>(_pageLoad);
    on<ProfileProfileEditEvent>(_profileEdit);
    on<ProfileSubmitEvent>(_submit);
  }

  _pageLoad(ProfilePageLoadEvent event, emit) async {
    emit(ProfilePageLoadState());
    _customerData =  CustomerModel();
    mobileNumberController.text = "";
    isProfileEdit = false;
    _customerData =  BlocProvider.of<DashboardBloc>(event.context).bpNumberData.customerData!;
    mobileNumberController.text =  customerData.mobileNumber.toString();
    _isLoader =  false;
    _eventComplete(emit);
  }

  _profileEdit(ProfileProfileEditEvent event, emit) {
    isProfileEdit =  true;
    _eventComplete(emit);
  }

  _submit(ProfileSubmitEvent event, emit) async {
    if(await PhoneValidation.checkPhoneValidation(phone: mobileNumberController.text.toString()) == false){
      SnackBarErrorWidget(event.context).show(message: "Please enter valid mobile number");
      return ;
    }
    else if(mobileNumberController.text.toString() == customerData.mobileNumber.toString()){
      SnackBarErrorWidget(event.context).show(message: "Please change mobile number");
      return ;
    }

    _isLoader =  true;
    _eventComplete(emit);
    var res =  await ProfileHelper.otpSendUpdateMobile(customerData: customerData,
        updateMobileNumber: mobileNumberController.text.toString(), context: event.context, otp: "");
    if(res != null){
      _isLoader =  false;
      _eventComplete(emit);
      BlocProvider.of<OtpBloc>(event.context).add(
          OtpPageLoadEvent(context: event.context,
              otpPageConfig: OtpPageConfig.profile, schema: customerData.schemeName.toString(),
              mobileNumber: mobileNumberController.text.toString(), bpNumber: mobileNumberController.text.toString()));
      Navigator.push(
          !event.context.mounted ? event.context : event.context,
          FadeRoute(
              page: const OtpPage()));
    }
    _isLoader =  false;
    _eventComplete(emit);

  }

  _eventComplete(Emitter<ProfileState>emit) {
    emit(FetchProfileDataState(
        isLoader: isLoader,
        isProfileEdit: isProfileEdit,
        customerData: customerData,
        mobileNumberController: mobileNumberController,
    ));
  }
}
