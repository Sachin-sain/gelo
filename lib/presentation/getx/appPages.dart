import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:irl/presentation/attachprofileurl/attachprofileurl.dart';
import 'package:irl/presentation/datenetworkpage/datenetworkpage.dart';
import 'package:irl/presentation/emailpage/emailpage.dart';
import 'package:irl/presentation/goldplans/goldplans.dart';
import 'package:irl/presentation/intersestlifestyle/interestlifestyle.dart';
import 'package:irl/presentation/login/login.dart';
import 'package:irl/presentation/loginverification/login_verification.dart';
import 'package:irl/presentation/myprofile/myprofile.dart';
import 'package:irl/presentation/namepage/namepage.dart';
import 'package:irl/presentation/partnerprefernce/partnerprefernce.dart';
import 'package:irl/presentation/personality/personality.dart';
import 'package:irl/presentation/plans/plans.dart';
import 'package:irl/presentation/sucesscompleted/sucesscompleted.dart';
import 'package:irl/presentation/termscondition/termscondition.dart';
import 'package:irl/presentation/uploadprofile/uploadprofile.dart';
import 'package:irl/presentation/userlive/userlive.dart';
import '../../approutes.dart';
import '../attachafcebookprofile/attachfecebookprofile.dart';
import '../careerdetail/careerdetail.dart';
import '../dbpage/dbpage.dart';
import '../nowseewatchlist/nowseewtachlist.dart';
import '../profiledetail/personaldetail.dart';
import '../splash_screen.dart';
import '../useridentify/useridentify.dart';
import '../useroccupation/useroccupation.dart';
import '../verifysocialmedia/verifysocialmedia.dart';

class AppPages {
  static const Duration duration = Duration(milliseconds: 500);
  static const Transition transition = Transition.cupertino;
  static var list = [
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),

    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.loginVerification,
      page: () => const LoginVerification(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.namePage,
      page: () => const NamePage(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.emailPage,
      page: () => const EmailPage(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.dbBirthPage,
      page: () => const DbPage(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.userLive,
      page: () => const UserLive(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.userIdentify,
      page: () => const UserIdentify(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.userOccupation,
      page: () => const UserOccuPation(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.userDateNetworkPage,
      page: () => const DateNetworkPage(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.uploadProfilePage,
      page: () => const UploadProfile(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.verifySocialMediaPage,
      page: () => const VerifySocialMedia(),
    ),
 GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.attachFaceBookProfile,
      page: () => const AttachFaceBookProfile(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.attachProfileUrl,
      page: () => const AttachProfileUrl(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.termsCondition,
      page: () => const TermsCondition(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.nowWatchList,
      page: () =>  const NowseeWatchList(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.myProfilePage,
      page: () =>  const MyProfile(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.personalDetailPage,
      page: () =>  const PersonalDetail (),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.careerDetailPage,
      page: () =>  const CareerDetail(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.interestLifestyle,
      page: () =>  const InterestLifeStyle(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.personality,
      page: () =>  const Personality(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.partnerPreference,
      page: () =>  const PartnerPreFernce(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.successCompleted,
      page: () =>  const SucessCompleted(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.plans,
      page: () =>  const Plans(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.goldPlans,
      page: () =>  const GoldPlans(),
    ),

  ];
}
