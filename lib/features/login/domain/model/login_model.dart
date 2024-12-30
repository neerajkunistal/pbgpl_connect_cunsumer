List<LoginModel> loginResponse(var json) {
  return List<LoginModel>.from(json.map((x) => LoginModel.fromJson(x)));
}

class LoginModel {
  String? id;
  String? bpNumber;
  String? trNumber;
  dynamic serialNumber;
  String? dmaId;
  String? name;
  String? schema;
  String? crn;
  String? mobileNumber;
  String? email;
  String? dateOfRegistration;
  String? address;
  String? area;
  String? locality;
  String? town;
  String? pincode;
  dynamic district;
  dynamic states;

  LoginModel(
      {this.id,
        this.bpNumber,
        this.trNumber,
        this.serialNumber,
        this.dmaId,
        this.name,
        this.schema,
        this.crn,
        this.mobileNumber,
        this.email,
        this.dateOfRegistration,
        this.address,
        this.area,
        this.locality,
        this.town,
        this.pincode,
        this.district,
        this.states});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    bpNumber = json['bp_number'] ?? "";
    trNumber = json['tr_number'] ?? "";
    serialNumber = json['serial_number'] ?? "";
    dmaId = json['dma_id'] ?? "";
    name = json['name'] ?? "";
    schema = json['schema'] ?? "";
    crn = json['crn'] ?? "";
    mobileNumber = json['mobile_number'] ?? "";
    email = json['email'] ?? "";
    dateOfRegistration = json['date_of_registration'] ?? "";
    address = json['address'] ?? "";
    area = json['area'] ?? "";
    locality = json['locality'] ?? "";
    town = json['town'] ?? "";
    pincode = json['pincode'] ?? "";
    district = json['district'] ?? "";
    states = json['states'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bp_number'] = this.bpNumber;
    data['serial_number'] = this.serialNumber;
    data['dma_id'] = this.dmaId;
    data['name'] = this.name;
    data['schema'] = this.schema;
    data['crn'] = this.crn;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    data['date_of_registration'] = this.dateOfRegistration;
    data['address'] = this.address;
    data['area'] = this.area;
    data['locality'] = this.locality;
    data['town'] = this.town;
    data['pincode'] = this.pincode;
    data['district'] = this.district;
    data['states'] = this.states;
    return data;
  }
}

class LoginRequestModel{
  dynamic bpNumber;
  dynamic password;
  dynamic schema;
  dynamic otp;

  LoginRequestModel(
      {this.bpNumber,
        this.password,
        this.schema,
        this.otp});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "bp_number": bpNumber.trim().toString(),
      "password": password.trim().toString(),
      "schema": schema.trim().toString(),
      "otp": otp.trim().toString(),
    };
    return map;
  }
}