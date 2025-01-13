class GuardianModel {
  dynamic id;
  String? name;

  GuardianModel({this.id, this.name});

  factory GuardianModel.fromJson(Map<String, dynamic> json) {
    return GuardianModel(
      id: json[''] ?? "",
      name: json[''] ?? "",
    );
  }

  getData() {
    List<GuardianModel> proofList = [];
    List<String> list = ['Father', 'Spouse'];
    int i = 1;
    for(var data in list){
      proofList.add(
          GuardianModel(
            id: i.toString(),
            name: data.toString(),
          )
      );
      i++;
    }
    return proofList;
  }
}