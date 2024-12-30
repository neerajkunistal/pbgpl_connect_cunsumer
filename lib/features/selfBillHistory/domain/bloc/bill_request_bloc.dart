import 'package:bloc/bloc.dart';
import 'package:customer_connect/features/selfBillHistory/domain/self_bill_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'bill_request_event.dart';
part 'bill_request_state.dart';

class BillRequestBloc extends Bloc<BillRequestEvent, BillRequestState> {

  bool isLoader =  false;

  List<SelfBillModel> _selfBillList = [];
  List<SelfBillModel> get selfBillList => _selfBillList;

  BillRequestBloc() : super(BillRequestInitial()) {
    on<BillRequestPageLoadEvent>(_pageLoad);
  }

  _pageLoad(BillRequestPageLoadEvent event, emit) async {
    isLoader =  false;
    _selfBillList = [];
    _eventComplete(emit);
  }

  _eventComplete(Emitter<BillRequestState>emit){
    emit(FetchBillRequestDataState(
        isLoader: isLoader,
        selfBillList: selfBillList,
    ));
  }
}
