class OrderModel {
  int id;
  String poNo;
  String date;
  String status;
  int totalItems;

  OrderModel(
      {this.id,
        this.poNo,
        this.date,
        this.status,
        this.totalItems});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    poNo = json['po_no'].toString();
    date = json['date'].toString();
    status = json['status'].toString();
    totalItems = int.parse(json['total_items'].toString());
  }

}
