import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/presentation/personality/personality.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/fontsize.dart';
import '../../constants/images.dart';
import '../../widgets/customdrpdowncontainer.dart';
import '../../widgets/lifestylecomponenet.dart';
import '../../widgets/spacing.dart';

class InterestLifeStyle extends StatefulWidget {
  const InterestLifeStyle({super.key});

  @override
  State<InterestLifeStyle> createState() => _InterestLifeStyleState();
}

class _InterestLifeStyleState extends State<InterestLifeStyle> {
  String lookingFor='Long Term';
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body:  SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(height: Dimensions.h_40),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Row(
                children: [
                  Text('Interest & Life Style',style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_20,color: AppColor.whiteColor)),
                  HorizontalSpacing(width: Dimensions.w_100),
                  Image.asset(Images.step3,),
                ],
              ),
            ),

            VerticalSpacing(height: Dimensions.h_40),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Text('What are Your Interest',style: AppTextStyle.normalTextStyle(FontSize.sp_16, Colors.grey),),
            ),
            VerticalSpacing(height: Dimensions.h_20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InterestContainer(title: 'Art',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_90,isSelected:true ),
                InterestContainer(title: 'Architecture', addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_130, ),
                InterestContainer(title: 'Dance',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_90, ),
              ],
            ),
            VerticalSpacing(height: Dimensions.h_15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HorizontalSpacing(width: Dimensions.w_10),
                InterestContainer(title: 'Illustration',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_130,isSelected:true ),
                HorizontalSpacing(width: Dimensions.w_10),
                InterestContainer(title: 'Fashion', addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_100, ),


              ],
            ),
            VerticalSpacing(height: Dimensions.h_15),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_10),
              child: InterestContainer(title: 'Graphic Design',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_160,isSelected:true ),
            ),
            VerticalSpacing(height: Dimensions.h_15),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Text('Do You Smoke',style: AppTextStyle.normalTextStyle(FontSize.sp_16, Colors.grey),),
            ),
            VerticalSpacing(height: Dimensions.h_15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SmokeContainer(title: 'Yes',radiusKhde: BorderRadius.circular(30), height: Dimensions.h_40,width: Dimensions.w_90,isSelected:true ),
                SmokeContainer(title: 'No',radiusKhde: BorderRadius.circular(30), height: Dimensions.h_40,width: Dimensions.w_90, ),
                SmokeContainer(title: 'Occasionaly',radiusKhde: BorderRadius.circular(30), height: Dimensions.h_40,width: Dimensions.w_130, ),
              ],
            ),
            VerticalSpacing(height: Dimensions.h_15),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Text('Do You Drink',style: AppTextStyle.normalTextStyle(FontSize.sp_16, Colors.grey),),
            ),
            VerticalSpacing(height: Dimensions.h_15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SmokeContainer(title: 'Yes',radiusKhde: BorderRadius.circular(30), height: Dimensions.h_40,width: Dimensions.w_90,isSelected:true ),
                SmokeContainer(title: 'No',radiusKhde: BorderRadius.circular(30), height: Dimensions.h_40,width: Dimensions.w_90, ),
                SmokeContainer(title: 'Occasionaly',radiusKhde: BorderRadius.circular(30), height: Dimensions.h_40,width: Dimensions.w_130, ),
              ],
            ),
            VerticalSpacing(height: Dimensions.h_30),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Text('What are You Looking for',style: AppTextStyle.normalTextStyle(FontSize.sp_16, Colors.grey),),
            ),
            VerticalSpacing(height: Dimensions.h_25),
            Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_30),
                child:  GestureDetector(
                    onTap:(){
                      _openfieldstudyPicker(context);
                    },
                    child: CustomDropDownContainer(title: lookingFor,))),
            VerticalSpacing(height: Dimensions.h_40),
            Container(
              height: Dimensions.h_1,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColor.blueColors,AppColor.blueColor],
                  )
              ),
            ),
            VerticalSpacing(height: Dimensions.h_10),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30,right:Dimensions.w_30 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Prev',style: AppTextStyle.normalTextStyle(FontSize.sp_16,AppColor.whiteColor,).copyWith(decoration: TextDecoration.underline,)),
                  GestureDetector(
                    onTap: (){
                    Get.to(const Personality());
                    },
                    child: Container(
                      padding: EdgeInsets.all(Dimensions.h_10),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape:BoxShape.circle ,
                        color: AppColor.whiteColor,
                      ),
                      child: const Icon(Icons.arrow_forward_ios,size: 20,color: AppColor.backgroundColor,),
                    ),
                  )
                ],
              ),
            ),
            VerticalSpacing(height: Dimensions.h_10)
          ],
        ),
      ),
    );
  }
  void _openfieldstudyPicker(BuildContext context) {
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
                    title: Text('Long Term', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        lookingFor = 'Long Term';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  ListTile(
                    title: Text('Short Term', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        lookingFor = 'Short Term';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  ListTile(
                    title: Text('Permanent', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        lookingFor = 'Permanent';
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
