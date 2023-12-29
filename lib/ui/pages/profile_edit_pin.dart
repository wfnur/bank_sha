import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class ProfileEditPin extends StatelessWidget {
const ProfileEditPin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit PIN'
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
                //Old PIN
                const CustomFormTextField(title: 'Old PIN',obscureText: true,),
                const SizedBox(height: 16,),
                //New PIN
                const CustomFormTextField(title: 'New PIN',obscureText: true,),
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
        ],
      ),
    );
  }
}