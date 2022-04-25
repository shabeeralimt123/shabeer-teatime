class UnitModel {
  int id;
  String name;
  String alias;

  UnitModel({this.id, this.name, this.alias});

  UnitModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    name = json['name'].toString();
    alias = json['alias'].toString();
  }
}
