import 'package:flutter/material.dart';
import 'package:teatime/models/order_item_detail_model.dart';

class OrderDetailsItem extends StatefulWidget {
  final OrderDetailItemModel item;

  const OrderDetailsItem({Key key, this.item}) : super(key: key);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderDetailsItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        },
      child: SizedBox(
        height: 50,
        child: Card(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Text(widget.item.name)),
                SizedBox(width: 10,),
                Text(widget.item.qty.toString() + " ${widget.item.unitname}",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
