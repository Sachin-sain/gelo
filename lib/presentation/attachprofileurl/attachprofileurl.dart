
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/constants/constants.dart';
import 'package:irl/presentation/attachprofileurl/attachprofileurlcontroller.dart';
import 'package:irl/presentation/termscondition/termscondition.dart';
import 'package:irl/utils/validators.dart';
import 'package:irl/widgets/commonTextformfield.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constanttext.dart';
import '../../constants/fontsize.dart';
import '../../widgets/roundedbutton.dart';
import '../../widgets/spacing.dart';

class AttachProfileUrl extends StatefulWidget {
  const AttachProfileUrl({super.key});

  @override
  State<AttachProfileUrl> createState() => _AttachProfileUrlState();
}

class _AttachProfileUrlState extends State<AttachProfileUrl> {
  GlobalKey<FormState> profileKey = GlobalKey<FormState>();
  AttachProfileUrlController attachProfileUrlController=Get.put(AttachProfileUrlController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: attachProfileUrlController,
      id: ControllerBuilders.urlController,
      builder: (GetxController controller) {
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
            body:SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Form(
                key: profileKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(ConstantText.constant21,style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_30),),
                        Text('Profile URL',style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_30),),
                        VerticalSpacing(height: Dimensions.h_15),
                        CommonTextFormField(title: 'Enter Social Media Channel',controller: attachProfileUrlController.socialMediaController,validation: Validator.socialValidate,),
                      ],
                    ),
                    VerticalSpacing(height: Dimensions.h_20),
                    CommonTextFormField(title: 'Url Here',validation: Validator.urlValidate,controller: attachProfileUrlController.urlController,suffixIcon: const Icon(Icons.link_sharp,size: 25,color: AppColor.whiteColor,),),
                    VerticalSpacing(height: Dimensions.h_280),
                    Padding(
                      padding:  EdgeInsets.only(left: Dimensions.w_30),
                      child: RoundedButton(title: 'Next', onClick: (){
                        if(profileKey.currentState!.validate()){
                          Get.to(const TermsCondition());

                        }

                      }),
                    ),
                  ],
                ),
              ),
            )
        );
      },);
  }
}
