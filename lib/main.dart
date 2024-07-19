import 'package:bank_sha/ui/pages/home_page.dart';
import 'package:bank_sha/ui/pages/onboarding_page.dart';
import 'package:bank_sha/ui/pages/signin_page.dart';
import 'package:bank_sha/ui/pages/signup_page.dart';
import 'package:bank_sha/ui/pages/signup_set_ktp_page.dart';
import 'package:bank_sha/ui/pages/signup_set_profile_page.dart';
import 'package:bank_sha/ui/pages/signup_success_page.dart';
import 'package:bank_sha/ui/pages/splash_page.dart';
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
      },
    );
  }
}