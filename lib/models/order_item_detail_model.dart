class OrderDetailItemModel {
  int id;
  int fkProduct;
  String qty;
  int fkSupplier;
  int status;
  int poId;
  String name;
  String productCode;
  int unit;
  String unitname;

  OrderDetailItemModel(
      {this.id,
      this.fkProduct,
      this.qty,
      this.fkSupplier,
      this.status,
      this.poId,
      this.name,
      this.productCode,
      this.unit,
      this.unitname});

  OrderDetailItemModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    fkProduct = int.parse(json['fk_product'].toString());
    qty = json['qty'].toString();
    fkSupplier = int.parse(json['fk_supplier'].toString());
    status = int.parse(json['status'].toString());
    poId = int.parse(json['po_id'].toString());
    name = json['name'].toString();
    productCode = json['product_code'].toString();
    unit = int.parse(json['unit'].toString());
    unitname = json['unitName'];
  }
}
