import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:teatime/models/branch.dart';
import 'package:teatime/resources/theme_resources.dart';
import 'package:teatime/screens/branch_screen.dart';
import 'package:teatime/screens/home_screen.dart';
import 'package:teatime/screens/orders_screen.dart';
import 'package:teatime/screens/stockScreen.dart';

class Dashboard extends StatefulWidget {
  final BranchModel branch;

  const Dashboard({Key key, this.branch}) : super(key: key);
  static route(BranchModel branch) => MaterialPageRoute(
      builder: (context) => Dashboard(
            branch: branch,
          ));

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                Navigator.push(context, OrdersScreen.route(widget.branch));
              }),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(
                height: 22,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, HomeScreen.route(widget.branch));
                },
                child: Container(
                  width: 300,
                  height: 133,
                  decoration: BoxDecoration(
                      color: StyleResources.darkTheme.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Purchase Orders",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Metropolis',
                        color: Color(0xffFFFFFF)),
                  )),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, StockScreen.route(widget.branch));
                },
                child: Container(
                  width: 300,
                  height: 133,
                  decoration: BoxDecoration(
                      color: StyleResources.darkTheme.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Stock",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Metropolis',
                            color: Color(0xffFFFFFF)),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
