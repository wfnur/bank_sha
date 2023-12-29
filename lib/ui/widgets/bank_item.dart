import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class BankItem extends StatelessWidget {
  final String bankImgURL;
  final String bankName;
  final String estimation;
  final bool isSelected;
const BankItem({ 
  Key? key, 
  required this.bankImgURL, 
  required this.bankName, 
  required this.estimation,
  this.isSelected = false }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: isSelected ? blueColor : whiteColor
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(bankImgURL,height: 30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(bankName,style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium)),
              Text(estimation,style: greyTextStyle),
              
            ],
          )
        ],
      ),
    );
  }
}