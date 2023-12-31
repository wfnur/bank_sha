import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeUserItem extends StatelessWidget {
  final String imgURL;
  final String username;
const HomeUserItem({ 
  Key? key,
  required this.imgURL,
  required this.username
}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: 90,
      height: 120,
      margin: const EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(bottom:13) ,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(imgURL),fit: BoxFit.cover)
            ),
          ),
          Text('@$username',style: blackTextStyle.copyWith(fontWeight: medium,fontSize: 12))
        ],
      ),
    );
  }
}