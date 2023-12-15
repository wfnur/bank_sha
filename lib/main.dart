import 'package:bank_sha/ui/pages/home_page.dart';
import 'package:bank_sha/ui/pages/onboarding_page.dart';
import 'package:bank_sha/ui/pages/sign_in_page.dart';
import 'package:bank_sha/ui/pages/sign_up_page.dart';
import 'package:bank_sha/ui/pages/sign_up_set_profile_page.dart';
import 'package:bank_sha/ui/pages/sign_up_set_ktp_page.dart';
import 'package:bank_sha/ui/pages/sign_up_success.dart';
import 'package:bank_sha/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        '/':(context) => const SplashPage(),
        '/home':(context) => const HomePage(),
        '/onboarding':(context) => const OnboardingPage(),
        '/sign-in':(context) => const SignInPage(),
        '/sign-up':(context) => const SignUpPage(),
        '/sign-up-set-profile':(context) => const SignUpSetProfilePage(),
        '/sign-up-ktp-profile':(context) => const SignUpSetKtpPage(),
        '/sign-up-success':(context) => const SignUpSuccess(),
        
      }
    );
  }
}