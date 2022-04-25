import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatime/bloc/cart/cart_cubit.dart';
import 'package:teatime/bloc/unit/unit_cubit.dart';
import 'package:teatime/database/database.dart';
import 'package:teatime/resources/theme_resources.dart';

class CartItem extends StatefulWidget {
  final Particular item;

  const CartItem({Key key, this.item}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  TextEditingController qtyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    qtyController.text = widget.item.qty.toString();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => BlocProvider.value(
                  value: BlocProvider.of<UnitCubit>(this.context),
                  child: Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .4,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Enter Quantity",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                autofocus: true,
                                controller: qtyController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Qty",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Select Unit",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              BlocBuilder<UnitCubit, UnitState>(
                                  builder: (context, state) {
                                if (state is UnitInitial) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                if (state is UnitLoaded) {
                                  if (state.units.length == 0) {
                                    return Container();
                                  }
                                  return Container(
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: state.unit,
                                          items: [
                                            DropdownMenuItem(
                                              child: Text("Select"),
                                              value: null,
                                            ),
                                            ...state.units
                                                .map((e) => DropdownMenuItem(
                                                    child: Text(e.name),
                                                    value: e))
                                                .toList()
                                          ],
                                          onChanged: (val) {
                                            BlocProvider.of<UnitCubit>(context)
                                                .getUnits(id: val.id);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                if (state is UnitError) {
                                  return Center(child: Text(state.message));
                                }
                                return Container();
                              }),
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel")),
                                  Expanded(
                                    child: BlocBuilder<UnitCubit,UnitState>(
                                      builder:(context,state)=> RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          color: ThemeColors.red,
                                          onPressed: () {
                                            if(state is UnitLoaded){
                                              try{

                                                BlocProvider.of<CartCubit>(context)
                                                  ..updateCartItem(
                                                      context,
                                                      widget.item.id,
                                                      qtyController.text,state.unit.id,state.unit.name);
                                                Navigator.pop(context);
                                              }catch(ex){

                                              }
                                            }
                                          },
                                          child: Text(
                                            "Update",
                                            style: TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ));
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
                widget.item.name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              )),
              SizedBox(
                width: 10,
              ),
              Text(widget.item.qty.toString() + " ${widget.item.unitname}"),
              SizedBox(
                width: 10,
              ),
              IconButton(
                color: Colors.red,
                icon: Icon(Icons.delete),
                onPressed: () {
                  BlocProvider.of<CartCubit>(context)
                    ..deleteFromCart(context, widget.item.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
