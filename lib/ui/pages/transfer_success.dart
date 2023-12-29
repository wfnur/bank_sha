import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TransferSuccess extends StatelessWidget {
const TransferSuccess({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor
              ),
              child: Center(
                child: Icon(
                  Icons.check_circle,
                  color: greenColor,
                  size: 70,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            //heading
            Text(
              'Transfer Berhasil',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 26,),

            //caption
            Text(
              'Use the money wisely\nand grow your finance',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60,),

            //button
            CustomFilledButton(
              title: "Back to Home",
              width: 183,
              onPressed: () {Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);},
            ),
          ],
        ),
      ),
    );
  }
}