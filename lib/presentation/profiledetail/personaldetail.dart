import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/constants/appcolor.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/constants/constants.dart';
import 'package:irl/constants/fontsize.dart';
import 'package:irl/presentation/careerdetail/careerdetail.dart';
import 'package:irl/presentation/profiledetail/personaldetailcontroller.dart';
import 'package:irl/utils/validators.dart';
import 'package:irl/widgets/spacing.dart';
import '../../constants/images.dart';

class PersonalDetail extends StatefulWidget {
  const PersonalDetail({super.key});
  @override
  State<PersonalDetail> createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {
  PersonalDetailController personalDetailController=Get.put(PersonalDetailController());
  final GlobalKey<FormState> key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      init: personalDetailController,
      id: ControllerBuilders.personalController,
      builder: (GetxController controller) {
        return Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body:  SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpacing(height: Dimensions.h_40),
                  Padding(
                    padding:  EdgeInsets.only(left: Dimensions.w_20),
                    child: Row(
                      children: [
                        Text('Personal Details',style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_22,color: AppColor.whiteColor)),
                        HorizontalSpacing(width: Dimensions.w_120),
                        Image.asset(Images.step1,),
                      ],
                    ),
                  ),
                  VerticalSpacing(height: Dimensions.h_40),
                  Padding(
                    padding:  EdgeInsets.only(left:Dimensions.w_20),
                    child: Text('What do we call you? *',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),),
                  ),
                   NewTextFormField(title: 'Sachin Saini',controller:personalDetailController.callController ,validator: Validator.nameValidate,),
                  VerticalSpacing(height: Dimensions.h_25),
                  Padding(
                    padding:  EdgeInsets.only(left:Dimensions.w_20),
                    child: Text('I’m here to...',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor,),),
                  ),
                   NewTextFormField(title: 'eg. I’m a biz owner, I’m here to find a tech co-founder',controller: personalDetailController.hereController,validator: Validator.address,),
                  VerticalSpacing(height: Dimensions.h_25),
                  Padding(
                    padding:  EdgeInsets.only(left:Dimensions.w_20),
                    child: Text('Mobile Number',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),),
                  ),
                   NewTextFormField(title: '+91 XXXX XXXX XX',controller: personalDetailController.numberController,validator: Validator.phoneNumberValidate,),
                  VerticalSpacing(height: Dimensions.h_25),
                  Padding(
                    padding:  EdgeInsets.only(left:Dimensions.w_20),
                    child: Text('Email',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor,),),
                  ),
                   NewTextFormField(title: 'Email',controller: personalDetailController.emailController,validator: Validator.emailValidate,),
                  VerticalSpacing(height: Dimensions.h_25),
                  Padding(
                    padding:  EdgeInsets.only(left:Dimensions.w_20),
                    child: Text('Date of Birth',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor,),),
                  ),
                   NewTextFormField(title: '15/03/2001',controller: personalDetailController.dbController,validator: Validator.dob,),
                  VerticalSpacing(height: Dimensions.h_25),
                  Padding(
                    padding:  EdgeInsets.only(left:Dimensions.w_20),
                    child: Text('What do you identify as?',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),),
                  ),
                   NewTextFormField(title: 'Male',controller: personalDetailController.identifyController,validator: Validator.identify,),
                  VerticalSpacing(height: Dimensions.h_35),
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
                    padding:  EdgeInsets.only(left: Dimensions.w_20,right:Dimensions.w_20 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Prev',style: AppTextStyle.normalTextStyle(FontSize.sp_16,AppColor.whiteColor,).copyWith(decoration: TextDecoration.underline,)),
                        GestureDetector(
                          onTap: (){
                            if(key.currentState!.validate()) {
                              Get.to(const CareerDetail());
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
          ),
        );
      },);
  }
}

class NewTextFormField extends StatelessWidget {
  final String title;
   final TextEditingController? controller;
   final String? Function(String?)? validator;
  const NewTextFormField({super.key,required this.title, this.controller,this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:Dimensions.w_20,right:Dimensions.w_20),
      child: TextFormField(
        validator:validator ,
        cursorColor: AppColor.whiteColor,
        style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),
        decoration:    InputDecoration(
          hintText: title,
          hintStyle: AppTextStyle.normalTextStyle(FontSize.sp_16,Colors.grey.shade600),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.cardColor,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}

