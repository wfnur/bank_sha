import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/widgets/buttons.dart';
import 'package:bank_sha/ui/pages/widgets/forms.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile') ,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
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
                //NOTE :Username Input
                const CustomFormField(
                  title:'Username' ,
                ),
                const SizedBox(height: 16,),

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
                  title: 'Update Now',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/profile-edit-success',(route)=>false);
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