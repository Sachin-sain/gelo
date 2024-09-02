import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constanttext.dart';
import '../../constants/fontsize.dart';
import '../../constants/images.dart';
import '../../widgets/roundedbutton.dart';
import '../../widgets/spacing.dart';
import '../attachafcebookprofile/attachfecebookprofile.dart';

class VerifySocialMedia extends StatefulWidget {
  const VerifySocialMedia({super.key});
  @override
  State<VerifySocialMedia> createState() => _VerifySocialMediaState();
}

class _VerifySocialMediaState extends State<VerifySocialMedia> {
  @override
  void initState() {
    signInAndGetToken('sachinboxfy@gmail.com','Demo@123');
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
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
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(ConstantText.constant19,style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_30),),
                const ProfileContainer(title: 'Facebook', profileImage:Images.faceBook,),
              VerticalSpacing(height: Dimensions.h_15),
               const ProfileContainer(title: 'Linkedin', profileImage: Images.linkedIn),
              VerticalSpacing(height: Dimensions.h_15),
               const ProfileContainer(title: 'Instagram', profileImage: Images.instaramImage),
              VerticalSpacing(height: Dimensions.h_15),
              Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_20),
                child: Container(
                  alignment: Alignment.center,
                  height: Dimensions.h_35,
                  width: Dimensions.w_300,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.grey,
                      )
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: Dimensions.w_95),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (Image.asset(Images.twitterImage,scale: 0.9,)),
                        HorizontalSpacing(width: Dimensions.w_20),
                        Text('Twitter',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              // const ProfileContainer(title: 'Twitter', profileImage: Images.twitterImage),
              VerticalSpacing(height: Dimensions.h_15),
              Padding(
                padding:  EdgeInsets.only(right:Dimensions.w_5),
                child:  const ProfileContainer(title: 'Threads', profileImage: Images.threadImage),
              ),
              VerticalSpacing(height: Dimensions.h_15),
              Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_20),
                child: Container(
                            alignment: Alignment.center,
                            height: Dimensions.h_35,
                            width: Dimensions.w_300,
                            decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.grey,
                  )
                            ),
                            child: Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_20),
                child: Text('Others',style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),),
                            ),
                          ),
              ),
              VerticalSpacing(height: Dimensions.h_30),
              Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_10),
                child: Text(ConstantText.constant20,style: AppTextStyle.normalTextStyle(FontSize.sp_12, AppColor.whiteColor),),
              ),
              VerticalSpacing(height: Dimensions.h_20),
              Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_30),
                child: RoundedButton(title: 'Next', onClick: (){
                  Get.to(const AttachFaceBookProfile());
                }),
              ),
            ],
          ),
        )
    );
  }
  Future<void> signInAndGetToken(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        // Get the ID token of the user
        String? token = await user.getIdToken();
        print("User Token: $token");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
class ProfileContainer extends StatelessWidget {
 final String title;
 final String? profileImage;
final double? scale;
    const ProfileContainer({super.key,required this.title,  this.profileImage,this.scale});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: Dimensions.w_20,top: 0),
      child: Container(
        height: Dimensions.h_35,
        width: Dimensions.w_300,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.grey,
          )
        ),
       child:  Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           SizedBox(
             height: Dimensions.h_20,
               width: Dimensions.w_20,
               child: Image.asset(profileImage ?? '',scale: scale?? 0.9,fit: BoxFit.fill,)),
           HorizontalSpacing(width: Dimensions.w_15),
           Text(title,style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),),
         ],
       ),
      ),
    );
  }
}
