class DisconnectionTypeModel {

  dynamic id;
  String? name;

  DisconnectionTypeModel({this.id, this.name});

  factory DisconnectionTypeModel.fromJson(Map<String, dynamic> json) {
    return DisconnectionTypeModel(
      id: json[''] ?? "",
      name: json[''] ?? "",
    );
  }

  getData() {
    List<DisconnectionTypeModel> list = [];
    List<dynamic> array = ['Permanent Disconnection'];
    int i = 2;
    for(var data in array){
      list.add(DisconnectionTypeModel(
        id: i.toString(),
        name: data.toString(),
      ));
      i++;
    }
    return list;
  }
}