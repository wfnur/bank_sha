import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/data_package_page.dart';
import 'package:bank_sha/ui/pages/data_provider_page.dart';
import 'package:bank_sha/ui/pages/data_success_page.dart';
import 'package:bank_sha/ui/pages/home_page.dart';
import 'package:bank_sha/ui/pages/onboarding_page.dart';
import 'package:bank_sha/ui/pages/pin_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_pin_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_success_page.dart';
import 'package:bank_sha/ui/pages/profile_page.dart';
import 'package:bank_sha/ui/pages/signin_page.dart';
import 'package:bank_sha/ui/pages/signup_page.dart';
import 'package:bank_sha/ui/pages/signup_success_page.dart';
import 'package:bank_sha/ui/pages/splash_page.dart';
import 'package:bank_sha/ui/pages/topup_amount_page.dart';
import 'package:bank_sha/ui/pages/topup_page.dart';
import 'package:bank_sha/ui/pages/topup_success.dart';
import 'package:bank_sha/ui/pages/transfer_amount_page.dart';
import 'package:bank_sha/ui/pages/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
      ],
      child: MaterialApp(
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
          '/': (context)=> const SplashPage(), //const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in':(context)=> const SigninPage(),
          '/sign-up':(context)=> const SignupPage(),
          //'/sign-up-set-profile':(context)=> const SignupSetProfilePage(),
          //'/sign-up-ktp-profile':(context)=> const SignupSetKTPPage(),
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
         '/transfer':(context)=> const TransferPage(),
         '/transfer-amount':(context)=> const TransferAmountPage(),
         '/data-provider':(context)=> const DataProviderPage(),
         '/data-package':(context)=> const DataPackagePage(),
         '/data-success':(context)=> const DataSuccessPage(),
         
        },
      ),
    );
  }
}