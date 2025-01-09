part of 'self_billing_bloc.dart';

sealed class SelfBillingState extends Equatable {
  const SelfBillingState();
}

final class SelfBillingInitial extends SelfBillingState {
  @override
  List<Object> get props => [];
}

final class SelfBillingPageLoadState extends SelfBillingInitial {
  @override
  List<Object> get props => [];
}

final class SelfBillingPageErrorState extends SelfBillingInitial {
  final String error;

  SelfBillingPageErrorState({required this.error});

  @override
  List<Object> get props => [
    error,
  ];
}

final class FetchSelfBillingDataState extends SelfBillingInitial {
  final bool isLoader;
  final TextEditingController bpNumberController;
  final TextEditingController customerNameController;
  final TextEditingController customerAddressController;
  final TextEditingController meterNumberController;
  final TextEditingController previousReadingController;
  final File file;
  final MeterModel meterData;
  final List<TextEditingController> currentReadingController;
  final List<TextEditingController> lastReadingController;

  FetchSelfBillingDataState({
   required this.isLoader,
   required this.file,
   required this.previousReadingController,
   required this.meterNumberController,
   required this.customerAddressController,
   required this.customerNameController,
   required this.bpNumberController,
   required this.meterData,
   required this.currentReadingController,
   required this.lastReadingController,
 });

  @override
  List<Object> get props => [
    isLoader,
    file,
    previousReadingController,
    meterNumberController,
    customerAddressController,
    customerNameController,
    bpNumberController,
    meterData,
    currentReadingController,
    lastReadingController,
  ];
}
