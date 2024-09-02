
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/constants/constants.dart';
import 'package:irl/presentation/attachafcebookprofile/attachfacebookprofilecontroller.dart';
import 'package:irl/presentation/attachprofileurl/attachprofileurl.dart';
import 'package:irl/utils/validators.dart';
import 'package:irl/widgets/commonTextformfield.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constanttext.dart';
import '../../constants/fontsize.dart';
import '../../constants/images.dart';
import '../../widgets/roundedbutton.dart';
import '../../widgets/spacing.dart';

class AttachFaceBookProfile extends StatefulWidget {
  const AttachFaceBookProfile({super.key});
  @override
  State<AttachFaceBookProfile> createState() => _AttachFaceBookProfileState();
}

class _AttachFaceBookProfileState extends State<AttachFaceBookProfile> {
  AttachFaceBookProfileController faceBookProfileController=Get.put(AttachFaceBookProfileController());
  GlobalKey<FormState> facebookKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: faceBookProfileController,
      id: ControllerBuilders.facebookController,
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
              key: facebookKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(ConstantText.constant21,style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_30),),
                      Text('Profile URL',style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_30),),
                      VerticalSpacing(height: Dimensions.h_15),
                      const ProfileContainer1(profileImage: Images.faceBook, title: 'Facebook',)
                    ],
                  ),
                  VerticalSpacing(height: Dimensions.h_20),
                  Padding(
                    padding:  EdgeInsets.only(left:Dimensions.w_25 ),
                    child: CommonTextFormField(title: 'Url Here',
                      validation: Validator.facebookValidate,
                      controller: faceBookProfileController.faceBookUrlController,
                      suffixIcon: Padding(
                        padding:  EdgeInsets.only(top: Dimensions.h_8),
                        child: const Icon(Icons.link_sharp,size: 25,color: AppColor.whiteColor,),
                      ),),
                  ),
                  VerticalSpacing(height: Dimensions.h_10),
                  Padding(
                    padding:  EdgeInsets.only(right: Dimensions.w_100),
                    child: Text('How to find URL',style: AppTextStyle.normalTextStyle(FontSize.sp_14, Colors.grey),),
                  ),

                  VerticalSpacing(height: Dimensions.h_280),
                  Padding(
                    padding:  EdgeInsets.only(left: Dimensions.w_30),
                    child: RoundedButton(title: 'Next', onClick: (){
                      if(facebookKey.currentState!.validate()){
                        Get.to(const AttachProfileUrl());
                      }
                    }),
                  ),
                ],
              ),
            ),
          )
      );
    },
    );
  }
}
class ProfileContainer1 extends StatelessWidget {
  final String title;
  final String? profileImage;
  const ProfileContainer1({super.key,required this.title,  this.profileImage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: Dimensions.w_30,top: 0),
      child: Container(
        height: Dimensions.h_40,
        width: Dimensions.w_280,
        decoration:  BoxDecoration(
          gradient: const LinearGradient(colors: [AppColor.blueColors,AppColor.blueColor]),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColor.backgroundColor,

            )
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: Dimensions.h_20,
                width: Dimensions.w_20,
                child: Image.asset(profileImage ?? '',scale: 0.9,fit: BoxFit.fill,)),
            HorizontalSpacing(width: Dimensions.w_15),
            Text(title,style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),),
          ],
        ),
      ),
    );
  }
}