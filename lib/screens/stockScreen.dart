import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:teatime/bloc/stock/stock_cubit.dart';

import 'package:teatime/components/newStockCartItem.dart';

import 'package:teatime/components/newStockSearchModel.dart';

import 'package:teatime/helpers/dialogs.dart';

import 'package:teatime/models/branch.dart';

import 'package:teatime/resources/theme_resources.dart';
import 'package:teatime/screens/branch_screen.dart';

import 'package:teatime/screens/stockhistoryScreen.dart';

class StockScreen extends StatefulWidget {
  final BranchModel branch;

  const StockScreen({Key key, this.branch}) : super(key: key);
  static route(BranchModel branch) => MaterialPageRoute(
      builder: (context) => StockScreen(
            branch: branch,
          ));

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  @override
  void initState() {
    
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleResources.darkTheme.primaryColor,
        title: Text(
          widget.branch.name,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.clear();
                Navigator.pushAndRemoveUntil(
                    context, BranchScreen.route(), (route) => false);
              }),
          IconButton(
              icon: Icon(Icons.history),
              onPressed: () {
                Navigator.push(
                    context, StockHistoryScreen.route(widget.branch));
              }),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, NewStockSearchModal());
              },
              child: Container(
                margin: EdgeInsets.all(24),
                height: 40,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text("Search your product"))
                  ],
                ),
              ),
            ),
            Expanded(
                child: BlocConsumer<StockCubit, StockState>(
              listener: (context, state) {
                if (state is AddingToStock) {
                  showLoaderDialog(this.context);
                }
                if (state is AddedToStock) {
                  Navigator.pop(this.context);
                  showSuccessDialog(this.context,
                      message: "Item Added Successfully", callback: () {
                    Navigator.pop(this.context);
                  });
                }
                if (state is AddingToStockError) {
                  Navigator.pop(this.context);
                  showErrorDialog(this.context,
                      message: "Sorry! We Couldn't add your item");
                }

                if (state is DeleteFromStock) {
                  showLoaderDialog(this.context);
                }
                if (state is DeletedFromStock) {
                  Navigator.pop(this.context);
                  showSuccessDialog(this.context,
                      message: "Item Removed Successfully");
                }
                if (state is DeleteStockError) {
                  Navigator.pop(this.context);
                  showErrorDialog(this.context,
                      message: "Sorry! We Couldn't reomove your item");
                }

                if (state is UpdatingStock) {
                  showLoaderDialog(this.context);
                }
                if (state is UpdatedStock) {
                  Navigator.pop(this.context);
                  showSuccessDialog(this.context,
                      message: "Item Updated Successfully");
                }
                if (state is UpdateStockError) {
                  Navigator.pop(this.context);
                  showErrorDialog(this.context,
                      message: "Sorry! We Couldn't update your item");
                }

                if (state is PostingStock) {
                  showLoaderDialog(this.context);
                }
                if (state is PostStockEmpty) {
                  Navigator.pop(this.context);
                  showErrorDialog(this.context,
                      message: "It looks like you don't have items to post");
                }
                if (state is PostedStock) {
                  Navigator.pop(this.context);
                  showSuccessDialog(this.context,
                      message: "Items Posted Successfully");
                }
                if (state is PostStockError) {
                  Navigator.pop(this.context);
                  showErrorDialog(this.context,
                      message: "Sorry! We Couldn't post your items");
                }
              },
              builder: (context, state) {
                if (state is StockInitial) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is StockLoaded) {
                  if (state.particulars.length == 0) {
                    return Container();
                  }
                  return ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      ...state.particulars
                          .map((e) => NewStockCartItem(
                                item: e,
                              ))
                          .toList()
                    ],
                  );
                }
                if (state is StockError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          color: StyleResources.darkTheme.primaryColor,
        ),
        child: Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                BlocProvider.of<StockCubit>(context).checkOutStock(context);
              },
              child: Center(
                  child: Text(
                "POST",
                style: TextStyle(color: Colors.white),
              )),
            )),
          ],
        ),
      ),
    );
  }
}
