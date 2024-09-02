import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/constants/constants.dart';
import 'package:irl/presentation/dbpage/dbpagecontroller.dart';
import 'package:irl/presentation/userlive/userlive.dart';
import 'package:irl/utils/validators.dart';
import 'package:irl/widgets/commonTextformfield.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constanttext.dart';
import '../../constants/fontsize.dart';
import '../../widgets/roundedbutton.dart';
import '../../widgets/spacing.dart';

class DbPage extends StatefulWidget {
  const DbPage({super.key});

  @override
  State<DbPage> createState() => _DbPageState();
}

class _DbPageState extends State<DbPage> {
  DbPageController dbPageController=Get.put(DbPageController());
  GlobalKey<FormState> dbKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: dbPageController,
      id: ControllerBuilders.dbController,
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
          body:Padding(
            padding:  EdgeInsets.only(left:Dimensions.w_30),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Form(
                key: dbKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    VerticalSpacing(height: Dimensions.h_100),
                    Text(ConstantText.constant9,style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_30),),
                    Text('birth?',style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor),),
                    VerticalSpacing(height: Dimensions.h_30),
                    CommonTextFormField(title: '                              DD/MM/YYYY',controller: dbPageController.dbController,validation: Validator.dob,),
                    VerticalSpacing(height: Dimensions.h_30),
                    RoundedButton(title: 'Next', onClick: (){
                      if (dbKey.currentState!.validate()) {
                        Get.to(const UserLive());
                      } }),
                    VerticalSpacing(height: Dimensions.h_60),
                    Text(ConstantText.constant10,style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),
                    )
                  ],
                ),
              ),
            ),
          )

      );
    },);
  }
}
