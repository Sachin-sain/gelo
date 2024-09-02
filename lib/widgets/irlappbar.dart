
import 'package:flutter/material.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/constants/fontsize.dart';
import '../constants/appcolor.dart';

class IrlAPPBar extends StatelessWidget {
  final String title;
  const IrlAPPBar({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Dimensions.h_50),
        child: AppBar(
          backgroundColor: AppColor.backgroundColor,
          leading: const Icon(Icons.arrow_back_ios,size: 25,color: AppColor.whiteColor,),
          title: Text(title,style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_16,color: AppColor.whiteColor),),
        ),
      ),
    );
  }
}
