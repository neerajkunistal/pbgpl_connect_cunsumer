// To parse this JSON data, do
//
//     final complaintSaveModel = complaintSaveModelFromJson(jsonString);

import 'dart:convert';

ComplaintSaveModel complaintSaveModelFromJson(String? str) => ComplaintSaveModel.fromJson(json.decode(str!));

String? complaintSaveModelToJson(ComplaintSaveModel data) => json.encode(data.toJson());

class ComplaintSaveModel {
  ComplaintSaveModel({
    this.error,
    this.status,
    this.data,
  });

  bool? error;
  int? status;
  String? data;

  factory ComplaintSaveModel.fromJson(Map<String, dynamic> json) => ComplaintSaveModel(
    error: json["error"] ?? '',
    status: json["status"] ?? "",
    data: json["data"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "status": status,
    "data": data,
  };
}


class ComplaintSaveRequestModel{
  final String? schema;
  final String? dmaId;
  final String? complainCat;
  final String? complainSubCat;
  final String? description;
  final String? priority;
  final String? attachedDoc;

  const ComplaintSaveRequestModel({
  this.schema,
  this.dmaId,
  this.complainCat,
  this.complainSubCat,
  this.description,
  this.priority,
  this.attachedDoc,

  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "schema": schema.toString().trim(),
      "dma_id": dmaId!.trim(),
      "complain_cat": complainCat.toString().trim(),
      "complain_subcat": complainSubCat.toString().trim(),
      "description": description.toString().trim(),
      "priority": priority.toString().trim(),
      "attached_doc": attachedDoc.toString().trim(),
    };
    return map ;
  }
}


