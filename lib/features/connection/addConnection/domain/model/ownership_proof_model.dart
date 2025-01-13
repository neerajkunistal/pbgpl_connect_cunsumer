List<OwnerShipProofModel> ownerShipProofListResponse(var json) {
  return List<OwnerShipProofModel>.from(json.map((x) => OwnerShipProofModel.fromJson(x)));
}

class OwnerShipProofModel {
  dynamic id;
  String? name;

  OwnerShipProofModel({this.id, this.name});

  factory OwnerShipProofModel.fromJson(Map<String, dynamic> json) {
    return OwnerShipProofModel(
      id: json[''] ?? "",
      name: json[''] ?? "",
    );
  }

  getData() {
    List<OwnerShipProofModel> proofList = [];
    List<String> list = ['Electric Bill', 'Water Bill', 'House Tax', 'Telephone Bill', 'Sale Deed Agreement', 'Society Agreement ID', 'Others'];
    int i = 1;
    for(var data in list){
      proofList.add(
          OwnerShipProofModel(
            id: i.toString(),
            name: data.toString(),
          )
      );
      i++;
    }
    return proofList;
  }
}