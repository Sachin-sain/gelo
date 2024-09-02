import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/constants/constants.dart';
import 'package:irl/presentation/emailpage/emailpage.dart';
import 'package:irl/presentation/namepage/namepagecontroller.dart';
import 'package:irl/utils/validators.dart';
import 'package:irl/widgets/commonTextformfield.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constanttext.dart';
import '../../constants/fontsize.dart';
import '../../widgets/roundedbutton.dart';
import '../../widgets/spacing.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});
  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  NamePageController namePageController=Get.put(NamePageController());
  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: namePageController,
      id: ControllerBuilders.namePageController,
      builder: (GetxController controller) {
        return Scaffold(
            backgroundColor: AppColor.backgroundColor,
            body:Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Form(
                  key: nameKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      VerticalSpacing(height: Dimensions.h_100),
                      Text(ConstantText.constant6,style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_30),),
                      VerticalSpacing(height: Dimensions.h_30),
                      CommonTextFormField(title: 'Enter Name',validation: Validator.nameValidate,controller: namePageController.nameController,),
                      VerticalSpacing(height: Dimensions.h_10),
                      Text(ConstantText.constant7,style: AppTextStyle.normalTextStyle(FontSize.sp_16,AppColor.whiteColor),),
                      VerticalSpacing(height: Dimensions.h_100),
                      RoundedButton(title: 'Next', onClick: (){
                        if (nameKey.currentState!.validate()) {
                          ///Api Aaayege
                          Get.to(const EmailPage());
                        }}),
                    ],
                  ),
                ),
              ),
            )
        );
      },);
  }

}
