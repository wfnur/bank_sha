import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/widgets/buttons.dart';
import 'package:bank_sha/ui/pages/widgets/forms.dart';
import 'package:flutter/material.dart';

class SignupSetProfilePage extends StatelessWidget {
  const SignupSetProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            width: 155,
            height: 50,
            margin: const EdgeInsets.only(top:100,bottom: 100),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_logo_light.png')
              )
            ),
          ),
          Text(
            'Join Us to Unlock\nYour Growth',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold
            ),
          ),
          const SizedBox(height: 30,),
          
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor
            ),
            child: Column(
              children: [
                // Container(
                //   width: 120,
                //   height: 120,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: lightBackgroundColor
                //   ),
                //   child: Center(
                //     child: Image.asset('assets/ic_upload.png',width: 32,),
                //   ),
                // ),
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/img_profile.png')
                    )
                  ),
                ),
                const SizedBox(height: 16,),

                Text('Jhon Wijk',style: blackTextStyle.copyWith(fontWeight: medium,fontSize: 18),),
                const SizedBox(height: 30,),

                const CustomFormField(
                  title: 'Set Pin (6 digit Number)',
                  obscureText: true,
                ),
                const SizedBox(height: 30,),

                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up-ktp-profile');
                  },
                )
                      
              ],
            ),
          ),
        ],
      ),
    );
  }
}