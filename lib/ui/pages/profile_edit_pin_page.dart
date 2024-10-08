import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/widgets/buttons.dart';
import 'package:bank_sha/ui/pages/widgets/forms.dart';
import 'package:flutter/material.dart';

class ProfileEditPinPage extends StatelessWidget {
  const ProfileEditPinPage({super.key});

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
                const CustomFormField(
                  title:'Old Pin' ,
                ),
                const SizedBox(height: 16,),

                const CustomFormField(
                  title:'New Pin' ,
                ),
                const SizedBox(height: 16,),

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