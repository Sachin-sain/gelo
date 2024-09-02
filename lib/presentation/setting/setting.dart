
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:irl/constants/appcolor.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/constants/constanttext.dart';
import 'package:irl/constants/fontsize.dart';
import 'package:irl/presentation/myprofile/myprofile.dart';
import 'package:irl/presentation/plans/plans.dart';
import 'package:irl/widgets/spacing.dart';
import '../../constants/images.dart';


class Setting extends StatefulWidget {
  const Setting({super.key});
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
   File? _image;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
      ),
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VerticalSpacing(height: Dimensions.h_20),
            Text("Adalia",style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_30,color: AppColor.whiteColor)),
            VerticalSpacing(height: Dimensions.h_20),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: Dimensions.h_140,
                  width: Dimensions.w_160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child:_image==null ? Image.asset(Images.profileImage):Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height:Dimensions.h_40,
                      width: Dimensions.h_40,
                      decoration:const BoxDecoration(
                        color: AppColor.whiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt_outlined,size: 35,color: AppColor.backgroundColor,
                      ),
                    ),
                  ),
                ),
        
              ],
            ),
            VerticalSpacing(height: Dimensions.h_20),
            Container(
              margin: EdgeInsets.only(left: Dimensions.w_20,right: Dimensions.w_20),
              padding: EdgeInsets.all(Dimensions.h_10),
              decoration:  BoxDecoration(
                gradient: const LinearGradient(
             colors: [AppColor.blueColors,AppColor.blueColor],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Images.thirty,),
                  HorizontalSpacing(width: Dimensions.w_10),
                  Text(ConstantText.constantText27,style: AppTextStyle.normalTextStyle(FontSize.sp_14, AppColor.whiteColor),),
                  HorizontalSpacing(width: Dimensions.w_40),
                  Text('>>',style: AppTextStyle.normalTextStyle(FontSize.sp_30, AppColor.whiteColor),)
        
                ],
              ),
            ),
            VerticalSpacing(height: Dimensions.h_10),
            Align(
              alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: Dimensions.w_20),
                  child: Text('Media',style: AppTextStyle.normalTextStyle(FontSize.sp_20, AppColor.whiteColor),),
                )),
              VerticalSpacing(height: Dimensions.h_10),
            Row(
              children: [
                HorizontalSpacing(width: Dimensions.w_20),
               _image==null ?Image.asset(Images.profileImage,):Image.file(_image!),
                HorizontalSpacing(width: Dimensions.w_20),
                GestureDetector(
                  onTap: _pickImage,
                  child: DottedBorder(
                    dashPattern: const [8,8],
                    radius:const Radius.circular(100),
                    color: AppColor.whiteColor,
                      child: Container(
                        height: Dimensions.h_80,
                    width: Dimensions.w_100,
                    alignment: Alignment.center,
                    child:_image==null ?const Icon(Icons.add,size: 35,color: AppColor.whiteColor,):Image.file(_image!) ,
                  )),
                ),
              ],
            ),
            VerticalSpacing(height: Dimensions.h_10),
            const Divider(color: AppColor.lightGrey,),
            VerticalSpacing(height: Dimensions.h_10),
            GestureDetector(
              onTap: (){
                Get.to(const MyProfile());
              },
              child: const CommonRow(title: 'Settings',
              arrowIcon: Icons.arrow_forward_ios,),
            ),
            VerticalSpacing(height: Dimensions.h_10),
            const Divider(color: AppColor.lightGrey,),
            VerticalSpacing(height: Dimensions.h_10),
            GestureDetector(
              onTap: (){
                Get.to(const Plans());
              },
                child: const CommonRow(title: 'Plans',arrowIcon: Icons.arrow_forward_ios)),
            VerticalSpacing(height: Dimensions.h_10),
            const Divider(color: AppColor.lightGrey,),
            VerticalSpacing(height: Dimensions.h_10),
            GestureDetector(child: const CommonRow(title: 'Privacy Policy',arrowIcon: Icons.arrow_forward_ios)),
            VerticalSpacing(height: Dimensions.h_10),
            const Divider(color: AppColor.lightGrey,),
            VerticalSpacing(height: Dimensions.h_10),
            GestureDetector(child: const CommonRow(title: 'Logout',)),
          ],
        ),
      ),
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

class CommonRow extends StatelessWidget {
 final String title;
 final IconData? arrowIcon;

 const CommonRow({super.key,required this.title,this.arrowIcon,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: Dimensions.w_20,right: Dimensions.w_20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: AppTextStyle.normalTextStyle(FontSize.sp_18, AppColor.whiteColor),),
          HorizontalSpacing(width: Dimensions.w_160),
          Icon(arrowIcon ,size: 20,color: AppColor.whiteColor,),
        ],
      ),
    );
  }
}
