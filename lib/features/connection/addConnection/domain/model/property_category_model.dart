class PropertyCategoryModel {
  dynamic id;
  String? name;

  PropertyCategoryModel({this.id, this.name});

  factory PropertyCategoryModel.fromJson(Map<String, dynamic> json) {
    return PropertyCategoryModel(
      id: json[''] ?? "",
      name: json[''] ?? "",
    );
  }

  getData() {
    List<PropertyCategoryModel> proofList = [];
    List<String> list = ['Domestic'];
    int i = 1;
    for(var data in list){
      proofList.add(
          PropertyCategoryModel(
            id: i.toString(),
            name: data.toString(),
          )
      );
      i++;
    }
    return proofList;
  }
}