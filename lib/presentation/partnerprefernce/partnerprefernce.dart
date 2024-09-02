import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/presentation/sucesscompleted/sucesscompleted.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/fontsize.dart';
import '../../constants/images.dart';
import '../../widgets/customdrpdowncontainer.dart';
import '../../widgets/spacing.dart';

class PartnerPreFernce extends StatefulWidget {
  const PartnerPreFernce({super.key});

  @override
  State<PartnerPreFernce> createState() => _PartnerPreFernceState();
}

class _PartnerPreFernceState extends State<PartnerPreFernce> {
  String gender="Male";
  String language="English";
  double value=18;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(height: Dimensions.h_40),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Row(
                children: [
                  Text('Partner Preference',style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_20,color: AppColor.whiteColor)),
                  HorizontalSpacing(width: Dimensions.w_100),
                  Image.asset(Images.step5,),
                ],
              ),
            ),
            VerticalSpacing(height: Dimensions.w_15),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_25),
              child: Text('Profiles will be shown according to your preferences',style: AppTextStyle.normalTextStyle(FontSize.sp_14, Colors.grey)),
            ),
            VerticalSpacing(height: Dimensions.h_20),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Text('Personal Details',style: AppTextStyle.themeBoldTextStyle(fontSize:FontSize.sp_20, color:AppColor.whiteColor),),
            ),
            VerticalSpacing(height: Dimensions.h_20),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Text('Gender',style: AppTextStyle.normalTextStyle(FontSize.sp_20, AppColor.whiteColor.withOpacity(0.8)),),
            ),
            VerticalSpacing(height: Dimensions.h_10),
            Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_30),
                child:  GestureDetector(
                    onTap:(){
                      _openfieldgenderPicker(context);
                    },
                    child: CustomDropDownContainer(title: gender,))),
            VerticalSpacing(height: Dimensions.h_10),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Text('Age',style: AppTextStyle.normalTextStyle(FontSize.sp_20, AppColor.whiteColor.withOpacity(0.8)),),
            ),
            VerticalSpacing(height: Dimensions.h_20),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30,right: Dimensions.w_30),
              child: Slider(
                 min: 18,
                 max: 100,
                 inactiveColor: AppColor.whiteColor,
                 label: 'age',
                 activeColor: Colors.blueAccent,
                  value: value,
                  onChanged: (Value){
                   setState(() {
                     value=Value;
                   });

              }),
            ),
            VerticalSpacing(height: Dimensions.h_20),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30,right: Dimensions.w_30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: Dimensions.h_40,
                    width: Dimensions.w_100,
                    decoration: BoxDecoration(
                      color: AppColor.backgroundColor,
                      borderRadius:  BorderRadius.circular(5),
                      border: Border.all(
                        color:  AppColor.whiteColor.withOpacity(0.5),
                      ),
                    ),
                    child: Text(value.toStringAsFixed(1),style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_16,color: AppColor.whiteColor),),
                  ),
                  Text('-',style: AppTextStyle.normalTextStyle(FontSize.sp_30,Colors.grey),),
                  Container(
                    height: Dimensions.h_40,
                    width: Dimensions.w_100,
                    decoration: BoxDecoration(
                      color: AppColor.backgroundColor,
                      borderRadius:  BorderRadius.circular(5),
                      border: Border.all(
                        color:  AppColor.whiteColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpacing(height: Dimensions.h_20),

            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Text('Height',style: AppTextStyle.normalTextStyle(FontSize.sp_20, AppColor.whiteColor.withOpacity(0.8)),),
            ),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30,right: Dimensions.w_30),
              child: Slider(value: 0, onChanged: (value){

              }),
            ),
            VerticalSpacing(height: Dimensions.h_20),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30,right: Dimensions.w_30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Dimensions.h_40,
                    width: Dimensions.w_100,
                    decoration: BoxDecoration(
                      color: AppColor.backgroundColor,
                      borderRadius:  BorderRadius.circular(5),
                      border: Border.all(
                        color:  AppColor.whiteColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Text('-',style: AppTextStyle.normalTextStyle(FontSize.sp_30,Colors.grey),),
                  Container(
                    height: Dimensions.h_40,
                    width: Dimensions.w_100,
                    decoration: BoxDecoration(
                      color: AppColor.backgroundColor,
                      borderRadius:  BorderRadius.circular(5),
                      border: Border.all(
                        color:  AppColor.whiteColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpacing(height: Dimensions.h_20),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Text('Language',style: AppTextStyle.normalTextStyle(FontSize.sp_20, AppColor.whiteColor.withOpacity(0.8)),),
            ),
            VerticalSpacing(height: Dimensions.h_20),
            Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_30),
                child:  GestureDetector(
                    onTap:(){
                      _openfieldlanguagePicker(context);
                    },
                    child: CustomDropDownContainer(title: language,))),
            VerticalSpacing(height: Dimensions.h_20),
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
                      Get.to(const SucessCompleted());
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
            VerticalSpacing(height: Dimensions.h_20),
          ],
        ),
      ),
    );
  }
  void _openfieldgenderPicker(BuildContext context) {
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
                    title: Text('Male', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        gender = 'Male';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  ListTile(
                    title: Text('Female', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        gender = 'Female';
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
  void _openfieldlanguagePicker(BuildContext context) {
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
                    title: Text('English', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        language = 'English';
                      });
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  ListTile(
                    title: Text('Hindi', style: TextStyle(color: AppColor.whiteColor)),
                    onTap: () {
                      setState(() {
                        language = 'Hindi';
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
