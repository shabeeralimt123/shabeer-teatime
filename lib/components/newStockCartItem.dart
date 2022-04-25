import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatime/bloc/stock/stock_cubit.dart';

import 'package:teatime/database/stock_database.dart';

import 'package:teatime/resources/theme_resources.dart';

class NewStockCartItem extends StatefulWidget {
  final StockData item;

  const NewStockCartItem({Key key, this.item}) : super(key: key);

  @override
  _NewStockCartItemState createState() => _NewStockCartItemState();
}

class _NewStockCartItemState extends State<NewStockCartItem> {
  TextEditingController utnqtyController = TextEditingController();
  // TextEditingController utnrateController = TextEditingController();
  // TextEditingController utntotalController = TextEditingController();
  TextEditingController pcsqtyController = TextEditingController();
  // TextEditingController pcsrateController = TextEditingController();
  // TextEditingController pcstotalController = TextEditingController();
  // TextEditingController grandtotalController = TextEditingController();
  double a = 0;
  double b = 0;
  double c = 0;
  double d = 0;

  @override
  void initState() {
    super.initState();
    utnqtyController.text = widget.item.ctnqty;
    // utnrateController.text = widget.item.ctnrate;
    // utntotalController.text = widget.item.ctntotal;
    pcsqtyController.text = widget.item.pcsqty;
    // pcsrateController.text = widget.item.pcsrate;
    // pcstotalController.text = widget.item.pcstotal;
    // grandtotalController.text = widget.item.grandtotal;
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
                          height: MediaQuery.of(context).size.height * .04,
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
                            onChanged: (value) {
                              // final x = double.tryParse(value);

                              // setState(() {
                              // a = double.parse(utnqtyController.text) ?? 0;
                              // b = double.parse(utnrateController.text) ?? 0;
                              // c = double.parse(pcsqtyController.text);
                              // d = double.parse(pcsrateController.text);
                              // a = x ??
                              // widget
                              // .item.ctnqty; // handle null and String

                              //   utntotalController.text =
                              //       (a * b).toStringAsFixed(2);
                              //   grandtotalController.text =
                              //       ((a * b) + (c * d)).toStringAsFixed(2);
                              // });
                            },
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
                          height: MediaQuery.of(context).size.height * .04,
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
                            onChanged: (value) {
                              // final y = double.tryParse(value);

                              //   setState(() {
                              //  a = double.parse(utnqtyController.text) ?? 0;
                              //     b = double.parse(utnrateController.text) ?? 0;
                              //     c = double.parse(pcsqtyController.text);
                              //     d = double.parse(pcsrateController.text);

                              // c = y ??
                              //     widget
                              //         .item.pcsqty; // handle null and String

                              //   pcstotalController.text =
                              //       (c * d).toStringAsFixed(2);
                              //   grandtotalController.text =
                              //       ((a * b) + (c * d)).toStringAsFixed(2);
                              // });
                            },
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
                            width: MediaQuery.of(context).size.width * .11),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .50,
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: ThemeColors.red,
                              onPressed: () {
                                try {
                                  BlocProvider.of<StockCubit>(context)
                                      .updateStockItem(
                                    context,
                                    widget.item.id,
                                    double.tryParse(utnqtyController.text) ??
                                        0.00,
                                    // double.tryParse(utnrateController.text),
                                    // double.tryParse(utntotalController.text),
                                    double.tryParse(pcsqtyController.text) ??
                                        0.00,
                                    // double.tryParse(pcsrateController.text),
                                    // double.tryParse(pcstotalController.text),
                                    // double.tryParse(grandtotalController.text),
                                  );
                                  Navigator.pop(context);
                                } catch (ex) {}
                              },
                              child: Text(
                                "Update",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: Text(
                "${widget.item.name}",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              )),
              SizedBox(
                width: 10,
              ),
              Text(widget.item.pcsqty + " pcs"),
              SizedBox(
                width: 10,
              ),
              Text(widget.item.ctnqty + " ctn"),
              SizedBox(
                width: 10,
              ),
              IconButton(
                color: Colors.red,
                icon: Icon(Icons.delete),
                onPressed: () {
                  BlocProvider.of<StockCubit>(context)
                    ..deleteFromStock(context, widget.item.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
