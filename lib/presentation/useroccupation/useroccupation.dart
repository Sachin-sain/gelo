import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/widgets/customdrpdowncontainer.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constanttext.dart';
import '../../constants/fontsize.dart';
import '../../widgets/roundedbutton.dart';
import '../../widgets/spacing.dart';
import '../datenetworkpage/datenetworkpage.dart';

class UserOccuPation extends StatefulWidget {
  const UserOccuPation({super.key});

  @override
  State<UserOccuPation> createState() => _UserOccuPationState();
}

class _UserOccuPationState extends State<UserOccuPation> {
  String occupation="Employed";
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Dimensions.h_60),
        child: AppBar(
          backgroundColor: AppColor.backgroundColor,
          leading:   GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios,size: FontSize.sp_16,color: AppColor.whiteColor,)),
          title: Text('',style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_16,color: AppColor.whiteColor),),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left:Dimensions.w_30),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(height: Dimensions.h_30),
              Text(ConstantText.constant14,style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_30),),
              VerticalSpacing(height: Dimensions.h_30),
             GestureDetector(
               onTap: (){
                 _openOccupationPicker(context);
               },
                 child: CustomDropDownContainer(title: occupation,)),
              VerticalSpacing(height: Dimensions.h_316),
              RoundedButton(title: 'Next', onClick: (){
                if(occupation!=null){
                  Get.to(const DateNetworkPage());

                }
              }),
            ],
          ),
        ),
      ),
    );
  }
  void _openOccupationPicker(BuildContext context) {
    Get.bottomSheet(
      Container(
        height: 400, // Adjust height as needed
        decoration: const BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Employed', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        occupation = 'Employed';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  ListTile(
                    title: Text('Unemployed', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        occupation = 'Unemployed';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  ListTile(
                    title: Text('Student', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        occupation = 'Student';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
