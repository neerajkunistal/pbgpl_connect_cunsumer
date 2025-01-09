
MeterModel meterDataResponse(var json){
  return MeterModel.fromJson(json);
}

class MeterModel {

  dynamic serialNumber;
  dynamic meterNumber;
  dynamic lastReading;
  dynamic currentMeterReading;
  String? billingCycle;
  String? billingCyclePeriods;
  String? message;
  String? status;


  MeterModel({
   this.meterNumber,
   this.billingCycle,
   this.billingCyclePeriods,
   this.lastReading,
   this.serialNumber,
   this.message,
   this.status,
   this.currentMeterReading,
});


  factory MeterModel.fromJson(Map<String, dynamic> json) {
    return MeterModel(
      message: json['message'] ?? "",
      status: json['status'] ?? "",
      serialNumber: json['serial_number'] ?? "",
      meterNumber: json['meter_number'] ?? "",
      lastReading: json['lastReading'] ?? "",
      billingCycle: json['billing_cycle'] ?? "",
      billingCyclePeriods: json['billing_cycle_period'] ?? "",
      currentMeterReading:  "",
    );
  }

}