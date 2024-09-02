import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:irl/presentation/verifysocialmedia/verifysocialmedia.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constanttext.dart';
import '../../constants/fontsize.dart';
import '../../widgets/roundedbutton.dart';
import '../../widgets/spacing.dart';

class UploadProfile extends StatefulWidget {
  const UploadProfile({super.key});
  @override
  State<UploadProfile> createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Dimensions.h_60),
          child: AppBar(
            backgroundColor: AppColor.backgroundColor,
            leading:   GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios,size: FontSize.sp_16,color: AppColor.whiteColor,)),
            title: Text('',style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_16,color: AppColor.whiteColor),),
          ),
        ),
        body:SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerticalSpacing(height: Dimensions.h_20),
              Text(ConstantText.constant17,style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_30),),
              Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_30),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: DottedBorder(
                    strokeWidth: 2,
                    color: AppColor.whiteColor,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 10],
                    child: Container(
                      alignment: Alignment.center,
                      height: Dimensions.h_250,
                      width: Dimensions.w_270,
                     child: _image == null
                    ? const Icon(
                    Icons.add,
                      size: 30,
                      color: AppColor.whiteColor,
                    )
                        : Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  ),
                    ),
                  ),
                ),
              ),
              VerticalSpacing(height: Dimensions.h_30),
              Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_30),
                child: Text(ConstantText.constant18,style: AppTextStyle.normalTextStyle(FontSize.sp_16, AppColor.whiteColor),),
              ),
              VerticalSpacing(height: Dimensions.h_20),
              Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_30),
                child: RoundedButton(title: 'Submit', onClick: (){
                  if(_image!=null){
                    Get.to(const VerifySocialMedia());
                  }
                }),
              )
            ],
          ),
        )
    );
  }
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}
