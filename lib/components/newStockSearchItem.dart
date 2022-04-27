import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatime/bloc/products/products_cubit.dart';
import 'package:teatime/bloc/stock/stock_cubit.dart';

import 'package:teatime/helpers/dialogs.dart';
import 'package:teatime/models/product.dart';
import 'package:teatime/resources/theme_resources.dart';

class NewStockSearchItem extends StatefulWidget {
  final ProductModel productModel;
  NewStockSearchItem({Key key, this.productModel}) : super(key: key);

  @override
  State<NewStockSearchItem> createState() => _NewStockSearchItemState();
}

class _NewStockSearchItemState extends State<NewStockSearchItem> {
  TextEditingController utnqtyController = TextEditingController();
  TextEditingController utnrateController = TextEditingController();
  TextEditingController utntotalController = TextEditingController();
  TextEditingController pcsqtyController = TextEditingController();
  TextEditingController pcsrateController = TextEditingController();
  TextEditingController pcstotalController = TextEditingController();
  TextEditingController grandtotalController = TextEditingController();

  double a = 0;
  double b = 0;
  double c = 0;
  double d = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      width: 600,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .005,
                          ),
                          Row(
                            children: [
                              Text(
                                "Qty (ctn)  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .009,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                                height:
                                    MediaQuery.of(context).size.height * .04,
                                width: MediaQuery.of(context).size.width * .75,
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r"[0-9.]")),
                                    TextInputFormatter.withFunction(
                                        (oldValue, newValue) {
                                      try {
                                        final text = newValue.text;
                                        if (text.isNotEmpty) double.parse(text);
                                        return newValue;
                                      } catch (e) {}
                                      return oldValue;
                                    }),
                                  ],
                                  // onChanged: (value) {
                                  // final x = double.tryParse(value);

                                  // setState(() {
                                  //   a = x ?? 0; // handle null and String

                                  //   utntotalController.text =
                                  //       (a * b).toStringAsFixed(2);
                                  //   grandtotalController.text =
                                  //       ((a * b) + (c * d))
                                  //           .toStringAsFixed(2);
                                  // });
                                  // },
                                  controller: utnqtyController,
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true, signed: false),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Qty",
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .009,
                          ),
                          Row(
                            children: [
                              Text(
                                "Qty (pcs)  ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .009,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                                height:
                                    MediaQuery.of(context).size.height * .04,
                                width: MediaQuery.of(context).size.width * .75,
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r"[0-9.]")),
                                    TextInputFormatter.withFunction(
                                        (oldValue, newValue) {
                                      try {
                                        final text = newValue.text;
                                        if (text.isNotEmpty) double.parse(text);
                                        return newValue;
                                      } catch (e) {}
                                      return oldValue;
                                    }),
                                  ],
                                  // onChanged: (value) {
                                  // final y = double.tryParse(value);

                                  // setState(() {
                                  // c = y ?? 0; // handle null and String

                                  // pcstotalController.text =
                                  //     (c * d).toStringAsFixed(2);
                                  // grandtotalController.text =
                                  //     ((a * b) + (c * d))
                                  //         .toStringAsFixed(2);
                                  // });
                                  // },
                                  controller: pcsqtyController,
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true, signed: false),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Qty",
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .009,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .009,
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel")),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .10),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .50,
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color: ThemeColors.red,
                                    onPressed: () {
                                      try {
                                        BlocProvider.of<StockCubit>(context)
                                          ..insertIntoStock(
                                            context,
                                            widget.productModel,
                                            double.tryParse(
                                                    utnqtyController.text) ??
                                                0.00,
                                            double.tryParse(
                                                    pcsqtyController.text) ??
                                                0.00,
                                            widget.productModel.id,
                                            widget.productModel.name,
                                          );
                                        BlocProvider.of<ProductsCubit>(context)
                                          ..emptyProducts();
                                      } catch (ex) {
                                        showErrorDialog(context,
                                            message:
                                                "Please enter a valid quantity");
                                      }
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Add",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ));
      },
      child: SizedBox(
        height: 50,
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.productModel.name,
              textAlign: TextAlign.left,
              maxLines: 5,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
