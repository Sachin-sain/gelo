import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/constants/constanttext.dart';
import 'package:irl/constants/fontsize.dart';
import 'package:irl/presentation/plans/plans.dart';
import 'package:irl/widgets/spacing.dart';
import '../../constants/appcolor.dart';
import '../../constants/images.dart';
import '../../widgets/roundedbutton.dart';

class SucessCompleted extends StatefulWidget {
  const SucessCompleted({super.key});

  @override
  State<SucessCompleted> createState() => _SucessCompletedState();
}

class _SucessCompletedState extends State<SucessCompleted> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
      ),
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
         Image.asset(Images.styleLogo,scale: 1.9,),
          VerticalSpacing(height: Dimensions.h_40),
          Text(ConstantText.constantText28,style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_22,color: AppColor.whiteColor)),
          Text('successfully completed',style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_22,color: AppColor.whiteColor),),
         VerticalSpacing(height: Dimensions.h_20),
          Padding(
            padding:  EdgeInsets.only(left: Dimensions.w_30,right: Dimensions.w_30),
            child: Container(
              height: 2,
              decoration: const BoxDecoration(
                gradient:LinearGradient(
                  colors: [AppColor.blueColorss,AppColor.blueColors,AppColor.blueColor]
                )
              ),
            ),
          ),
       VerticalSpacing(height: Dimensions.h_20),
       Padding(
         padding:  EdgeInsets.only(left: Dimensions.w_50),
         child: Row(
           children: [
           CommonCheckBox(),
             Text('Personal Details',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),)
           ],
         ),
       ),
       Padding(
         padding:  EdgeInsets.only(left: Dimensions.w_50),
         child: Row(
           children: [
           CommonCheckBox(),
             Text('Career Details',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),)
           ],
         ),
       ),
       Padding(
         padding:  EdgeInsets.only(left: Dimensions.w_50),
         child: Row(
           children: [
           CommonCheckBox(),
             Text('Interests &Lifestyle Details',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),)
           ],
         ),
       ),
       Padding(
         padding:  EdgeInsets.only(left: Dimensions.w_50),
         child: Row(
           children: [
           CommonCheckBox(),
             Text('Personality Details',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),)
           ],
         ),
       ),
       Padding(
         padding:  EdgeInsets.only(left: Dimensions.w_50),
         child: Row(
           children: [
           CommonCheckBox(),
             Text('Partner Preferences',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),)
           ],
         ),
       ),
          VerticalSpacing(height: Dimensions.h_100),
          RoundedButton(title: 'Done', onClick: (){
            Get.to(Plans());
          }),
        ],
      ),
    );
  }
}
class CommonCheckBox extends StatefulWidget {
       bool? isChecked;

     CommonCheckBox({super.key,  this.isChecked=false});
  @override
  State<CommonCheckBox> createState() => _CommonCheckBoxState();
}

class _CommonCheckBoxState extends State<CommonCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
       child:Checkbox(
          activeColor: AppColor.cardColor,
          side: const BorderSide(
              color: AppColor.cardColor
          ),
        checkColor: AppColor.whiteColor,
          value: widget.isChecked, onChanged: (value){
        setState(() {
        widget.isChecked=value!;
        });
      }),
    );
  }
}


