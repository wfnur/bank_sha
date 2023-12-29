import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/bank_item.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TopupPage extends StatelessWidget {
const TopupPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Top Up'),),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          //wallet
          const SizedBox(height: 30,),
          Text('Wallet',style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold),),
          const SizedBox(height: 10,),
          Row(
            children: [
              Image.asset('assets/img_wallet.png',width: 80,),
              const SizedBox(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('0888 099973 012443',style: blackTextStyle.copyWith(fontSize: 16,fontWeight: medium),),
                  const SizedBox(height: 2,),
                  Text('Wahyu Fajar Nur Azim',style: greyTextStyle.copyWith(fontSize: 12),)
                  
                ],
              )
            ],
          ),
        
          //bank
          const SizedBox(height: 40,),
          Text('Select Bank',style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold),),
          
          const SizedBox(height: 14,),
          BankItem(bankImgURL: 'assets/img_bank_bca.png', bankName: 'Bank BCA', estimation: '50 min',isSelected: true,),
          BankItem(bankImgURL: 'assets/img_bank_bni.png', bankName: 'Bank BNI', estimation: '50 min'),
          BankItem(bankImgURL: 'assets/img_bank_mandiri.png', bankName: 'Bank Mandiri', estimation: '50 min'),
          BankItem(bankImgURL: 'assets/img_bank_ocbc.png', bankName: 'Bank OCBC', estimation: '50 min'),

          //button
          const SizedBox(height: 18,),
          CustomFilledButton(
            title: "Continue",
            onPressed: () {Navigator.pushNamed(context, '/topup-amount');},
          ),
          const SizedBox(height: 40,),
        ],
      ),
    );
  }
}