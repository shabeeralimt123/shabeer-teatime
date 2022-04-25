import 'package:flutter/material.dart';
import 'package:teatime/models/branch.dart';
import 'package:teatime/resources/theme_resources.dart';

class BranchComponent extends StatelessWidget {
  final VoidCallback onPressed;
  final BranchModel branch;
  final bool isSelected;

  const BranchComponent({Key key, this.onPressed, this.branch,this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        color: isSelected?StyleResources.darkTheme.primaryColor:Colors.white,
        elevation: 4.0,
        child: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(branch.name,style: TextStyle(
                  fontSize: 15,
                  color: isSelected?Colors.white:StyleResources.darkTheme.primaryColor,
                  fontWeight: FontWeight.bold
              ),),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(branch.address,
                    maxLines: 3,
                    style: TextStyle(
                      color: isSelected?Colors.white:Colors.black,
                      fontSize: 12,
                    ),),
                  Text(branch.mobile,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected?Colors.white:Colors.black,
                    ),),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
