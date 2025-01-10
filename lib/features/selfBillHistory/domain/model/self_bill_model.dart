List<SelfBillModel> selfBillingHistoryResponse(var json) {
  return List<SelfBillModel>.from(json.map((x) => SelfBillModel.fromJson(x)));
}

class SelfBillModel {
  String? id;
  String? meterSerial;
  String? meterReading;
  String? meterImage;
  String? dmaId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? cycleFrom;
  String? cycleTo;
  String? meterNumber;
  String? prevBillReading;
  String? billLat;
  String? billLong;
  dynamic remarks;

  SelfBillModel(
      {this.id,
        this.meterSerial,
        this.meterReading,
        this.meterImage,
        this.dmaId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.cycleFrom,
        this.cycleTo,
        this.meterNumber,
        this.prevBillReading,
        this.billLat,
        this.billLong,
        this.remarks});

  SelfBillModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    meterSerial = json['meter_serial'] ?? "";
    meterReading = json['meter_reading'] ?? "";
    meterImage = json['meter_image'] ?? "";
    dmaId = json['dma_id'] ?? "";
    status = json['status'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
    cycleFrom = json['cycle_to'] ?? "";
    cycleTo = json['cycle_from'] ?? "";
    meterNumber = json['meter_number'] ?? "";
    prevBillReading = json['prev_bill_reading'] ?? "";
    billLat = json['bill_lat'] ?? "";
    billLong = json['bill_long'] ?? "";
    remarks = json['remarks'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['meter_serial'] = this.meterSerial;
    data['meter_reading'] = this.meterReading;
    data['meter_image'] = this.meterImage;
    data['dma_id'] = this.dmaId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['meter_number'] = this.meterNumber;
    data['prev_bill_reading'] = this.prevBillReading;
    data['bill_lat'] = this.billLat;
    data['bill_long'] = this.billLong;
    data['remarks'] = this.remarks;
    return data;
  }
}