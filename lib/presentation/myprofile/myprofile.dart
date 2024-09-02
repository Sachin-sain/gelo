import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constanttext.dart';
import '../../constants/fontsize.dart';
import '../../constants/images.dart';
import '../../widgets/datanetworkcustombutton.dart';
import '../../widgets/roundedbutton.dart';
import '../../widgets/spacing.dart';
import '../profiledetail/personaldetail.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Swarica',style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_20,color: AppColor.whiteColor),),
        leading: Padding(
          padding:  EdgeInsets.only(left: Dimensions.w_20),
          child: Image.asset(Images.swaRica,scale: 1.5,),
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.only(bottom: Dimensions.h_40,right: Dimensions.w_5),
            child: const Icon(Icons.settings,size: 30,color: AppColor.whiteColor,),
          )
        ],
        automaticallyImplyLeading: false,
        toolbarHeight: Dimensions.h_90,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: AppColor.lightGrey,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(80),
              bottomLeft: Radius.circular(80),
            ),
          ),
        ),
      ),
      body:  Column(
        children: [
          VerticalSpacing(height: Dimensions.h_20),
          Padding(
            padding: EdgeInsets.only(right: Dimensions.w_10,left: Dimensions.w_10),
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.w_10),
              height: Dimensions.h_50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.cardColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(color: AppColor.lightGrey),
                ],
              ),
              child:ButtonToggleExample(),
            ),
          ),
          VerticalSpacing(height: Dimensions.h_20),
          Container(
            margin: EdgeInsets.only(left: Dimensions.w_20,right: Dimensions.w_20),
            padding: EdgeInsets.all(Dimensions.h_10),
            decoration:  BoxDecoration(
             color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(Images.thirty,),
                HorizontalSpacing(width: Dimensions.w_10),
                Text(ConstantText.constantText27,style: AppTextStyle.normalTextStyle(FontSize.sp_14, AppColor.backgroundColor),),
                HorizontalSpacing(width: Dimensions.w_40),
                Container(
                  padding: EdgeInsets.all(Dimensions.h_5),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColor.backgroundColor,
                    shape: BoxShape.circle
                  ),
                    child: const Icon(Icons.arrow_forward,size: 20,color: AppColor.whiteColor,))

              ],
            ),
          ),
         VerticalSpacing(height: Dimensions.h_300),
          RoundedButton(title: 'Next', onClick: () {
            Get.to(const PersonalDetail());
          }),

        ],
      ),
    );
  }
}
