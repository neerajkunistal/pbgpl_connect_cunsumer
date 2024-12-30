List<GaModel> gaListResponse(var json) {
  return List<GaModel>.from(json.map((x) => GaModel.fromJson(x)));
}

class GaModel {

  String? status;
  String? schema;
  String? city;

  GaModel({required this.status, required this.schema, required this.city});

  factory GaModel.fromJson(Map<String, dynamic> json ) {
    return GaModel(
        status: json['status'] ?? "",
        schema: json['schema'] ?? "",
        city: json['city'] ?? ""
    );
  }
}