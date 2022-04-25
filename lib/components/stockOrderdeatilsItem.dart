import 'package:flutter/material.dart';
import 'package:teatime/models/stock_item_detail_model.dart';

class StockOrderDetailsItem extends StatefulWidget {
  final StockItemDetails item;

  const StockOrderDetailsItem({Key key, this.item}) : super(key: key);

  @override
  _StockOrderItemState createState() => _StockOrderItemState();
}

class _StockOrderItemState extends State<StockOrderDetailsItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        },
      child: SizedBox(
        height: 100,
        child: Card(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0), 
            child: Row(
              children: [
                Expanded(child: Text(widget.item.name)),
                SizedBox(width: 10,),
                Text(widget.item.ctnQty.toString() + "Ctn  "+widget.item.pcsQty.toString() + "  pcs   ",style: TextStyle(
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
