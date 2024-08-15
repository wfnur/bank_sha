import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/widgets/buttons.dart';
import 'package:bank_sha/ui/pages/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('assets/img_profile.png'))
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor
                      ),
                      child: Center(
                        child: Icon(Icons.check_circle,color: greenColor,size: 22,)
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Text('Syahna Hanna', style: blackTextStyle.copyWith(fontSize: 18,fontWeight: medium),),
                const SizedBox(height: 40,),
                ProfileMenuItem(iconUrl: 'assets/ic_edit_profile.png', title: 'Edit Profile',onTap: (){},),
                ProfileMenuItem(iconUrl: 'assets/ic_pin.png', title: 'My Pin',onTap: (){Navigator.pushNamed(context, '/pin');},),
                ProfileMenuItem(iconUrl: 'assets/ic_wallet.png', title: 'Wallet Settings',onTap: (){},),
                ProfileMenuItem(iconUrl: 'assets/ic_reward.png', title: 'My Rewards',onTap: (){},),
                ProfileMenuItem(iconUrl: 'assets/ic_help.png', title: 'Help Center',onTap: (){},),
                ProfileMenuItem(iconUrl: 'assets/ic_logout.png', title: 'Logout',onTap: (){},),
              ],
            ),
          ),
          const SizedBox(height: 87,),
          CustomTextButton(title: 'Report a problem',onPressed: () {},),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}