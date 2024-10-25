// To parse this JSON data, do
//
//     final getSubCategoryModel = getSubCategoryModelFromJson(jsonString);

import 'dart:convert';

GetSubCategoryModel getSubCategoryModelFromJson(String str) => GetSubCategoryModel.fromJson(json.decode(str));

String getSubCategoryModelToJson(GetSubCategoryModel data) => json.encode(data.toJson());

class GetSubCategoryModel {
  GetSubCategoryModel({
    this.status,
    this.error,
    this.data,
  });

  int? status;
  bool? error;
  List<GetSubCategoryData>? data;

  factory GetSubCategoryModel.fromJson(Map<String, dynamic> json) => GetSubCategoryModel(
    status: json["status"],
    error: json["error"],
    data: List<GetSubCategoryData>.from(json["data"].map((x) => GetSubCategoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class GetSubCategoryData {
  GetSubCategoryData({
    this.id,
    this.parentId,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.escalationDays,
    this.complaintMobiles,
    this.formType,
    this.price,
    this.qty,
    this.unit,
    this.servicePrice,
    this.priceTax,
    this.priority,
  });

  String? id;
  String? parentId;
  String? title;
  dynamic? description;
  dynamic? createdAt;
  dynamic? updatedAt;
  dynamic? deletedAt;
  String? escalationDays;
  dynamic complaintMobiles;
  String? formType;
  String? price;
  String? qty;
  String? unit;
  String? servicePrice;
  String? priceTax;
  String? priority;

  factory GetSubCategoryData.fromJson(Map<String, dynamic> json) => GetSubCategoryData(
    id: json["id"],
    parentId: json["parent_id"],
    title: json["title"],
    description: json["description"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
    escalationDays: json["escalation_days"],
    complaintMobiles: json["complaint_mobiles"],
    formType: json["form_type"],
    price: json["price"],
    qty: json["qty"],
    unit: json["unit"],
    servicePrice: json["service_price"],
    priceTax: json["price_tax"],
    priority: json["priority"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "title": title,
    "description": description,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
    "escalation_days": escalationDays,
    "complaint_mobiles": complaintMobiles,
    "form_type": formType,
    "price": price,
    "qty": qty,
    "unit": unit,
    "service_price": servicePrice,
    "price_tax": priceTax,
    "priority": priority,
  };
}


class GetSubCategoryRequestModel{
  final String? schema;
  final String? categoryId;
  GetSubCategoryRequestModel({ this.schema,this.categoryId});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "schema": schema.toString().trim(),
      "category_id": categoryId.toString().trim(),
    };
    return map ;
  }
}
