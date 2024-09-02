import 'package:flutter/material.dart';
import 'package:irl/presentation/datenetworkpage/datenetworkpage.dart';
import 'package:irl/presentation/login/login.dart';
import 'package:irl/presentation/myprofile/myprofile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/fontsize.dart';
import '../../constants/images.dart';
import '../plans/plans.dart';
import '../setting/setting.dart';


class DashBoard extends StatefulWidget {
  int? index;
  DashBoard({super.key,this.index,});
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with WidgetsBindingObserver {
 int selectedIndex = 0;

  onPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
  selectedIndex = widget.index ?? 0;
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
    Widget build(BuildContext context) {
      return PopScope(
        canPop: false,
         child: Stack(
          children: [
            Scaffold(
                 body:  callPage(selectedIndex,),
                bottomNavigationBar:  SalomonBottomBar(
                  currentIndex: selectedIndex,
                  backgroundColor: AppColor.backgroundColor,
                  onTap: onPage,
                  items: [
                    SalomonBottomBarItem(
                      activeIcon: SizedBox(
                          height: Dimensions.h_20,
                          width: Dimensions.h_20,
                          child: Image.asset(Images.home,)),
                      icon: SizedBox(
                          height: Dimensions.h_23,
                          width: Dimensions.h_23,
                          child: Image.asset(Images.home)),
                      title: Text( "Home",style: AppTextStyle.themeBoldNormalTextStyle(
                          fontSize: FontSize.sp_15,color: AppColor.whiteColor
                      ),),
                    ),
                    SalomonBottomBarItem(
                      activeIcon: SizedBox(
                          height: Dimensions.h_20,
                          width: Dimensions.h_20,
                          child: Image.asset(Images.date,)),
                      icon: SizedBox(
                          height: Dimensions.h_25,
                          width: Dimensions.h_25,
                          child: Image.asset(Images.date)),
                      title: Text( "Date",style: AppTextStyle.themeBoldNormalTextStyle(
                          fontSize: FontSize.sp_15,color: AppColor.whiteColor
                      ),),
                    ),
                    SalomonBottomBarItem(
                      activeIcon: SizedBox(
                          height: Dimensions.h_20,
                          width: Dimensions.h_20,
                          child: Image.asset(Images.people,)),
                      icon: SizedBox(
                          height: Dimensions.h_20,
                          width: Dimensions.h_20,
                          child: Image.asset(Images.people)),
                      title: Text( "people",style: AppTextStyle.themeBoldNormalTextStyle(
                          fontSize: FontSize.sp_15,color: AppColor.whiteColor
                      ),),
                    ),
                    SalomonBottomBarItem(
                      activeIcon: SizedBox(
                          height: Dimensions.h_20,
                          width: Dimensions.h_20,
                          child: Image.asset(
                            Images.setting,
                          )),
                      icon: SizedBox(
                          height: Dimensions.h_20,
                          width: Dimensions.h_20,
                          child: Image.asset(Images.setting)),
                      title:  Text( "Seeting",style: AppTextStyle.themeBoldNormalTextStyle(
                          fontSize: FontSize.sp_15,color: AppColor.whiteColor,
                      ),),
                    ),
                  ],
                )
            ),
          ],
        ),
      );
    }
}


Widget? callPage(int i,) {
  switch (i) {
    case 0:
      return const Plans();
    case 1:
      return const DateNetworkPage();
    case 2:
      return const MyProfile();
    case 3:
      return  const Setting();
    default:
      return const LoginScreen();
  }
}
