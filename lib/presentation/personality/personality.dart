import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/presentation/partnerprefernce/partnerprefernce.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/fontsize.dart';
import '../../constants/images.dart';
import '../../widgets/lifestylecomponenet.dart';
import '../../widgets/spacing.dart';
class Personality extends StatefulWidget {
  const Personality({super.key});

  @override
  State<Personality> createState() => _PersonalityState();
}

class _PersonalityState extends State<Personality> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body:  SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(height: Dimensions.h_40),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Row(
                children: [
                  Text('Personality Detail',style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_20,color: AppColor.whiteColor)),
                  HorizontalSpacing(width: Dimensions.w_100),
                  Image.asset(Images.step4,),
                ],
              ),
            ),

            VerticalSpacing(height: Dimensions.h_40),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_30),
              child: Text('Choose Your Personality',style: AppTextStyle.normalTextStyle(FontSize.sp_16, Colors.grey),),
            ),
            VerticalSpacing(height: Dimensions.h_20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InterestContainer(title: 'Empathetic',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_130,isSelected:true ),
                InterestContainer(title: 'Creative', addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_130, ),
                InterestContainer(title: 'Playful',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_90, ),
              ],
            ),
            VerticalSpacing(height: Dimensions.h_15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HorizontalSpacing(width: Dimensions.w_10),
                InterestContainer(title: 'Outgoing',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_130,isSelected:true ),
                HorizontalSpacing(width: Dimensions.w_10),
                InterestContainer(title: 'Introvert', addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_100, ),


              ],
            ),
            VerticalSpacing(height: Dimensions.h_15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InterestContainer(title: 'Empathetic',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_130,isSelected:true ),
                InterestContainer(title: 'Creative', addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_130, ),
                InterestContainer(title: 'Playful',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_90, ),
              ],
            ),
            VerticalSpacing(height: Dimensions.h_15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InterestContainer(title: 'Empathetic',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_130,isSelected:true ),
                InterestContainer(title: 'Creative', addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_130, ),
                InterestContainer(title: 'Playful',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_90, ),
              ],
            ),
            VerticalSpacing(height: Dimensions.h_15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HorizontalSpacing(width: Dimensions.w_10),
                InterestContainer(title: 'Outgoing',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_130,isSelected:true ),
                HorizontalSpacing(width: Dimensions.w_10),
                InterestContainer(title: 'Introvert', addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_100, ),


              ],
            ),
            VerticalSpacing(height: Dimensions.h_15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InterestContainer(title: 'Empathetic',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_130,isSelected:true ),
                InterestContainer(title: 'Creative', addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_130, ),
                InterestContainer(title: 'Playful',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_90, ),
              ],
            ),
            VerticalSpacing(height: Dimensions.h_15),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_10),
              child: InterestContainer(title: 'Ambitious',addIcon: Icons.add,radiusKhde: BorderRadius.circular(5), height: Dimensions.h_40,width: Dimensions.w_160,isSelected:true ),
            ),
            VerticalSpacing(height: Dimensions.h_115),
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
                    Get.to(const PartnerPreFernce());
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
            VerticalSpacing(height: Dimensions.h_10),
          ],
        ),
      ),
    );
  }

}
