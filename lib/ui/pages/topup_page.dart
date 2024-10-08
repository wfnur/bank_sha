import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/widgets/bank_item.dart';
import 'package:bank_sha/ui/pages/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Up',
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
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          Row(
            children: [
              Image.asset(
                'assets/img_wallet.png',
                width: 80,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('09999 123334 12344',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Jhon Mayer',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ]
              )

            ],
          ),
          const SizedBox(
            height: 40,
          ),
          
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Column(
            children: [
              BankItem(name: 'Bank BCA', imageUrl: 'assets/img_bank_bca.png',isSelected: true,),
              BankItem(name: 'Bank BNI', imageUrl: 'assets/img_bank_bni.png'),
              BankItem(name: 'Bank Mandiri', imageUrl: 'assets/img_bank_mandiri.png'),
            ],
          ),

          const SizedBox(
            height: 12,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/topup-amount');
            },
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
