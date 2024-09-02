import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irl/constants/appcolor.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/constants/constanttext.dart';
import 'package:irl/constants/fontsize.dart';
import 'package:irl/presentation/dashboard/dashboard.dart';
import 'package:irl/widgets/spacing.dart';
import '../../constants/images.dart';
class NowseeWatchList extends StatefulWidget {
  const NowseeWatchList({super.key});
  @override
  State<NowseeWatchList> createState() => _NowseeWatchListState();
}

class _NowseeWatchListState extends State<NowseeWatchList> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: AppColor.backgroundColor,
            )
        ),
        backgroundColor: AppColor.backgroundColor,
        body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left:Dimensions.w_10),
              child: Text(ConstantText.constant25,style: AppTextStyle.normalTextStyle(FontSize.sp_30, AppColor.whiteColor),),
            ),
            VerticalSpacing(height: Dimensions.h_50),
            Padding(
              padding:  EdgeInsets.only(left:Dimensions.w_60),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard(index: 3,)));
                },
                  child: Image.asset(Images.styleLogo,scale: 2)),
            ),
            VerticalSpacing(height: Dimensions.h_50),
            Padding(
              padding:  EdgeInsets.only(left:Dimensions.w_30),
              child: Text(ConstantText.constantText26,style: AppTextStyle.normalTextStyle(FontSize.sp_14,AppColor.whiteColor),),
            )
          ],
        ),
      ),
    );
  }
}
