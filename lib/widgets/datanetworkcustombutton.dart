import 'package:flutter/cupertino.dart';
import 'package:irl/widgets/spacing.dart';
import '../constants/appcolor.dart';
import '../constants/apptextstyle.dart';
import '../constants/fontsize.dart';

class ButtonToggleExample extends StatefulWidget {
  const ButtonToggleExample({super.key});

  @override
  _ButtonToggleExampleState createState() => _ButtonToggleExampleState();
}

class _ButtonToggleExampleState extends State<ButtonToggleExample> {
  String _selectedButton = 'Data';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: Dimensions.w_10),
      child: Container(
        height: Dimensions.h_60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.cardColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(color: AppColor.lightGrey),
          ],
        ),
        child: Row(
          children: [
            _buildButton('Data'),
            HorizontalSpacing(width: Dimensions.w_15),
            _buildButton('Network'),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String title) {
    bool isSelected = _selectedButton == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedButton = title;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: Dimensions.h_40,
        width: Dimensions.w_150,
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
            colors: [AppColor.blueColors, AppColor.blueColor],
          )
              : const LinearGradient(
            colors: [AppColor.whiteColor, AppColor.whiteColor],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: AppTextStyle.normalTextStyle(
            FontSize.sp_16,
            isSelected ? AppColor.whiteColor : AppColor.backgroundColor,
          ),
        ),
      ),
    );
  }
}