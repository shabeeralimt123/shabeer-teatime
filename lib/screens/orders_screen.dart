import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatime/bloc/order/order_cubit.dart';
import 'package:teatime/components/order_item.dart';
import 'package:teatime/models/branch.dart';
import 'package:teatime/resources/theme_resources.dart';

class OrdersScreen extends StatefulWidget {
  final BranchModel branch;

  const OrdersScreen({Key key, this.branch}) : super(key: key);
  static route(BranchModel branch)=>MaterialPageRoute(builder: (context)=>BlocProvider(
      create: (context)=>OrderCubit()..getOrders(),
      child: OrdersScreen(branch: branch,)));

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleResources.darkTheme.primaryColor,
        title: Text("Orders",style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        child: BlocBuilder<OrderCubit,OrderState>(
          builder:(context,state){
            if(state is OrderInitial){
              return Center(child:CircularProgressIndicator() );
            }
            if(state is OrderLoaded){
              if(state.orders.length==0){
                return Container();
              }
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  ...state.orders.map((e) => OrderItem(
                    item: e,
                  )).toList()
                ],
              );
            }
            if(state is OrderError){
              return Center(child:Text("Sorry! We Couldn't connect to orders"));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
