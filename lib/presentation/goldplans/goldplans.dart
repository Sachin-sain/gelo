import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/constants/appcolor.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/constants/fontsize.dart';
import 'package:irl/widgets/spacing.dart';
import '../../widgets/roundedbutton.dart';

class GoldPlans extends StatefulWidget {
  const GoldPlans({super.key});
  @override
  State<GoldPlans> createState() => _GoldPlansState();
}

class _GoldPlansState extends State<GoldPlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('  Gold',style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_30,color: AppColor.whiteColor),),
        actions: [
          GestureDetector(
            onTap: (){
              Get.back();
            },
              child: const Icon(Icons.close,size: 40,color: AppColor.whiteColor,)),
          HorizontalSpacing(width: Dimensions.w_20,)
        ],
        flexibleSpace: Container (
          decoration: const BoxDecoration (
            // LinearGradient
            gradient: LinearGradient (
              // colors for gradient
              colors: [
                AppColor.blueColors,
                AppColor.blueColor,
              ],
            ),
          ),
        ),

      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.blueColors,AppColor.blueColor],
          )
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left:Dimensions.w_20,top: Dimensions.h_40),
              child: Text('₹500 / Month',style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_30,color: AppColor.whiteColor),),
            ),
            VerticalSpacing(height: Dimensions.h_20),
            const CommonColumn(boldTitle: '. Account Interactions:', title1: 'Go unlimited ', title2: 'with Premium.',),
            const CommonColumn(boldTitle: '. Preference-based Account :', title1: 'Connect   ', title2: 'with those who match your preferences.',),
            const CommonColumn(boldTitle: '. Messages :', title1: 'Send texts and mages hassle  ', title2: '-free.',),
            const CommonColumn(boldTitle: '. Profile Visibility Customization:', title1: 'Take  ', title2: "control of your profile's visibility.",),
           VerticalSpacing(height: Dimensions.h_120),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_20),
              child: RoundedButton(title: 'Upgrade Now', onClick: () {
                customBottomSheet(context);
              }),
            ),
          ],
        )
      ),
    );
  }
  void customBottomSheet(BuildContext context) {
   Get.bottomSheet(
     backgroundColor: Colors.blueAccent,
     isScrollControlled: true,
     Container(
       height: Dimensions.h_550,
       width: double.infinity,
       decoration: const BoxDecoration(
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(20.0),
           topRight: Radius.circular(20.0),
         ),
       ),
       child: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             VerticalSpacing(height: Dimensions.h_10),
             Container(
               margin: EdgeInsets.only(left: Dimensions.w_160),
               height: Dimensions.h_4,
               width: Dimensions.w_40,
               decoration: BoxDecoration(
                 color: AppColor.whiteColor,
                 borderRadius: BorderRadius.circular(5)
               ),
             ),
             VerticalSpacing(height: Dimensions.h_50),
             Padding(
               padding:  EdgeInsets.only(left:Dimensions.w_20,right: Dimensions.w_20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     children: [
                       Text('Upgrade to ',style: AppTextStyle.themeBoldTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_22,)),
                       Text('Premium now ',style: AppTextStyle.themeBoldTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_22,),),
                     ],
                   ),
                 GestureDetector(
                   onTap: (){
                     Get.back();
                   },
                     child: const Icon(Icons.close,size: 30,color: AppColor.whiteColor,))
                 ],
               ),
             ),
             Padding(
               padding:  EdgeInsets.only(left:Dimensions.w_20,top: Dimensions.h_20),
               child: Text('₹500 / Month',style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_30,color: AppColor.whiteColor),),
             ),
             VerticalSpacing(height: Dimensions.h_20),
             const CommonColumn(boldTitle: '. Account Interactions:', title1: 'Go unlimited ', title2: 'with Premium.',),
             const CommonColumn(boldTitle: '. Preference-based Account :', title1: 'Connect   ', title2: 'with those who match your preferences.',),
             const CommonColumn(boldTitle: '. Messages :', title1: 'Send texts and mages hassle  ', title2: '-free.',),
             const CommonColumn(boldTitle: '. Profile Visibility Customization:', title1: 'Take  ', title2: "control of your profile's visibility.",),
             VerticalSpacing(height: Dimensions.h_20),
             Padding(
               padding:  EdgeInsets.only(left: Dimensions.w_20),
               child: RoundedButton(title: 'Upgrade Now', onClick: () {
               }),
             ),
             VerticalSpacing(height: Dimensions.h_5),
             Center(child: Text('Skip Now',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),)),
           ],
         ),
       ),
     ),
   );
  }


}
class CommonColumn extends StatelessWidget {
 final String boldTitle;
 final String title1;
 final String title2;
  const CommonColumn({super.key, required this.boldTitle, required this.title1, required this.title2,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: Dimensions.w_20,top: Dimensions.h_20),
      child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding:  EdgeInsets.only(left: Dimensions.w_20),
                     child: Row(
                       children: [
                         Text(boldTitle,style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_16,color: AppColor.whiteColor),),
                         HorizontalSpacing(width: Dimensions.w_5,),
                         Text(title1,style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),)
                       ],
                     ),
                   ),
                   Padding(
                     padding:  EdgeInsets.only(left: Dimensions.w_30),
                     child: Text(title2,style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),),
                   )
                 ],
      ),
    );
  }
}

