import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatime/bloc/order_details/order_details_cubit.dart';
import 'package:teatime/components/order_details_item.dart';
import 'package:teatime/models/order_model.dart';
import 'package:teatime/resources/theme_resources.dart';

class OrderDetailsScreen extends StatefulWidget {
  final OrderModel orderModel;

  const OrderDetailsScreen({Key key, this.orderModel}) : super(key: key);
  static route(OrderModel orderModel)=>MaterialPageRoute(builder: (context)=>BlocProvider(
      create: (context)=>OrderDetailsCubit()..getOrderDetails(orderModel.id),
      child: OrderDetailsScreen(orderModel: orderModel,)));

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleResources.darkTheme.primaryColor,
        title: Text("Orders Details ${widget.orderModel.poNo}",style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        child: BlocBuilder<OrderDetailsCubit,OrderDetailsState>(
          builder:(context,state){
            if(state is OrderDetailsInitial){
              return Center(child:CircularProgressIndicator() );
            }
            if(state is OrderDetailsLoaded){
              if(state.orders.length==0){
                return Container();
              }
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  ...state.orders.map((e) => OrderDetailsItem(
                    item: e,
                  )).toList()
                ],
              );
            }
            if(state is OrderDetailsError){
              return Center(child:Text("Sorry! We Couldn't connect to orders"));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
