import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 22),
            decoration: BoxDecoration(color: whiteColor,borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                //photo profile
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('assets/img_profile.png',))
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),

                //Name
                Text('Wahyu Fajar Nur Azim',style: blackTextStyle.copyWith(fontSize: 18,fontWeight: medium),),
                const SizedBox(height: 40,),

                //list menu
                ProfileMenuItem(
                  iconURL: 'assets/ic_edit_profile.png', 
                  title: 'Edit Profile',
                  onTap: (){Navigator.pushNamed(context, '/pin');},
                ),
                ProfileMenuItem(iconURL: 'assets/ic_pin.png', title: 'My Pin',onTap: (){},),
                ProfileMenuItem(iconURL: 'assets/ic_wallet.png', title: 'Wallet Setting',onTap: (){},),
                ProfileMenuItem(iconURL: 'assets/ic_reward.png', title: 'My Rewards',onTap: (){},),
                ProfileMenuItem(iconURL: 'assets/ic_help.png', title: 'Help Center',onTap: (){},),
                ProfileMenuItem(iconURL: 'assets/ic_logout.png', title: 'Logout',onTap: (){},),
              ],
            ),
          ),
          const SizedBox(height: 87,),
          CustomTextButton(title: 'Report a Problem',onPressed: (){},),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}