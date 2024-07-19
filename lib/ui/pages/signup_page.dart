import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/widgets/buttons.dart';
import 'package:bank_sha/ui/pages/widgets/forms.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //NOTE :fullname Input
                const CustomFormField(
                  title:'Fullname' ,
                ),
                const SizedBox(height: 16,),

                //NOTE :Email Input
                const CustomFormField(
                  title:'Email Address' ,
                ),
                const SizedBox(height: 16,),

                //NOTE : PASSWORD INPUT
                const CustomFormField(
                  title:'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 30,),

                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up-set-profile');
                  },
                )
                      
              ],
            ),
          ),
          const SizedBox(height: 50,),

          CustomTextButton(
            title: 'Sign In',
            onPressed: () {
              Navigator.pushNamed(context, '/sign-in');
            },
          ),
          
        ],
      ),
    );
  }
}