import 'package:flutter/material.dart';
import 'package:teatime/models/order_model.dart';
import 'package:teatime/screens/orders_details_screen.dart';

class OrderItem extends StatefulWidget {
  final OrderModel item;

  const OrderItem({Key key, this.item}) : super(key: key);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, OrderDetailsScreen.route(widget.item));
        },
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisSize:MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 2,
                      child: Text("Entry No:")),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 4,
                    child: Text(widget.item.poNo,maxLines:3,overflow:TextOverflow.ellipsis,style: TextStyle(
                        fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisSize:MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 2,
                      child: Text("Order Date:")),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 4,
                    child: Text(widget.item.date,maxLines:3,overflow:TextOverflow.ellipsis,style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisSize:MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 2,
                      child: Text("Total Items:")),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 4,
                    child: Text(widget.item.totalItems.toString() + " items",maxLines:3,overflow:TextOverflow.ellipsis,style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
