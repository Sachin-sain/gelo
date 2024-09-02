import 'package:flutter/material.dart';
import 'package:irl/constants/appcolor.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/constants/fontsize.dart';

class InterestContainer extends StatefulWidget {
  final double height;
  final double width;
  final String title;
  final IconData? addIcon;
  final BorderRadius? radiusKhde;
  final bool isSelected;

  const InterestContainer({
    super.key,
    required this.title,
    this.addIcon,
    this.radiusKhde,
    this.isSelected = false,
    required this.height,
    required this.width,
  });

  @override
  _InterestContainerState createState() => _InterestContainerState();
}

class _InterestContainerState extends State<InterestContainer> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: _isSelected ? Colors.blueAccent : AppColor.backgroundColor,
          borderRadius: widget.radiusKhde ?? BorderRadius.circular(0),
          border: Border.all(
            color: _isSelected ? Colors.transparent : AppColor.whiteColor.withOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              _isSelected ? Icons.done : Icons.add,
              size: 25,
              color: _isSelected ? AppColor.whiteColor : Colors.grey,
            ),
            Text(
              widget.title,
              style: AppTextStyle.normalTextStyle(
                FontSize.sp_16,
                _isSelected ? AppColor.whiteColor : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class SmokeContainer extends StatefulWidget {
  final double height;
  final double width;
  final String title;
  final BorderRadius? radiusKhde;
  final bool isSelected;

  const SmokeContainer({
    super.key,
    required this.title,
    this.radiusKhde,
    this.isSelected = false,
    required this.height,
    required this.width,
  });

  @override
  _SmokeContainerState createState() => _SmokeContainerState();
}

class _SmokeContainerState extends State<SmokeContainer> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: _isSelected ? Colors.blueAccent : AppColor.backgroundColor,
          borderRadius: widget.radiusKhde ?? BorderRadius.circular(0),
          border: Border.all(
            color: _isSelected ? Colors.transparent : AppColor.whiteColor.withOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.title,
              style: AppTextStyle.normalTextStyle(
                FontSize.sp_16,
                _isSelected ? AppColor.whiteColor : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
