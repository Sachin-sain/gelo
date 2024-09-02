import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irl/presentation/useridentify/useridentify.dart';
import 'package:irl/widgets/customdrpdowncontainer.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constanttext.dart';
import '../../constants/fontsize.dart';
import '../../widgets/roundedbutton.dart';
import '../../widgets/spacing.dart';

class UserLive extends StatefulWidget {
  const UserLive({super.key});
  @override
  State<UserLive> createState() => _UserLiveState();
}

class _UserLiveState extends State<UserLive> {
   List<String> indianStates = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];
   // List of Major Indian Cities
    List<String> indianCities = [
     'Mumbai',
     'Delhi',
     'Bengaluru',
     'Kolkata',
     'Chennai',
     'Hyderabad',
     'Pune',
     'Ahmedabad',
     'Jaipur',
     'Surat',
     'Lucknow',
     'Kanpur',
     'Nagpur',
     'Indore',
     'Thane',
     'Bhopal',
     'Visakhapatnam',
     'Pimpri-Chinchwad',
     'Patna',
     'Vadodara',
     'Ghaziabad',
     'Ludhiana',
     'Agra',
     'Nashik',
     'Faridabad',
     'Meerut',
     'Rajkot',
     'Kalyan-Dombivli',
     'Vijayawada',
     'Jabalpur',
     'Aurangabad',
     'Ranchi',
     'Coimbatore',
     'Solapur',
     'Dehradun',
     'Guwahati',
     'Mysuru',
     'Chandigarh',
     'Mangalore',
     'Jodhpur',
     'Srinagar',
   ];


   var countryName = 'Select Country';
  var stateName = 'Select State';
  var cityName = 'Select City';
  String? state;
  String? country;
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerticalSpacing(height: Dimensions.h_100),
                Text(ConstantText.constant11,
                  style: AppTextStyle.themeBoldNormalTextStyle(
                      color: AppColor.whiteColor, fontSize: FontSize.sp_30),),
                VerticalSpacing(height: Dimensions.h_30),

                GestureDetector(
                  onTap: () {
                    _openCountryPicker(context);
                  },
                  child: CustomDropDownContainer(title: countryName,
                  ),
                ),
                VerticalSpacing(height: Dimensions.h_12),
                GestureDetector(
                  onTap: () {
                    _openStatePicker(context,);
                  },
                  child: CustomDropDownContainer(title: stateName,
                  ),
                ),
                VerticalSpacing(height: Dimensions.h_12),
                GestureDetector(
                  onTap: (){
                    _openCityPicker(context);
                  },
                    child: CustomDropDownContainer(title: cityName,)),
                VerticalSpacing(height: Dimensions.h_100),
                Text(ConstantText.constant12,
                  style: AppTextStyle.normalTextStyle(
                      FontSize.sp_16, AppColor.whiteColor),
                ),
                VerticalSpacing(height: Dimensions.h_30),
                RoundedButton(title: 'Next', onClick: () {
                if (stateName != null && countryName != null && cityName != null) {
                  Get.to(const UserIdentify());
                } }),
              ],
            ),
          ),
        )

    );
  }

  void _openCountryPicker(BuildContext context) {
    showCountryPicker(
      showSearch: true,
      favorite: ['+91', 'IN'],
      context: context,
      countryListTheme: const CountryListThemeData(
        flagSize: 25,
        backgroundColor: AppColor.backgroundColor,
        textStyle: TextStyle(fontSize: 16, color: AppColor.whiteColor),
        bottomSheetHeight: 550,
        // Optional. Country list modal height
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        inputDecoration: InputDecoration(
          hintText: 'Start typing to search',
          hintStyle: TextStyle(color: AppColor.whiteColor),
          prefixIcon: Icon(Icons.search, color: AppColor.whiteColor,),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
      onSelect: (country) {
        setState(() {
          countryName = country.name;
          if (kDebugMode) {
            print(countryName);
          }
        });
      },
    );
  }

   void _openStatePicker(BuildContext context) {
     Get.bottomSheet(
       Container(
         height: 550,
         decoration: const BoxDecoration(
           color: AppColor.backgroundColor,
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(20),
             topRight: Radius.circular(20),
           ),
         ),
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextField(
                 decoration: InputDecoration(
                   hintText: 'Start typing to search',
                   hintStyle: TextStyle(color: AppColor.whiteColor),
                   prefixIcon: Icon(Icons.search, color: AppColor.whiteColor,),
                   border: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Colors.grey,
                     ),
                   ),
                 ),
                 onChanged: (value) {
                   // Add search filter logic here if needed
                 },
               ),
             ),
             Expanded(
               child: ListView.builder(
                 itemCount: indianStates.length,
                 itemBuilder: (context, index) {
                   final state = indianStates[index];
                   return ListTile(
                     onTap: () {
                       setState(() {
                         stateName = state;
                       });
                       Get.back(); // Close the bottom sheet
                     },
                     title: Text(
                       state,
                       style: const TextStyle(fontSize: 16, color: AppColor.whiteColor),
                     ),
                   );
                 },
               ),
             ),
           ],
         ),
       ),
     );
   }
   void _openCityPicker(BuildContext context) {
     Get.bottomSheet(
       Container(
         height: 550,
         decoration: BoxDecoration(
           color: AppColor.backgroundColor,
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(20),
             topRight: Radius.circular(20),
           ),
         ),
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextField(
                 decoration: InputDecoration(
                   hintText: 'Start typing to search',
                   hintStyle: TextStyle(color: AppColor.whiteColor),
                   prefixIcon: Icon(Icons.search, color: AppColor.whiteColor),
                   border: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Colors.grey,
                     ),
                   ),
                 ),
                 onChanged: (value) {
                   // Add search filter logic here if needed
                 },
               ),
             ),
             Expanded(
               child: ListView.builder(
                 itemCount: indianCities.length,
                 itemBuilder: (context, index) {
                   final city = indianCities[index];
                   return ListTile(
                     onTap: () {
                       setState(() {
                         cityName = city;
                       });
                       Get.back(); // Close the bottom sheet
                     },
                     title: Text(
                       city,
                       style: TextStyle(fontSize: 16, color: AppColor.whiteColor),
                     ),
                   );
                 },
               ),
             ),
           ],
         ),
       ),
     );
   }




}
