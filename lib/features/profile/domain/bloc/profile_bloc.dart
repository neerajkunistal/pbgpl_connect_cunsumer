import 'package:bloc/bloc.dart';
import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/dashboard/domain/model/customer_model.dart';
import 'package:equatable/equatable.dart';
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
