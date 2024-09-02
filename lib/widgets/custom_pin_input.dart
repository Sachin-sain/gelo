import 'package:flutter/material.dart';
import 'package:irl/constants/appcolor.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/constants/fontsize.dart';
import 'package:irl/utils/validators.dart';
import 'package:pinput/pinput.dart';

class CustomPinInput extends StatelessWidget {
  final bool enabled;
  final TextEditingController pinController;
  final Function? onChanged;
  const CustomPinInput({super.key, required this.pinController, required this.enabled, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: Dimensions.w_20,right: Dimensions.w_20),
      child: Pinput(
        validator: Validator.otpValidate,
        onChanged: (value){
          if(onChanged!=null) onChanged!.call(value);
        },
        enabled: enabled,
          onTapOutside: (pointer){
            FocusScope.of(context).unfocus();
          },
          length: 6,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          controller: pinController,
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          defaultPinTheme: PinTheme(
            textStyle: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),
              constraints: const BoxConstraints(maxWidth: 300,maxHeight: 50),
              width: 40, height: 40,
              decoration: BoxDecoration(
                  color: AppColor.cardColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: Colors.grey,
                  )
              )
          ),
          focusedPinTheme: PinTheme(
              constraints: const BoxConstraints(maxWidth: 300,maxHeight: 50),
              width: 40, height: 40,
              decoration: BoxDecoration(
                  color: AppColor.cardColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: Colors.grey,
                  )
              )
          )
      ),
    );
  }
}