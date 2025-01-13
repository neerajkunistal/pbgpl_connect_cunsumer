class OwnerTypePropertyModel {
  dynamic id;
  String? name;

  OwnerTypePropertyModel({this.id, this.name});

  factory OwnerTypePropertyModel.fromJson(Map<String, dynamic> json) {
    return OwnerTypePropertyModel(
      id: json[''] ?? "",
      name: json[''] ?? "",
    );
  }

  getData() {
    List<OwnerTypePropertyModel> proofList = [];
    List<String> list = ['Owner', 'Rented'];
    int i = 1;
    for(var data in list){
      proofList.add(
          OwnerTypePropertyModel(
            id: i.toString(),
            name: data.toString(),
          )
      );
      i++;
    }
    return proofList;
  }
}