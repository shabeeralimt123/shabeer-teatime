// To parse this JSON data, do
//
//     final stockItemDetails = stockItemDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<StockItemDetails> stockItemDetailsFromJson(String str) => List<StockItemDetails>.from(json.decode(str).map((x) => StockItemDetails.fromJson(x)));

String stockItemDetailsToJson(List<StockItemDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StockItemDetails {
    StockItemDetails({
        @required this.id,
        @required this.itemId,
        @required this.ctnQty,
        @required this.ctnPrice,
        @required this.ctnTotal,
        @required this.pcsQty,
        @required this.pcsRate,
        @required this.pcsTotal,
        @required this.grandtotal,
        @required this.fkDetails,
        @required this.name,
        @required this.productCode,
    });

    final String id;
    final String itemId;
    final String ctnQty;
    final String ctnPrice;
    final String ctnTotal;
    final String pcsQty;
    final String pcsRate;
    final String pcsTotal;
    final String grandtotal;
    final String fkDetails;
    final String name;
    final String productCode;

    factory StockItemDetails.fromJson(Map<String, dynamic> json) => StockItemDetails(
        id: json["id"],
        itemId: json["item_id"],
        ctnQty: json["ctn_qty"],
        ctnPrice: json["ctn_price"],
        ctnTotal: json["ctn_total"],
        pcsQty: json["pcs_qty"],
        pcsRate: json["pcs_rate"],
        pcsTotal: json["pcs_total"],
        grandtotal: json["grandtotal"],
        fkDetails: json["fk_details"],
        name: json["name"],
        productCode: json["product_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "item_id": itemId,
        "ctn_qty": ctnQty,
        "ctn_price": ctnPrice,
        "ctn_total": ctnTotal,
        "pcs_qty": pcsQty,
        "pcs_rate": pcsRate,
        "pcs_total": pcsTotal,
        "grandtotal": grandtotal,
        "fk_details": fkDetails,
        "name": name,
        "product_code": productCode,
    };
}