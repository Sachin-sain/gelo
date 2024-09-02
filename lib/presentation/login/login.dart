
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:irl/constants/apptextstyle.dart';
import 'package:irl/constants/constants.dart';
import 'package:irl/constants/fontsize.dart';
import 'package:irl/presentation/login/logincontroller.dart';
import 'package:irl/presentation/loginverification/login_verification.dart';
import 'package:irl/widgets/commonTextformfield.dart';
import 'package:irl/widgets/roundedbutton.dart';
import 'package:irl/widgets/spacing.dart';
import '../../constants/appcolor.dart';
import '../../constants/constanttext.dart';



class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController=Get.put(LoginController());
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  String flagEmoji = '🇮🇳';
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  PopScope(
        canPop: false,
       child: SafeArea(
         child: GetBuilder(
           id: ControllerBuilders.loginPageController,
           init: loginController,
           builder: (GetxController controller) {
             return Form(
               key: loginKey,
               child: Scaffold(
                   backgroundColor: AppColor.backgroundColor,
                   appBar: AppBar(
                       backgroundColor: AppColor.backgroundColor,
                       systemOverlayStyle: const SystemUiOverlayStyle(
                         statusBarColor: AppColor.backgroundColor,
                       )
                   ),
                   body:SingleChildScrollView(
                     physics: const NeverScrollableScrollPhysics(),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         VerticalSpacing(height: Dimensions.h_100),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text(ConstantText.constant1,style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_30),),
                             Text('number?',style: AppTextStyle.themeBoldNormalTextStyle(color: AppColor.whiteColor,fontSize: FontSize.sp_30),),
                           ],
                         ),
                         VerticalSpacing(height: Dimensions.h_20),
                         Padding(
                           padding:  EdgeInsets.only(left: Dimensions.w_43,),
                           child: Expanded(
                             child: Row(
                               children: [
                                 Container(
                                   margin: EdgeInsets.only(bottom: Dimensions.h_20),
                                   decoration:  BoxDecoration(
                                     color: AppColor.cardColor,
                                     borderRadius: BorderRadius.circular(5),
                                   ),
                                   height: Dimensions.h_40,
                                   width: Dimensions.w_50,
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       HorizontalSpacing(width: Dimensions.w_3),
                                       Text( flagEmoji,style: TextStyle(fontSize: FontSize.sp_20)),
                                       GestureDetector(
                                           onTap: (){
                                             _openCountryPicker(context);
                                           },
                                           child: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.grey,))
                                     ],
                                   ),
                                 ),
                                 HorizontalSpacing(width: Dimensions.w_8),
                                 PhoneTextFormField(
                                   phoneController: loginController.phoneController,
                                   title: 'Mobile Number',
                                 ),
                               ],
                             ),
                           ),
                         ),
                         VerticalSpacing(height: Dimensions.h_15),
                         Text(ConstantText.constant2,style: AppTextStyle.normalTextStyle(FontSize.sp_16,AppColor.whiteColor),),
                         VerticalSpacing(height: Dimensions.h_80),
                         RoundedButton(title: 'Send OTP', onClick: (){
                           if (loginKey.currentState!.validate()) {
                             ///Api Aaayege
                             Get.to(const LoginVerification());
                           }}),
                       ],
                     ),
                   )
               ),
             );
           },)
       )
    );
  }
  void _openCountryPicker(BuildContext context) {
    showCountryPicker(
      showSearch: true,
      favorite: ['+91','IN'],
      context: context,
      countryListTheme: const CountryListThemeData(
        flagSize: 25,
        backgroundColor: AppColor.backgroundColor,
        textStyle: TextStyle(fontSize: 16, color: AppColor.whiteColor),
        bottomSheetHeight: 550, // Optional. Country list modal height
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        inputDecoration: InputDecoration(
          hintText: 'Start typing to search',
          hintStyle: TextStyle(color: AppColor.whiteColor),
          prefixIcon: Icon(Icons.search,color: AppColor.whiteColor,),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
      onSelect: (Country country) {
                setState(() {
                  flagEmoji = country.flagEmoji;
                });

      },
    );
  }
}



