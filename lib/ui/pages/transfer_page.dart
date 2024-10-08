import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/transfer_amount_page.dart';
import 'package:bank_sha/ui/pages/widgets/buttons.dart';
import 'package:bank_sha/ui/pages/widgets/forms.dart';
import 'package:bank_sha/ui/pages/widgets/transfer_result_user_item.dart';
import 'package:bank_sha/ui/pages/widgets/transfer_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: 'by username',
            isShowTitle: false,
          ),

          //buildRecentUsers(),
          buildResult(),

          const SizedBox(
            height: 80,
          ),
          CustomFilledButton(
              title: 'Continue',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/transfer-amount'
                );
              },
            ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget buildRecentUsers(){
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const TransferRecentUserItem(
            name: 'Chantika Indah', 
            imageUrl: 'assets/img_friend1.png', 
            username: 'chantikai', 
            isVerified: true
          ),
          const TransferRecentUserItem(
            name: 'Yulie Sartika', 
            imageUrl: 'assets/img_friend2.png', 
            username: 'ysartika', 
            isVerified: true
          ),
          const TransferRecentUserItem(
            name: 'Bumi Harjo', 
            imageUrl: 'assets/img_friend3.png', 
            username: 'Bumiharjo', 
            isVerified: true
          ),
        
        ]
      )
    );
  }

  Widget buildResult(){
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              TransferResultUserItem(
                name: 'Chantika Indah', 
                imageUrl: 'assets/img_friend1.png', 
                username: 'chantikai', 
                isVerified: true,
                isSelected:  true,
              ),
              TransferResultUserItem(
                name: 'Yulie Sartika', 
                imageUrl: 'assets/img_friend2.png', 
                username: 'ysartika', 
                isVerified: true
              ),
              TransferResultUserItem(
                name: 'Bumi Harjo', 
                imageUrl: 'assets/img_friend3.png', 
                username: 'Bumiharjo', 
                isVerified: true
              ),
            ],
          )
        ]
      )
    );
  }
}