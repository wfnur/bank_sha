import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/widgets/buttons.dart';
import 'package:flutter/material.dart';

class SignupSuccessPage extends StatelessWidget {
  const SignupSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Akun Berhasil\nTerdaftar',
              style: blackTextStyle.copyWith(fontSize: 20,fontWeight: semiBold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 26,),

            Text(
              'Grow your finance start\n together with us',
              style: blackTextStyle.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50,),

            CustomFilledButton(
              title: 'Get Started',
              onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, '/home',(route)=> false);
              },
              width: 183,
              )
          ],
        ),
      ),
    );
  }
}