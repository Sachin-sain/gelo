import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:irl/constants/appcolor.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/constants/fontsize.dart';
import 'package:irl/presentation/goldplans/goldplans.dart';
import 'package:irl/widgets/spacing.dart';
import '../../constants/images.dart';
import '../../widgets/roundedbutton.dart';

class Plans extends StatefulWidget {
  const Plans({super.key});
  @override
  State<Plans> createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
     body:  SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: Dimensions.h_150, // Height of the curved container
                    color: AppColor.blueColors // Background color of the container
                  ),
                ),
                  Positioned(top: Dimensions.h_70,
                  child: Row(
                    children: [
                      HorizontalSpacing(width: Dimensions.w_20),
                      const Icon(Icons.arrow_back_ios_new,size: 25,color: AppColor.whiteColor,),
                      HorizontalSpacing(width: Dimensions.w_20),
                      Image.asset(Images.logo,scale: 4,),
                      HorizontalSpacing(width: Dimensions.w_50),
                      Text('Choose Your Plan',style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_22,color: AppColor.whiteColor),)
                    ],
                  )
              ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_20,right: Dimensions.w_20,),
              child: const GradientBorderContainer(title: 'Basic',title1: 'Free', subtitle: 'View Paln >',),
            ),
            VerticalSpacing(height: Dimensions.h_10),
            Padding(
              padding:EdgeInsets.only(left: Dimensions.w_20,right: Dimensions.w_20,),
              child: const PlansContainer(title: 'Silver      ', title1: '₹500 / Month', subtitle: 'View Paln >', titles1: '. No Account Interactions: Unlimited', titles2: '. Preference-based account interactions: Yes', titles3: '. Messages (Texts+Images): Yes',),
            ),
            VerticalSpacing(height: Dimensions.h_10),
            Padding(
              padding:EdgeInsets.only(left: Dimensions.w_20,right: Dimensions.w_20,),
              child: GestureDetector(
                onTap: (){
                  Get.to(const GoldPlans());
                },
                  child: const PlansContainer(title: 'Gold        ', title1: '₹2000 / Qtrly', subtitle: 'View Paln >', titles1: '. No Account Interactions: Unlimited', titles2: '. Preference-based account interactions: Yes', titles3: '. Messages (Texts+Images): Yes',)),
            ),
            VerticalSpacing(height: Dimensions.h_20),
            Padding(
              padding:EdgeInsets.only(left: Dimensions.w_20,right: Dimensions.w_8,),
              child: const PlansContainer(title: 'Member', title1: '₹5000 / Qtrly', subtitle: 'View Paln >', titles1: '. Join the elite club!', titles2: '. Exclusive events only for   \nMembers', titles3: '. Highly curated events',),
            ),
            VerticalSpacing(height: Dimensions.h_10),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_20),
              child: RoundedButton(title: 'Select Plan', onClick: () {
                // Get.to(const ProfileDetail());
              }),
            ),
            VerticalSpacing(height: Dimensions.h_50),
       
          ],
        ),
     ),
    );
  }
}




class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // Start from the top left corner
    path.lineTo(0, size.height - 40); // Start 40px above the bottom left

    // Define the first wave
    var firstControlPoint = Offset(size.width / 5, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    // Define the second wave
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    // Complete the path
    path.lineTo(size.width, 0); // Move to the top right corner
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class GradientBorderContainer extends StatelessWidget {
  final String title;
  final String title1;
  final String subtitle;
  const GradientBorderContainer({super.key,required this.title,required this.title1,required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:  const GradientBoxBorder(
            gradient:LinearGradient(colors: [AppColor.blueColorss,AppColor.blueColor,AppColor.blueColors]),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16)
      ),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HorizontalSpacing(width: Dimensions.w_10),
          Center(child: Text(title,style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_18,color: AppColor.whiteColor),)),
          HorizontalSpacing(width: Dimensions.w_30),
          Container(
            width: Dimensions.w_1,
           padding: EdgeInsets.only(top: Dimensions.h_80),
          decoration: BoxDecoration(
            color: AppColor.whiteColor.withOpacity(0.3),
          ),
          ),
          HorizontalSpacing(width: Dimensions.w_30),
          Text(title1,style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_18,color: AppColor.whiteColor)),
          HorizontalSpacing(width: Dimensions.w_90),
          Padding(padding: EdgeInsets.only(
            top: Dimensions.h_30,

          ),
            child: Text(subtitle,style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_14,color: AppColor.whiteColor).copyWith(decoration: TextDecoration.underline)),
          )
        ],
      )
    );

  }
}

class PlansContainer extends StatelessWidget {
  final String title;
  final String title1;
  final String subtitle;
  final String titles1;
  final String titles2;
  final String titles3;
  const PlansContainer({super.key, required this.title, required this.title1, required this.subtitle, required this.titles1, required this.titles2, required this.titles3});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColor.whiteColor.withOpacity(0.1),
          width: 1
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HorizontalSpacing(width: Dimensions.w_10),
          Text(title,style: AppTextStyle.themeBoldTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_18),),
          // HorizontalSpacing(width: Dimensions.w_30),
          Container(
            width: Dimensions.w_1,
            padding: EdgeInsets.only(top: Dimensions.h_120,),
            decoration: BoxDecoration(
              color: AppColor.whiteColor.withOpacity(0.1),
            ),
          ),
          HorizontalSpacing(width: Dimensions.w_20),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
            Text(title1,style: AppTextStyle.themeBoldTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_18),),
            Text(titles1,style: AppTextStyle.normalTextStyle(FontSize.sp_10, AppColor.whiteColor.withOpacity(0.5)),overflow: TextOverflow.ellipsis,),
            Text(titles2,style: AppTextStyle.normalTextStyle(FontSize.sp_10, AppColor.whiteColor.withOpacity(0.5)),overflow: TextOverflow.ellipsis),
            Text(titles3,style: AppTextStyle.normalTextStyle(FontSize.sp_10, AppColor.whiteColor.withOpacity(0.5)),overflow: TextOverflow.ellipsis),
            Padding(padding: EdgeInsets.only(
              left: Dimensions.w_130,
              top: Dimensions.h_20
            ),
              child: Text(subtitle,style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_14,color: AppColor.whiteColor).copyWith(decoration: TextDecoration.underline)),
            )
          ],)
        ],
      ),
    );
  }
}

