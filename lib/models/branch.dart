class BranchModel {
  int id;
  String name;
  String alias;
  String address;
  String mobile;
  String pin;

  BranchModel(
      {this.id,
        this.name,
        this.alias,
        this.address,
        this.mobile,
        this.pin,
      });

  BranchModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    name = json['name'].toString();
    alias = json['alias'].toString();
    address = json['address'].toString();
    mobile = json['mobile'].toString();
    pin = json['pin'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['pin'] = this.pin;
    return data;
  }
}
