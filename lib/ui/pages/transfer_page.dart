import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/transfer_recent_user_item.dart';
import 'package:bank_sha/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
const TransferPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Transfer'),),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30,),
          Text('Search',style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold),),

          const SizedBox(height: 14,),
          const CustomFormTextField(title: 'by username',isShowTitle: false,),

          buildResults(),
          const SizedBox(height: 150,),
          CustomFilledButton(title: 'Continue',onPressed: (){
            Navigator.pushNamed(context, '/transfer-amount');
          },),
        ],
      ),
    );
  }

  Widget buildRecentUsers(){
    return Container(
      margin: const EdgeInsets.only(top:40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Users',style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold),),
          const SizedBox(height: 14,),

          const TransferRecentUserItem(imgURL: 'assets/img_friend1.png', name: 'Yoenna Jie', username: 'yoenna', isVerified: true),
          const TransferRecentUserItem(imgURL: 'assets/img_friend2.png', name: 'Nadyya Putri', username: 'nadd', isVerified: true),
          const TransferRecentUserItem(imgURL: 'assets/img_friend3.png', name: 'Wahyu Fajar', username: 'wfnur', isVerified: false),
        ],
      ),
    );
  }

  Widget buildResults(){
    return Container(
      margin: const EdgeInsets.only(top:40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Results',style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold),),
          const SizedBox(height: 14,),
          const Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              TransferResultUserItem(imgURL: 'assets/img_friend1.png', name: 'Yoenna Jie', username: 'yoenna', isVerified: true,isSelected:true),
              TransferResultUserItem(imgURL: 'assets/img_friend2.png', name: 'Nadyya Putri', username: 'nadd', isVerified: true),
              TransferResultUserItem(imgURL: 'assets/img_friend3.png', name: 'Wahyu Fajar', username: 'wfnur', isVerified: false),
            ],
          )
        ],
      ),
    );
  }
}