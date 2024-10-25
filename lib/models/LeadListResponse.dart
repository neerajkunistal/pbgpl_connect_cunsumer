class LeadListResponse {
  int? status;
  List<Datalist>? response;

  LeadListResponse({this.status, this.response});

  LeadListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <Datalist>[];
      json['response'].forEach((v) {
        response!.add(new Datalist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datalist {
  String? id;
  String? loginId;
  String? empName;
  String? companyName;
  String? contactPerson;
  String? designation;
  String? email;
  String? mobileNo;
  String? address;
  String? pinCode;
  String? customerRemarks;
  String? demo;
  String? leadRemarks;
  String? nextFollowUpDate;
  String? nextFollowUpTime;
  String? leadType;
  String? productName;
  String? productUnit;
  String? quantity;
  String? pricePerUnit;
  String? totalOrderValue;
  String? state;
  String? city;
  String? creationDate;
  String? userDate;
  String? customerType;
  String? distance;
  String? sLat;
  String? sLog;
  String? eLat;
  String? eLog;
  String? latLongAddress;

  Datalist(
      {this.id,
        this.loginId,
        this.empName,
        this.companyName,
        this.contactPerson,
        this.designation,
        this.email,
        this.mobileNo,
        this.address,
        this.pinCode,
        this.customerRemarks,
        this.demo,
        this.leadRemarks,
        this.nextFollowUpDate,
        this.nextFollowUpTime,
        this.leadType,
        this.productName,
        this.productUnit,
        this.quantity,
        this.pricePerUnit,
        this.totalOrderValue,
        this.state,
        this.city,
        this.creationDate,
        this.userDate,
        this.customerType,
        this.distance,
        this.sLat,
        this.sLog,
        this.eLat,
        this.eLog,
        this.latLongAddress});

  Datalist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loginId = json['login_id'];
    empName = json['emp_name'];
    companyName = json['company_name'];
    contactPerson = json['contact_person'];
    designation = json['designation'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    address = json['address'];
    pinCode = json['pin_code'];
    customerRemarks = json['customer_remarks'];
    demo = json['demo'];
    leadRemarks = json['lead_remarks'];
    nextFollowUpDate = json['next_follow_up_date'];
    nextFollowUpTime = json['next_follow_up_time'];
    leadType = json['lead_type'];
    productName = json['product_name'];
    productUnit = json['product_unit'];
    quantity = json['quantity'];
    pricePerUnit = json['price_per_unit'];
    totalOrderValue = json['total_order_value'];
    state = json['state'];
    city = json['city'];
    creationDate = json['creation_date'];
    userDate = json['user_date'];
    customerType = json['customer_type'];
    distance = json['distance'];
    sLat = json['s_lat'];
    sLog = json['s_log'];
    eLat = json['e_lat'];
    eLog = json['e_log'];
    latLongAddress = json['lat_long_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login_id'] = this.loginId;
    data['emp_name'] = this.empName;
    data['company_name'] = this.companyName;
    data['contact_person'] = this.contactPerson;
    data['designation'] = this.designation;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['address'] = this.address;
    data['pin_code'] = this.pinCode;
    data['customer_remarks'] = this.customerRemarks;
    data['demo'] = this.demo;
    data['lead_remarks'] = this.leadRemarks;
    data['next_follow_up_date'] = this.nextFollowUpDate;
    data['next_follow_up_time'] = this.nextFollowUpTime;
    data['lead_type'] = this.leadType;
    data['product_name'] = this.productName;
    data['product_unit'] = this.productUnit;
    data['quantity'] = this.quantity;
    data['price_per_unit'] = this.pricePerUnit;
    data['total_order_value'] = this.totalOrderValue;
    data['state'] = this.state;
    data['city'] = this.city;
    data['creation_date'] = this.creationDate;
    data['user_date'] = this.userDate;
    data['customer_type'] = this.customerType;
    data['distance'] = this.distance;
    data['s_lat'] = this.sLat;
    data['s_log'] = this.sLog;
    data['e_lat'] = this.eLat;
    data['e_log'] = this.eLog;
    data['lat_long_address'] = this.latLongAddress;
    return data;
  }
}