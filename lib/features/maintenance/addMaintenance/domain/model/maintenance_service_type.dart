List<MaintenanceServiceTypeModel> maintenanceServiceListResponse(var json) {
  return List<MaintenanceServiceTypeModel>.from(json.map((x) => MaintenanceServiceTypeModel.fromJson(x)));
}

class MaintenanceServiceTypeModel {
  String? id;
  String? service;
  String? description;
  String? amount;
  String? tax;
  String? finalAmount;
  String? maintenanceType;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? statusDatetime;
  String? taxId;

  MaintenanceServiceTypeModel(
      {this.id,
        this.service,
        this.description,
        this.amount,
        this.tax,
        this.finalAmount,
        this.maintenanceType,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.statusDatetime,
        this.taxId});

  MaintenanceServiceTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    service = json['service'] ?? "";
    description = json['description'] ?? "";
    amount = json['amount'] ?? "";
    tax = json['tax'] ?? "";
    finalAmount = json['final_amount'] ?? "";
    maintenanceType = json['maintenance_type'] ?? "";
    status = json['status'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
    statusDatetime = json['status_datetime'] ?? "";
    taxId = json['tax_id'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service'] = this.service;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['tax'] = this.tax;
    data['final_amount'] = this.finalAmount;
    data['maintenance_type'] = this.maintenanceType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status_datetime'] = this.statusDatetime;
    data['tax_id'] = this.taxId;
    return data;
  }
}