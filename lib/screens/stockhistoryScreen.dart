import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatime/bloc/stockOrder/stock_order_cubit.dart';
import 'package:teatime/components/stockOrderItem.dart';
import 'package:teatime/models/branch.dart';
import 'package:teatime/resources/theme_resources.dart';

class StockHistoryScreen extends StatefulWidget {
  final BranchModel branch;

  const StockHistoryScreen({Key key, this.branch}) : super(key: key);
  static route(BranchModel branch)=>MaterialPageRoute(builder: (context)=>BlocProvider(
      create: (context)=>StockOrderCubit()..getStock(),
      child: StockHistoryScreen(branch: branch,)));

  @override
  _StockHistoryScreenState createState() => _StockHistoryScreenState();
}

class _StockHistoryScreenState extends State<StockHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleResources.darkTheme.primaryColor,
        title: Text("Stocks",style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        child: BlocBuilder<StockOrderCubit,StockOrderState>(
          builder:(context,state){
            if(state is StockOrderInitial){
              return Center(child:CircularProgressIndicator() );
            }
            if(state is StockOrderLoaded){
              if(state.stockorders.length==0){
                return Container();
              }
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  ...state.stockorders.map((e) => StockOrderItem(
                    item: e,
                  )).toList()
                ],
              );
            }
            if(state is StockOrderError){
              return Center(child:Text("Sorry! We Couldn't connect to orders"));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
