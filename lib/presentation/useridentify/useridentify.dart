import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/presentation/useroccupation/useroccupation.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constanttext.dart';
import '../../constants/fontsize.dart';
import '../../widgets/roundedbutton.dart';
import '../../widgets/spacing.dart';

class UserIdentify extends StatefulWidget {
  const UserIdentify({super.key});

  @override
  State<UserIdentify> createState() => _UserIdentifyState();
}

class _UserIdentifyState extends State<UserIdentify> {
  String? _selectedGender; // Track the selected gender

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
            child: Icon(
              Icons.arrow_back_ios,
              size: FontSize.sp_16,
              color: AppColor.whiteColor,
            ),
          ),
          title: Text(
            '',
            style: AppTextStyle.themeBoldTextStyle(
              fontSize: FontSize.sp_16,
              color: AppColor.whiteColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: Dimensions.w_30),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerticalSpacing(height: Dimensions.h_100),
              Text(
                ConstantText.constant13,
                style: AppTextStyle.themeBoldNormalTextStyle(
                  color: AppColor.whiteColor,
                  fontSize: FontSize.sp_30,
                ),
              ),
              VerticalSpacing(height: Dimensions.h_30),
              CustomContainer(
                title: 'Man',
                isSelected: _selectedGender == 'Man',
                onTap: () {
                  setState(() {
                    _selectedGender = 'Man';
                  });
                },
              ),
              VerticalSpacing(height: Dimensions.h_20),
              CustomContainer(
                title: 'Woman',
                isSelected: _selectedGender == 'Woman',
                onTap: () {
                  setState(() {
                    _selectedGender = 'Woman';
                  });
                },
              ),
              VerticalSpacing(height: Dimensions.h_20),
              CustomContainer(
                title: 'Non Binary',
                isSelected: _selectedGender == 'Non Binary',
                onTap: () {
                  setState(() {
                    _selectedGender = 'Non Binary';
                  });
                },
              ),
              VerticalSpacing(height: Dimensions.h_130),
              RoundedButton(
                title: 'Next',
                onClick: () {
                  if (_selectedGender != null) {
                    Get.to(const UserOccuPation());
                  } else {
                    // Handle case when no gender is selected
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class CustomContainer extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomContainer({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ),
        child: Text(
          title,
          style: AppTextStyle.normalTextStyle(
            FontSize.sp_16,
            isSelected ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}

