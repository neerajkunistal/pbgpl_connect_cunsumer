import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/dashboard/domain/model/customer_model.dart';
import 'package:customer_connect/features/dashboard/helper/dashboard_helper.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/selfBilling/domain/model/meter_model.dart';
import 'package:customer_connect/features/selfBilling/helper/self_billing_helper.dart';
import 'package:customer_connect/utills/commonClass/user_info.dart';
import 'package:flutter/cupertino.dart';

part 'self_billing_event.dart';
part 'self_billing_state.dart';

class SelfBillingBloc extends Bloc<SelfBillingEvent, SelfBillingState> {

  bool isLoader =  false;
  TextEditingController bpNumberController =  TextEditingController();
  TextEditingController customerNameController =  TextEditingController();
  TextEditingController customerAddressController =  TextEditingController();
  TextEditingController meterNumberController  =  TextEditingController();
  TextEditingController previousReadingController =  TextEditingController();
  File file =  File("");

  LoginModel _userData = LoginModel();
  LoginModel get userData => _userData;

  MeterModel _meterData =  MeterModel();
  MeterModel get meterData => _meterData;
  List<TextEditingController> currentReadingController = [];
  List<TextEditingController> lastReadingController = [];

  SelfBillingBloc() : super(SelfBillingInitial()) {
    on<SelfBillingPageLoadEvent>(_pageLoad);
    on<SelfBillingSelectFileEvent>(_selectFile);
    on<SelfBillingSubmitEvent>(_submit);
  }

  _pageLoad(SelfBillingPageLoadEvent event, emit) async {
    emit(SelfBillingPageLoadState());
    isLoader =  false;
    bpNumberController.text = "";
    customerNameController.text = "";
    customerAddressController.text = "";
    meterNumberController.text = "";
    previousReadingController.text = "";
    file = File("");
    _meterData =  MeterModel();
    currentReadingController = [];
    lastReadingController = [];
    for(int i = 0; i < 10; i++){
      currentReadingController.add(
        TextEditingController()
      );
      lastReadingController.add(
          TextEditingController()
      );
    }

    _userData = UserInfo.instance!.userData!;
    bpNumberController.text =  userData.bpNumber.toString();

    var meterRes =  await SelfBillingHelper.fetchMeterNumber(
         schema: userData.schema.toString(), dmaId: userData.dmaId.toString());
    if(meterRes != null){
      MeterModel data =  meterRes;
      if(data.status.toString() == "success"){
        _meterData.serialNumber = data.serialNumber;
        _meterData.meterNumber = data.meterNumber;
      } else {
        emit(SelfBillingPageErrorState(error: data.message.toString()));
        return;
      }
    }else {
      emit(SelfBillingPageErrorState(error: "Internal Server Error"));
      return;
    }

    var meterReadingRes =  await SelfBillingHelper.fetchPrevReading(
        schema: userData.schema.toString(), dmaId: userData.dmaId.toString());
    if(meterReadingRes != null){
      MeterModel data =  meterReadingRes;
      if(data.status.toString() == "success"){
        _meterData.lastReading = data.lastReading;
        _meterData.billingCycle = data.billingCycle;
        _meterData.billingCyclePeriods = data.billingCyclePeriods;
      } else {
        emit(SelfBillingPageErrorState(error: data.message.toString()));
        return;
      }
    } else {
      emit(SelfBillingPageErrorState(error: "Internal Server Error"));
      return;
    }

    if(meterData.lastReading.toString().isNotEmpty){
      int position = 0;
      for(int i = lastReadingController.length - meterData.lastReading.toString().length;
      i < lastReadingController.length; i++){
        lastReadingController[i].text =  meterData.lastReading[position].toString();
        position++;
      }
    }
    _eventComplete(emit);
  }

  _selectFile(SelfBillingSelectFileEvent event, emit) async {
    int mediaType =  event.mediaType;
    if(mediaType == 1){
      var res =  await DashboardHelper.cameraPiker(context: event.context);
      if(res !=  null){
        file =  res;
        _eventComplete(emit);
      }
    } else if(mediaType == 2){
      var res =  await DashboardHelper.filePiker(context: event.context);
      if(res !=  null){
        file =  res;
        _eventComplete(emit);
      }
    }
  }

  _submit(SelfBillingSubmitEvent event, emit) async {
    String previousReading = "0";
    String currentReading = "0";
    List<String> value2 = [];
    for(var dataReading in currentReadingController){
      if(dataReading.text.toString().isNotEmpty){
        value2.add(dataReading.text.toString());
      }
    }

    if(meterData.lastReading.toString().isNotEmpty){
      previousReading =  meterData.lastReading.toString();
    }
    currentReading = "${value2.toString().replaceAll("[", "").toString().replaceAll("]", "").replaceAll(",", "").replaceAll(" ", "")}";

    currentReadingController = [];
    for(int i = 0; i < 10; i++){
      currentReadingController.add(
          TextEditingController()
      );
    }
    if(currentReading.toString().isNotEmpty){
      int position = 0;
      for(int i = currentReadingController.length - currentReading.toString().length;
      i < currentReadingController.length; i++){
        currentReadingController[i].text =  currentReading[position].toString();
        position++;
      }
    }
    _eventComplete(emit);

    var textFieldValidation = await SelfBillingHelper.textFiledValidationCheck(context: event.context,
        previousReading: previousReading, currentReading: currentReading, file: file);
    if(textFieldValidation == false){
      return;
    }

    _meterData.currentMeterReading =  currentReading.toString();
    _eventComplete(emit);

    if(event.isPreview == true){
      SelfBillingHelper.selfBillingPreview(context: event.context);
      return;
    }

    isLoader =  true;
    _eventComplete(emit);
    CustomerModel customerData =  BlocProvider.of<DashboardBloc>(event.context).bpNumberData.customerData!;
    var res =  await SelfBillingHelper.submitData(context: event.context,
        meterData: meterData, customerData: customerData,
        currentReading: currentReading, previousReading: previousReading, file: file);
    isLoader =  false;
    _eventComplete(emit);
    if(res != null){
      Navigator.of(event.context).pop();
    }
  }

  _eventComplete(Emitter<SelfBillingState> emit) {
    emit(FetchSelfBillingDataState(
        isLoader: isLoader,
        bpNumberController: bpNumberController,
        customerAddressController: customerAddressController,
        customerNameController: customerNameController,
        file: file,
        meterNumberController: meterNumberController,
        previousReadingController: previousReadingController,
        meterData: meterData,
        currentReadingController: currentReadingController,
         lastReadingController: lastReadingController,
    ));
  }
}
