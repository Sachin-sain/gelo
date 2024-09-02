import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/constants/constants.dart';
import 'package:irl/presentation/dbpage/dbpage.dart';
import 'package:irl/presentation/emailpage/emailpagecontoller.dart';
import 'package:irl/utils/validators.dart';
import 'package:irl/widgets/commonTextformfield.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constanttext.dart';
import '../../constants/fontsize.dart';
import '../../widgets/roundedbutton.dart';
import '../../widgets/spacing.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  EmailPageController emailPageController=Get.put(EmailPageController());
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: emailPageController,
      id: ControllerBuilders.emailPageController,
      builder: (GetxController controller) {
      return Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body:Padding(
            padding:  EdgeInsets.only(left: Dimensions.w_30),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Form(
                key: emailKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    VerticalSpacing(height: Dimensions.h_100),
                    Text(ConstantText.constant8,style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_30),),
                    VerticalSpacing(height: Dimensions.h_30),
                    CommonTextFormField(title: 'Enter Email ',validation: Validator.emailValidate,controller: emailPageController.emailController,),
                    VerticalSpacing(height: Dimensions.h_120),
                    RoundedButton(title: 'Next', onClick: (){
                      if (emailKey.currentState!.validate()) {
                        Get.to(const DbPage());
                      } })
                  ],
                ),
              ),
            ),
          )
      );
    },);
  }
}
