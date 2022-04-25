import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatime/bloc/branch/branch_cubit.dart';
import 'package:teatime/components/branch_component.dart';
import 'package:teatime/screens/pin_verification_screen.dart';

class BranchScreen extends StatefulWidget {
  static route()=>MaterialPageRoute(builder: (context)=>BlocProvider(
      create: (context)=>BranchCubit()..getBranches(),
      child: BranchScreen()));
  @override
  _BranchScreenState createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:24.0,vertical: 8.0),
              child: TextFormField(
                autofocus: false,
                onChanged: (val){
                  BlocProvider.of<BranchCubit>(context)..search(val);
                },
                decoration: InputDecoration(
                  hintText: "Search your branch",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0)
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<BranchCubit,BranchState>(
                builder:(context,state){
                  if(state is BranchInitial){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(state is BranchLoaded){
                    return GridView(
                        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                        primary: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,

                        ),
                        children:[
                          ...state.branches.map((e)=>BranchComponent(
                              branch: e,
                              isSelected: state.branch==e,
                              onPressed:(){
                                Navigator.push(context, PinVerificationScreen.route(e));
                                // BlocProvider.of<BranchCubit>(context)..selectBranch(e);
                              }
                          )).toList(),
                        ]
                    );
                  }
                  if(state is BranchError){
                    return Center(child:Text(state.message));
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BlocBuilder<BranchCubit,BranchState>(
      //   builder:(context,state)=> InkWell(
      //     onTap: (){
      //       if(state.branch!=null){
      //         Navigator.push(context, PinVerificationScreen.route(state.branch));
      //       }else{
      //         showErrorDialog(context,message: "Please choose a branch");
      //       }
      //     },
      //     child: Container(
      //       height: 50,
      //       padding: EdgeInsets.all(8.0),
      //       color: StyleResources.darkTheme.primaryColor,
      //       child: Center(
      //         child: Text("Login",style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold
      //         ),),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
