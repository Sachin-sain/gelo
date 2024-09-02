
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/presentation/intersestlifestyle/interestlifestyle.dart';
import 'package:irl/presentation/sucesscompleted/sucesscompleted.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/fontsize.dart';
import '../../constants/images.dart';
import '../../widgets/customdrpdowncontainer.dart';
import '../../widgets/spacing.dart';

class CareerDetail extends StatefulWidget {
  const CareerDetail({super.key});
  @override
  State<CareerDetail> createState() => _CareerDetailState();
}

class _CareerDetailState extends State<CareerDetail> {
  String education="Masters";
  String fieldStudy="Architecture";
  String occupation="Employed";
  String designation = 'UI/UX Designer';
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
                  Text('Career Details',style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_22,color: AppColor.whiteColor)),
                  HorizontalSpacing(width: Dimensions.w_120),
                  Image.asset(Images.step2,),
                ],
              ),
            ),
            VerticalSpacing(height: Dimensions.h_40),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Text('Highest Education',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),),
            ),
            VerticalSpacing(height: Dimensions.h_10),
            Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_30),
                child:  GestureDetector(
                    onTap:(){
                      _openeduacationPicker(context);
                    },
                    child: CustomDropDownContainer(title: education,))),
            VerticalSpacing(height: Dimensions.h_20),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Text('Field of Study',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),),
            ),
            VerticalSpacing(height: Dimensions.h_10),
            Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_30),
                child:  GestureDetector(
                    onTap:(){
                      _openfieldstudyPicker(context);

                    },
                    child: CustomDropDownContainer(title: fieldStudy,))),
            VerticalSpacing(height: Dimensions.h_20),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Text('What is your current occupation?',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),),
            ),
            VerticalSpacing(height: Dimensions.h_10),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child:  GestureDetector(
                onTap:(){
                  _openOccupationPicker(context);
                },
                  child: CustomDropDownContainer(title: occupation,))),
            VerticalSpacing(height: Dimensions.h_20),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Text('What is your designation? ',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),),
            ),
            VerticalSpacing(height: Dimensions.h_10),
            Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_30),
                child:  GestureDetector(
                    onTap:(){
                    _openDesignationPicker(context);
                    },
                    child: CustomDropDownContainer(title: designation,))),
            VerticalSpacing(height: Dimensions.h_160),
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
                      if(education!=null && fieldStudy!=null && occupation!=null && designation!=null){
                        Get.to(const InterestLifeStyle());
                      }
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
  void _openeduacationPicker(BuildContext context) {
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
                    title: Text('Masters', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        education = 'Masters';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  ListTile(
                    title: Text('Graduate', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        education = 'Graduate';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  ListTile(
                    title: Text('Post graduate', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        education = 'Post graduate';
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
                    title: Text('Architecture', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        fieldStudy = 'Architecture';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  ListTile(
                    title: Text('Computer Science', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        fieldStudy = 'Computer Science';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  ListTile(
                    title: Text('Electronics', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        fieldStudy = 'Electronics';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  ListTile(
                    title: Text('Other', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        fieldStudy = 'Other';
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
  void _openDesignationPicker(BuildContext context) {
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
                    title: Text('UI/UX Designer', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        designation = 'UI/UX Designer';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  ListTile(
                    title: Text('Flutter Developer', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        designation = 'Flutter Developer';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  ListTile(
                    title: Text('Frontend Debveloper', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        designation = 'Frontend Debveloper';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  ListTile(
                    title: Text('Tester', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        designation = 'Tester';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),

                ]),
              ),
            ])

        ),
    );
  }


}
