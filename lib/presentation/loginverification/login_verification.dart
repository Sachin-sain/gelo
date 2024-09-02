import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/constants/appcolor.dart';
import 'package:irl/constants/constants.dart';
import 'package:irl/presentation/loginverification/loginverificationcontroller.dart';
import 'package:irl/presentation/namepage/namepage.dart';
import 'package:irl/widgets/custom_pin_input.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constanttext.dart';
import '../../constants/fontsize.dart';
import '../../widgets/roundedbutton.dart';
import '../../widgets/spacing.dart';



class LoginVerification extends StatefulWidget {
  const LoginVerification({super.key,});

  @override
  State<LoginVerification> createState() => _LoginVerificationState();
}

class _LoginVerificationState extends State<LoginVerification> {
  LoginVerificationController loginVerificationController=Get.put(LoginVerificationController());
  GlobalKey<FormState> verificationKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      init: loginVerificationController,
      id: ControllerBuilders.otpPageController,
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
                title: const Text('',),
              ),
            ),
            body:Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_23),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Form(
                  key: verificationKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      VerticalSpacing(height: Dimensions.h_100),
                      Column(
                        children: [
                          Text(ConstantText.constant3,style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_30),),
                          Text('Code',style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_30),),
                        ],
                      ),
                      VerticalSpacing(height: Dimensions.h_30),
                      Text(ConstantText.constant4,style: AppTextStyle.normalTextStyle(FontSize.sp_16,AppColor.whiteColor),),
                      VerticalSpacing(height: Dimensions.h_15),
                      CustomPinInput(pinController: loginVerificationController.pinController, enabled: true),
                      VerticalSpacing(height: Dimensions.h_50),
                      RoundedButton(title: 'Verify', onClick: (){
                      if (verificationKey.currentState!.validate()) {
                        ///Api Aaayege
                        Get.to(const NamePage());
                      }}),
                      VerticalSpacing(height: Dimensions.h_15),
                      Text(ConstantText.constant5,style: AppTextStyle.normalTextStyle(FontSize.sp_12,AppColor.whiteColor),),

                    ],
                  ),
                ),
              ),
            )

        );

      },
    );
  }
}