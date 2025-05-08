import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class PackageItem extends StatelessWidget {
  //final DataPlanModel dataPlan;
  final bool isSelected;
  final int amount;
  final num price;

  const PackageItem({
    super.key,
    //required this.dataPlan,
    this.isSelected = false, 
    required this.amount, 
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 175,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$amount GB',
            style: blackTextStyle.copyWith(
              fontSize: 32,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            formatCurrency(price),
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
