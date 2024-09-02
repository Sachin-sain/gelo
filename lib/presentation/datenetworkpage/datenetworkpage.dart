import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/presentation/uploadprofile/uploadprofile.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constanttext.dart';
import '../../constants/fontsize.dart';
import '../../widgets/datanetworkcustombutton.dart';
import '../../widgets/roundedbutton.dart';
import '../../widgets/spacing.dart';
class DateNetworkPage extends StatefulWidget {
  const DateNetworkPage({super.key});

  @override
  State<DateNetworkPage> createState() => _DateNetworkPageState();
}

class _DateNetworkPageState extends State<DateNetworkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Dimensions.h_60),
        child: AppBar(
          backgroundColor: AppColor.backgroundColor,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios, size: FontSize.sp_16,
                color: AppColor.whiteColor,)),
          title: Text('', style: AppTextStyle.themeBoldTextStyle(
              fontSize: FontSize.sp_16, color: AppColor.whiteColor),),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: Dimensions.w_30),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(height: Dimensions.h_30),
              Text(ConstantText.constant15,
                style: AppTextStyle.themeBoldNormalTextStyle(
                    color: AppColor.whiteColor, fontSize: FontSize.sp_30),),
              VerticalSpacing(height: Dimensions.h_30),
              ButtonToggleExample(),
              VerticalSpacing(height: Dimensions.h_10),
              Text(ConstantText.constant16, style: AppTextStyle.normalTextStyle(
                  FontSize.sp_16, AppColor.whiteColor),),
              VerticalSpacing(height: Dimensions.h_250),
              RoundedButton(title: 'Next', onClick: () {
                Get.to(const UploadProfile());
              }),
            ],
          ),
        ),
      ),
    );
  }
}



