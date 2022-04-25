import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teatime/bloc/cart/cart_cubit.dart';
import 'package:teatime/bloc/unit/unit_cubit.dart';
import 'package:teatime/components/cart_item.dart';
import 'package:teatime/components/search_modal.dart';
import 'package:teatime/helpers/dialogs.dart';
import 'package:teatime/models/branch.dart';
import 'package:teatime/resources/theme_resources.dart';
import 'package:teatime/screens/branch_screen.dart';
import 'package:teatime/screens/orders_screen.dart';

class HomeScreen extends StatefulWidget {
  final BranchModel branch;

  const HomeScreen({Key key, this.branch}) : super(key: key);
  static route(BranchModel branch)=>MaterialPageRoute(builder: (context)=>HomeScreen(branch: branch,));

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleResources.darkTheme.primaryColor,
        title: Text(widget.branch.name,style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.clear();
            Navigator.pushAndRemoveUntil(context,BranchScreen.route(),(route)=>false);
          }),
          IconButton(icon: Icon(Icons.history), onPressed: () {
            Navigator.push(context,OrdersScreen.route(widget.branch));
          }),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, SearchModal());
              },
              child: Container(
                margin: EdgeInsets.all(24),
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  SizedBox(width: 10,),
                  Expanded(child: Text("Search your product"))
                ],),
              ),
            ),

            Expanded(child: BlocConsumer<CartCubit,CartState>(
              listener: (context,state){
                if(state is AddingToCart){
                  showLoaderDialog(this.context);
                }
                if(state is AddedToCart){
                  Navigator.pop(this.context);
                  showSuccessDialog(this.context,message: "Item Added Successfully",callback: (){
                    Navigator.pop(this.context);
                  });
                }
                if(state is AddingToCartError){
                  Navigator.pop(this.context);
                  showErrorDialog(this.context,message: "Sorry! We Couldn't add your item");
                }

                if(state is DeleteFromCart){
                  showLoaderDialog(this.context);
                }
                if(state is DeletedFromCart){
                  Navigator.pop(this.context);
                  showSuccessDialog(this.context,message: "Item Removed Successfully");
                }
                if(state is DeleteCartError){
                  Navigator.pop(this.context);
                  showErrorDialog(this.context,message: "Sorry! We Couldn't reomove your item");
                }

                if(state is UpdatingCart){
                  showLoaderDialog(this.context);
                }
                if(state is UpdatedCart){
                  Navigator.pop(this.context);
                  showSuccessDialog(this.context,message: "Item Updated Successfully");
                }
                if(state is UpdateCartError){
                  Navigator.pop(this.context);
                  showErrorDialog(this.context,message: "Sorry! We Couldn't update your item");
                }

                if(state is PostingCart){
                  showLoaderDialog(this.context);
                }
                if(state is PostEmpty){
                  Navigator.pop(this.context);
                  showErrorDialog(this.context,message: "It looks like you don't have items to post");
                }
                if(state is PostedCart){
                  Navigator.pop(this.context);
                  showSuccessDialog(this.context,message: "Items Posted Successfully");
                }
                if(state is PostCartError){
                  Navigator.pop(this.context);
                  showErrorDialog(this.context,message: "Sorry! We Couldn't post your items");
                }
              },
              builder:(context,state){
                if(state is CartInitial){
                  return Center(child:CircularProgressIndicator() );
                }
                if(state is CartLoaded){
                  if(state.particulars.length==0){
                    return Container();
                  }
                  return ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      ...state.particulars.map((e) => BlocProvider(
                        create: (context)=>UnitCubit()..getUnits(id:e.unit),
                        child: CartItem(
                          item: e,
                        ),
                      )).toList()
                    ],
                  );
                }
                if(state is CartError){
                  return Center(child:Text(state.message));
                }
                return Container();
              },
            )),
            SizedBox(height: 20 ,),
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
                onTap:(){
                  BlocProvider.of<CartCubit>(context)..checkOutCart(context);
                },
                child:Center(child: Text("POST",style: TextStyle(
                    color: Colors.white
                ),)),
              )
            ),

          ],
        ),
      ),
    );
  }
}
