class DisconnectionReasonType {

  dynamic id;
  String? name;

  DisconnectionReasonType({this.id, this.name});

  factory DisconnectionReasonType.fromJson(Map<String, dynamic> json) {
    return DisconnectionReasonType(
      id: json[''] ?? "",
      name: json[''] ?? "",
    );
  }

  getData() {
     List<DisconnectionReasonType> list = [];
     List<dynamic> array = ['shifting', 'Demolish', 'Non Payment', 'Alternative Energy','Other'];
     int i = 1;
     for(var data in array){
       list.add(DisconnectionReasonType(
         id: i.toString(),
         name: data.toString(),
       ));
       i++;
     }
    return list;
  }
}