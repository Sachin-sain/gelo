
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/constants/appcolor.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/constants/constanttext.dart';
import 'package:irl/constants/fontsize.dart';
import 'package:irl/widgets/spacing.dart';
import '../../widgets/roundedbutton.dart';
import '../nowseewatchlist/nowseewtachlist.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({super.key});

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  bool isCheck=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: Text('Terms and Condition',style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_20,color: AppColor.whiteColor),),
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
            child: const Icon(Icons.arrow_back_ios,size: 25,color: AppColor.whiteColor,)),
        automaticallyImplyLeading: false,
        toolbarHeight: Dimensions.h_90,
    flexibleSpace: Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(80),
        bottomLeft: Radius.circular(80),
      ),
    gradient: LinearGradient(
    colors: <Color>[AppColor.blueColors,AppColor.blueColor]),
    ),
      ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: Dimensions.w_30,top: Dimensions.h_10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: Dimensions.h_450,
                width: Dimensions.w_300,
                decoration:  BoxDecoration(
                  color: AppColor.cardColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: Dimensions.w_10),
                  child: Text(ConstantText.constant22,style: AppTextStyle.normalTextStyle(FontSize.sp_14, AppColor.whiteColor),),
                ),
              ),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Checkbox(
                   activeColor: AppColor.cardColor,
                   side: const BorderSide(
                       color: AppColor.cardColor
                   ),
                   value: isCheck, onChanged: ( value) {
                   setState(() {
                     isCheck=value!;
                   });

                 },),
                 Padding(
                   padding:  EdgeInsets.only(top:Dimensions.h_10 ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text(ConstantText.constant23,style: AppTextStyle.normalTextStyle(FontSize.sp_14, AppColor.whiteColor),),
                       Text(ConstantText.constant24,style: AppTextStyle.normalTextStyle(FontSize.sp_14, AppColor.whiteColor)),

                     ],
                   ),
                 )
               ],
             ),
              VerticalSpacing(height: Dimensions.h_10),
              RoundedButton(title: 'Next', onClick: (){
                if(isCheck==true){
                  Get.to(const NowseeWatchList());

                }

              }),
          
            ],
          ),
        ),
      ),
    );
  }
}
