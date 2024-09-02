import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/constants/fontsize.dart';

import '../constants/appcolor.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
   const RoundedButton({super.key,required this.title,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        onClick();
      },
      child: Container(
        alignment: Alignment.center,
        height: Dimensions.h_50,
        width: Dimensions.w_300,
        decoration:  BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(60),
        ),
        child:  Text(title,style: AppTextStyle.normalTextStyle(FontSize.sp_18, AppColor.backgroundColor,).copyWith(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
