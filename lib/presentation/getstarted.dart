import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:irl/constants/appcolor.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/constants/fontsize.dart';
import 'package:irl/presentation/login/login.dart';
import 'package:irl/widgets/roundedbutton.dart';
import 'package:irl/widgets/spacing.dart';
import '../constants/images.dart';
class GetStarted extends StatefulWidget {
  const GetStarted({super.key});
  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted>with TickerProviderStateMixin {
   late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  @override
  void initState() {
    super.initState();

    // Initialize the animation controllers
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Start the first fade animation, then chain the others
    _controller1.forward().then((_) {
      _controller2.forward().then((_) {
        _controller3.forward();
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the controllers
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Padding(
          padding:  EdgeInsets.only(left: Dimensions.w_30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(height: Dimensions.h_40),
              Text('Bringing',style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_35)),
              Padding(
                padding:  EdgeInsets.only(right: Dimensions.w_30),
                child: Text('People',style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_35)),
              ),
              Text('Together',style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_35)),
            VerticalSpacing(height: Dimensions.h_20),
              FadeTransition(
                opacity: _controller1,
                  child: RoundedContainer(title: 'Find A Date')),
              VerticalSpacing(height: Dimensions.h_20),
              FadeTransition(
                opacity: _controller2,
                child: Row(
                  children: [
                    FadeTransition(
                      opacity: _controller1,
                      child:  Image.asset(Images.userImage1,height: Dimensions.h_90,width: Dimensions.h_90,),
                    ),
                    HorizontalSpacing(width:Dimensions.w_8),
                    RoundedContainer(title: ''),
                  ],
                ),
              ),
              VerticalSpacing(height: Dimensions.h_10),
              FadeTransition(
                opacity: _controller3,
                child: Row(
                  children: [
                    Image.asset(Images.userImage2,height: Dimensions.h_90,width: Dimensions.h_90),
                    HorizontalSpacing(width:Dimensions.w_8),
                    RoundedContainer(title: 'Network with \nprofessionals',),
                    HorizontalSpacing(width:Dimensions.w_8),
                    Image.asset(Images.userImage3,height: Dimensions.h_90,width: Dimensions.h_90),
                  ],
                ),
              ),
             VerticalSpacing(height: Dimensions.h_40,),
              RoundedButton(title: 'Get Started', onClick: () {
              Get.to(const LoginScreen());
              },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  String title;
   RoundedContainer({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.h_90,
      width: Dimensions.h_90,
      alignment: Alignment.center,
      decoration:  const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: [AppColor.blueColor,AppColor.blueColors,]
        )
      ),
      child: Text(title,textAlign: TextAlign.center,style: AppTextStyle.normalTextStyle(FontSize.sp_12,AppColor.whiteColor  ).copyWith(fontWeight: FontWeight.bold),),
    );
  }
}

