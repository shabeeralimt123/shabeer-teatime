class ProductModel {
  int id;
  String name;
  String productCode;
  String barcode;
  int supplier;
  String unit;
  String unitName;

  ProductModel(
      {this.id,
        this.name,
        this.productCode,
        this.barcode,
        this.supplier,
        this.unit,
        this.unitName});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    name = json['name'];
    productCode = json['product_code'];
    barcode = json['barcode'];
    supplier = int.parse(json['supplier'].toString());
    unit = json['unit'];
    unitName = json['unit_name'];
  }

}
