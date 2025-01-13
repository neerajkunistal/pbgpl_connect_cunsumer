List<CookingFuelModel> cookingFuelListResponse(var json) {
  return List<CookingFuelModel>.from(json.map((x) => CookingFuelModel.fromJson(x)));
}

class CookingFuelModel {
  dynamic id;
  String? name;

  CookingFuelModel({this.id, this.name});

  factory CookingFuelModel.fromJson(Map<String, dynamic> json) {
    return CookingFuelModel(
      id: json[''] ?? "",
      name: json[''] ?? "",
    );
  }

  getData() {
    List<CookingFuelModel> proofList = [];
    List<String> list = ['Gas Cylinder', 'Electric', 'Kerosene', 'Coal', 'Wood'];
    int i = 1;
    for(var data in list){
      proofList.add(
          CookingFuelModel(
            id: i.toString(),
            name: data.toString(),
          )
      );
      i++;
    }
    return proofList;
  }
}