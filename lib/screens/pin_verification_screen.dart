import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teatime/models/branch.dart';
import 'package:teatime/resources/theme_resources.dart';
import 'package:teatime/screens/home_screen.dart';

class PinVerificationScreen extends StatefulWidget {
  final BranchModel branch;

  const PinVerificationScreen({Key key, this.branch}) : super(key: key);

  static route(BranchModel branch)=>MaterialPageRoute(builder: (context)=>PinVerificationScreen(branch: branch,));
  @override
  _PinVerificationScreenState createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  String pinCode = "XXXX";
  String errorString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child : Container(
              color: StyleResources.darkTheme.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset("assets/images/teatime-logo.png",height: 100,),
                  SizedBox(height: 20,),
                  Text("Enter Your Passcode",style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(var i=0;i<pinCode.length;i++)
                        _dot(isSelected:pinCode[i]!='X')
                    ],
                  ),
                  SizedBox(height: 10,),
                  Visibility(
                      visible: errorString.isNotEmpty,
                      child: Text(errorString,style: TextStyle(
                        color: Colors.white,

                      ),))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GridView(
                  padding: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.5
                  ),
                  children: List.generate(9, (index) => _buttonItem((index+1).toString(),(){
                    _changeLetterAtLast("${index+1}");
                  }))..addAll([
                    _buttonItem("Clear",(){
                      setState(() {
                        pinCode = "XXXX";
                        errorString = "";
                      });
                    }),
                    _buttonItem("0",(){
                      _changeLetterAtLast("0");
                    }),
                    _buttonItem("X",(){
                      if(errorString.isNotEmpty){
                        setState(() {
                          errorString = "";
                        });
                      }
                      _changeLetterAtLast("X");
                    },isBack:true,),
                  ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _changeLetterAtLast(String text) async {

    int lastIndex = pinCode.indexOf("X");

    if(text=="X"){
      var temp = "";
      if(lastIndex<4){
        if(lastIndex==-1){
          for(var i=0;i<pinCode.length;i++){
            if(i==3){
              temp +="X";
            }else{
              temp += pinCode[i];
            }
          }
        }else{
          for(var i=0;i<pinCode.length;i++){
            if(i==lastIndex-1){
              temp +="X";
            }else{
              temp += pinCode[i];
            }
          }
        }

      }
      setState(() {
        pinCode = temp;
      });
    }else{
      if(lastIndex<4){
        var temp = "";
        for(var i=0;i<pinCode.length;i++){
          if(pinCode[i]!="X"){
            temp += pinCode[i];
          }else{
            if(i==lastIndex){
              temp += text;
            }else{
              temp += "X";
            }
          }
        }
        setState(() {
          pinCode = temp;
        });
      }
    }
    bool isCompleted = !pinCode.contains('X');
    print(isCompleted);
    if(isCompleted){
      if(pinCode == widget.branch.pin){
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('BRANCH', json.encode(widget.branch.toJson()));
        Navigator.pushAndRemoveUntil(context, HomeScreen.route(widget.branch),(route)=>false);
      }else{
        setState(() {
          errorString = "Invalid Passcode";
        });
      }
    }

  }

  Widget _buttonItem(String text,VoidCallback onTap,{isBack:false}){
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 30,
        width: 30,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
          ),
          child: Center(child: isBack?Icon(Icons.arrow_back):Text(text)),
        ),
      ),
    );
  }

  _dot({bool isSelected}){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 8.0),
      margin: const EdgeInsets.symmetric(horizontal:8.0,vertical: 8.0),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isSelected?Colors.green:Colors.white,
        shape: BoxShape.circle
      ),
    );
  }
}
