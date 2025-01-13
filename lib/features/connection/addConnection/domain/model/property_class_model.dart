class PropertyClassModel {
  dynamic id;
  String? name;

  PropertyClassModel({this.id, this.name});

  factory PropertyClassModel.fromJson(Map<String, dynamic> json) {
    return PropertyClassModel(
      id: json[''] ?? "",
      name: json[''] ?? "",
    );
  }

  getData() {
    List<PropertyClassModel> proofList = [];
    List<String> list = ['General'];
    int i = 1;
    for(var data in list){
      proofList.add(
          PropertyClassModel(
            id: i.toString(),
            name: data.toString(),
          )
      );
      i++;
    }
    return proofList;
  }
}