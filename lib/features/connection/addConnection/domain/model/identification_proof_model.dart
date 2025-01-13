List<IdentificationProofModel> identificationProofListResponse(var json) {
  return List<IdentificationProofModel>.from(json.map((x) => IdentificationProofModel.fromJson(x)));
}

class IdentificationProofModel {
  dynamic id;
  String? name;

  IdentificationProofModel({this.id, this.name});

  factory IdentificationProofModel.fromJson(Map<String, dynamic> json) {
    return IdentificationProofModel(
      id: json[''] ?? "",
      name: json[''] ?? "",
    );
  }

  getData() {
    List<IdentificationProofModel> proofList = [];
    List<String> list = ['Aadhar', 'Voter', 'Ration Card', 'PAN', 'Passport', 'Owner ID', 'Others'];
    int i = 1;
    for(var data in list){
      proofList.add(
        IdentificationProofModel(
          id: i.toString(),
          name: data.toString(),
        )
      );
      i++;
    }
    return proofList;
  }
}