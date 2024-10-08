import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/home_page.dart';
import 'package:bank_sha/ui/pages/onboarding_page.dart';
import 'package:bank_sha/ui/pages/pin_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_pin_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_success_page.dart';
import 'package:bank_sha/ui/pages/profile_page.dart';
import 'package:bank_sha/ui/pages/signin_page.dart';
import 'package:bank_sha/ui/pages/signup_page.dart';
import 'package:bank_sha/ui/pages/signup_set_ktp_page.dart';
import 'package:bank_sha/ui/pages/signup_set_profile_page.dart';
import 'package:bank_sha/ui/pages/signup_success_page.dart';
import 'package:bank_sha/ui/pages/splash_page.dart';
import 'package:bank_sha/ui/pages/topup_amount_page.dart';
import 'package:bank_sha/ui/pages/topup_page.dart';
import 'package:bank_sha/ui/pages/topup_success.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: blackColor),
          titleTextStyle: blackTextStyle.copyWith(fontSize: 20,fontWeight: semiBold)
        )
      ),
      //home: SignupSuccessPage(),
      routes: {
        '/': (context)=> const HomePage(), //const SplashPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/sign-in':(context)=> const SigninPage(),
        '/sign-up':(context)=> const SignupPage(),
        '/sign-up-set-profile':(context)=> const SignupSetProfilePage(),
       '/sign-up-ktp-profile':(context)=> const SignupSetKTPPage(),
       '/sign-up-success':(context)=> const SignupSuccessPage(),
       '/home':(context)=> const HomePage(),
       '/profile':(context)=> const ProfilePage(),
       '/pin':(context)=> const PinPage(),
       '/profile-edit':(context)=> const ProfileEditPage(),
       '/profile-edit-pin':(context)=> const ProfileEditPinPage(),
       '/profile-edit-success':(context)=> const ProfileEditSuccesspage(),
       '/topup':(context)=> const TopupPage(),
       '/topup-amount':(context)=> const TopupAmountPage(),
       '/topup-success':(context)=> const TopupSuccessPage(),
       
      },
    );
  }
}