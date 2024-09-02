import 'package:flutter/material.dart';
import 'package:irl/constants/appcolor.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/utils/validators.dart';
import '../constants/fontsize.dart';

class CommonTextFormField extends StatelessWidget {
   final String title;
   final Widget? suffixIcon ;
    final String? Function(String?)? validation;
     TextEditingController? controller=TextEditingController();

    CommonTextFormField({super.key,required this.title,this.suffixIcon, this.validation, this.controller});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.h_60,
      width: Dimensions.w_290,
      child: TextFormField(
        controller:controller ,
        validator: validation,
        maxLines: 1,
        style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),
        cursorColor: Colors.grey,
        keyboardType: TextInputType.text,
        decoration:  InputDecoration(
            suffix:suffixIcon,
            hintStyle: AppTextStyle.themeBoldNormalTextStyle(fontSize: FontSize.sp_16,color: Colors.grey),
            hintText: title,
           filled: true,
           fillColor: AppColor.cardColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            )
        ),
      ),
    );
  }
}


class PhoneTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController phoneController;

  const PhoneTextFormField({
    Key? key,
    required this.title,
    required this.phoneController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.h_60,
      width: Dimensions.w_220,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: phoneController,
        validator: Validator.phoneNumberValidate,
        style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),
        cursorColor: Colors.grey,
        keyboardType: TextInputType.number,
        keyboardAppearance: Brightness.dark,
        decoration: InputDecoration(
          hintStyle: AppTextStyle.themeBoldNormalTextStyle(
            fontSize: FontSize.sp_16,
            color: Colors.grey,
          ),
          hintText: title,
          filled: true,
          fillColor: AppColor.cardColor,
          border:  OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5),
          ),
            ),
          ),
        );

  }
}

