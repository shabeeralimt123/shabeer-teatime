// To parse this JSON data, do
//
//     final stockModel = stockModelFromJson(jsonString);


import 'dart:convert';

List<StockModel> stockModelFromJson(String str) =>
    List<StockModel>.from(json.decode(str).map((x) => StockModel.fromJson(x)));

String stockModelToJson(List<StockModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StockModel {
  StockModel({
    this.id,
    this.date,
    this.branchId,
    this.time,
    this.poNo,
    this.total,
  });

  final String id;
  final String date;
  final String branchId;
  final String time;
  final String poNo;
  final String total;

  factory StockModel.fromJson(Map<String, dynamic> json) => StockModel(
        id: json["id"],
        date: json["date"],
        branchId: json["branch_id"],
        time: json["time"],
        poNo: json["po_no"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "$date",
        "branch_id": branchId,
        "time": time,
        "po_no": poNo,
        "total": total,
      };
}
