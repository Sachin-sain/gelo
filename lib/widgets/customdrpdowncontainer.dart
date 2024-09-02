import 'package:flutter/material.dart';
import 'package:irl/constants/appcolor.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/constants/fontsize.dart';


class CustomDropDownContainer extends StatelessWidget {
  final String title;
   const CustomDropDownContainer({super.key,required this.title,});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 50,
           width: 330,
           decoration:   BoxDecoration(
           color: AppColor.cardColor,
           borderRadius: BorderRadius.circular(30),
         ),
      child: Padding(
        padding:  EdgeInsets.only(left: Dimensions.w_20,right: Dimensions.w_20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style:AppTextStyle.themeBoldNormalTextStyle(fontSize: FontSize.sp_16,color: Colors.grey),),
            const Icon(Icons.keyboard_arrow_down_outlined,size: 25,color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}
