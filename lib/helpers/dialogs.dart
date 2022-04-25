import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:teatime/resources/theme_resources.dart';

showLoaderDialog(context){

  showDialog(context: context,builder: (context)=>Center(child: SpinKitRipple(color:  ThemeColors.bizarre,size: 75,

  ),),barrierDismissible: false,);
}

showErrorDialog(context,{String message,VoidCallback callback}){
  showDialog(context: context,builder: (context)=>Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15)
    ),
    child:Padding(
      padding:EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Icon(Icons.error_outline,size: 40,color: ThemeColors.red,),
          Text("Oops!",style: TextStyle(
            color: ThemeColors.red,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 15,),
          Text(
            message??"Something went wrong",

          ),
          SizedBox(height: 15,),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.4,
            child: FlatButton(

              onPressed: () {
                Navigator.pop(context);
                if(callback!=null){
                  callback();
                }
              },
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: ThemeColors.red),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                "Try Again",
                style: TextStyle(
                  color: ThemeColors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // color: ThemeColors.red,
            ),
          ),
          SizedBox(height: 20,),
        ],
      )
    ),
  ),barrierDismissible: false,);
}
showConfirmationDialog(context,{String message,VoidCallback onConfirm,VoidCallback onCancel}){
  showDialog(context: context,builder: (context)=>Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
    ),
    child:Padding(
        padding:EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Icon(Icons.warning_outlined,size: 40,color: Colors.amber,),
            Text("Warning!",style: TextStyle(
              color: Colors.amber,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 15,),
            Text(
              message??"You got warning",

            ),
            SizedBox(height: 15,),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: FlatButton(

                        onPressed: () {
                          Navigator.pop(context);
                          if(onCancel!=null){
                            onCancel();
                          }
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: ThemeColors.red),
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: ThemeColors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // color: ThemeColors.red,
                      ),
                    ),
                  ),
                  SizedBox(width:10),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: FlatButton(

                        onPressed: () {
                          Navigator.pop(context);
                          if(onConfirm!=null){
                            onConfirm();
                          }
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          "OK",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // color: ThemeColors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
          ],
        )
    ),
  ),barrierDismissible: false,);
}

showSuccessDialog(context,{String message,VoidCallback callback}){
  showDialog(context: context,builder: (context)=>Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
    ),

    child: Padding(
      padding:EdgeInsets.all(16),
      child:Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Icon(Icons.check_circle,size: 40,color: Colors.green,),
          Text("Success",style: TextStyle(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 15,),
          Text(
            message??"Success",

          ),
          SizedBox(height: 15,),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.4,
            child: FlatButton(

              onPressed: () {
                Navigator.pop(context);
                if(callback!=null){
                  callback();
                }
              },
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                "OK",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // color: ThemeColors.red,
            ),
          ),
          SizedBox(height: 20,),
        ],
      )
    ),
  ),barrierDismissible: false,);
}