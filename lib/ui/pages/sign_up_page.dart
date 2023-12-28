import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
const SignUpPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          //Logo
          Container(
            width: 155,
            height: 50,
            margin: const EdgeInsets.only(top: 100,bottom: 100),
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img_logo_light.png'))
            ),
          ),
          
          //Caption
          Text(
            'Join Us to Unlock\nYour Grow',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold
            ),
          ),
          const SizedBox(height: 30,),
          
          //Box
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Name
                const CustomFormTextField(title: 'Full Name'),
                const SizedBox(height: 16,),
                //EMAIL
                const CustomFormTextField(title: 'Email Address'),
                const SizedBox(height: 16,),
                //PASSWORD
                const CustomFormTextField(title: 'Password',obscureText: true,),
                const SizedBox(height: 16,),
                //Submit
                const SizedBox(height: 16,),
                //Button Sign in
                CustomFilledButton(
                      title: "Continue",
                      onPressed: () {Navigator.pushNamed(context, '/sign-up-set-profile');},
                    ),
              ]
            ),
          ),
          const SizedBox(height: 30,),

          //Create new Accout
          CustomTextButton(
            title: "Sign In",
            onPressed: () {Navigator.pushNamed(context, '/sign-in');},
          )

        ],
      ),
    );
  }
}