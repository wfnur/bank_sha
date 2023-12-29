import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
const ProfileEditPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile'
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children:  [
          const SizedBox(height: 40,),
          //box
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Username
                const CustomFormTextField(title: 'Username'),
                const SizedBox(height: 16,),
                //Full Name
                const CustomFormTextField(title: 'Full Name'),
                const SizedBox(height: 16,),
                //Email
                const CustomFormTextField(title: 'Email Address'),
                const SizedBox(height: 16,),
                //PASSWORD
                const CustomFormTextField(title: 'Password',obscureText: true,),
                const SizedBox(height: 16,),
                //Submit
                const SizedBox(height: 16,),
                //Button Sign in
                CustomFilledButton(
                      title: "Update",
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/profile-edit-success', (route) => false);
                      },
                ),
              ]
            ),
          ),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}