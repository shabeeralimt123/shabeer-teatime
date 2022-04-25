import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:teatime/bloc/stockOrderDetails/stock_order_details_cubit.dart';

import 'package:teatime/components/stockOrderdeatilsItem.dart';

import 'package:teatime/models/stockmodel.dart';
import 'package:teatime/resources/theme_resources.dart';

class StockOrderDetailsScreen extends StatefulWidget {
  final StockModel orderModel;

  const StockOrderDetailsScreen({Key key, this.orderModel}) : super(key: key);
  static route(StockModel orderModel) => MaterialPageRoute(
      builder: (context) => BlocProvider(
          create: (context) =>
              StockOrderDetailsCubit()..getStockOrderDetails(orderModel.id),
          child: StockOrderDetailsScreen(
            orderModel: orderModel,
          )));

  @override
  _StockOrderDetailsScreenState createState() =>
      _StockOrderDetailsScreenState();
}

class _StockOrderDetailsScreenState extends State<StockOrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleResources.darkTheme.primaryColor,
        title: Text(
          "Stock Details ${widget.orderModel.poNo}",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<StockOrderDetailsCubit, StockOrderDetailsState>(
          builder: (context, state) {
            if (state is StockOrderDetailsInitial) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is StockOrderDetailsLoaded) {
              if (state.orders.length == 0) {
                return Container();
              }
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  ...state.orders
                      .map((e) => StockOrderDetailsItem(
                            item: e,
                          ))
                      .toList()
                ],
              );
            }
            if (state is StockOrderDetailsError) {
              return Center(
                  child: Text("Sorry! We Couldn't connect to orders"));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
