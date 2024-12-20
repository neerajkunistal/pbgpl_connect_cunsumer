List<CategoryModel> categoryListResponse(var json) {
  return List<CategoryModel>.from(json.map((x) =>  CategoryModel.fromJson(x)));
}

class CategoryModel {

  String? id;
  String? parentId;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? escalationDays;
  String? complaintMobiles;
  String? formType;
  String? price;
  String? qty;
  String? unit;
  String? servicePrice;
  String? priceTax;
  String? priority;

  CategoryModel(
      {this.id,
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
        this.priority});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    parentId = json['parent_id'] ?? "";
    title = json['title'] ?? "";
    description = json['description'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
    deletedAt = json['deleted_at'] ?? "";
    escalationDays = json['escalation_days'] ?? "";
    complaintMobiles = json['complaint_mobiles'] ?? "";
    formType = json['form_type']  ?? "";
    price = json['price'] ?? "";
    qty = json['qty'] ?? "";
    unit = json['unit'] ?? "";
    servicePrice = json['service_price'] ?? "";
    priceTax = json['price_tax'] ?? "";
    priority = json['priority'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['escalation_days'] = this.escalationDays;
    data['complaint_mobiles'] = this.complaintMobiles;
    data['form_type'] = this.formType;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['unit'] = this.unit;
    data['service_price'] = this.servicePrice;
    data['price_tax'] = this.priceTax;
    data['priority'] = this.priority;
    return data;
  }
}

class CategoryRequestModel {
  final String? schema;

  CategoryRequestModel({
    this.schema,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "schema": schema.toString().trim(),
    };
    return map;
  }
}